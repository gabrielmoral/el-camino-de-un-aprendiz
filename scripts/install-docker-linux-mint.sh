#!/usr/bin/env bash
set -Eeuo pipefail

usage() {
  cat <<'USAGE'
Install Docker Engine from Docker's official apt repository on Linux Mint.

Usage:
  scripts/install-docker-linux-mint.sh [--add-current-user]

Options:
  --add-current-user  Add the invoking user to the docker group after install.
                      You must log out and back in before it takes effect.
  -h, --help          Show this help.
USAGE
}

log() {
  printf '%s\n' "$*"
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

add_current_user=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --add-current-user)
      add_current_user=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "Unknown option: $1"
      ;;
  esac
  shift
done

command -v apt-get >/dev/null 2>&1 || die "apt-get is required."
command -v dpkg >/dev/null 2>&1 || die "dpkg is required."

if [[ ! -r /etc/os-release ]]; then
  die "/etc/os-release is required to detect Linux Mint."
fi

# shellcheck disable=SC1091
. /etc/os-release

if [[ "${ID:-}" != "linuxmint" ]]; then
  die "This script is intended for Linux Mint. Detected: ${PRETTY_NAME:-unknown}."
fi

ubuntu_codename="${UBUNTU_CODENAME:-}"

if [[ -z "$ubuntu_codename" && -r /etc/upstream-release/lsb-release ]]; then
  # Linux Mint stores the upstream Ubuntu release here on some versions.
  # shellcheck disable=SC1091
  . /etc/upstream-release/lsb-release
  ubuntu_codename="${DISTRIB_CODENAME:-}"
fi

if [[ -z "$ubuntu_codename" ]]; then
  die "Could not determine the upstream Ubuntu codename for this Linux Mint release."
fi

arch="$(dpkg --print-architecture)"

case "$arch" in
  amd64|arm64|armhf)
    ;;
  *)
    die "Unsupported architecture for Docker apt packages: $arch"
    ;;
esac

if [[ "${EUID}" -eq 0 ]]; then
  sudo_cmd=()
else
  command -v sudo >/dev/null 2>&1 || die "sudo is required when not running as root."
  sudo_cmd=(sudo)
fi

run_apt() {
  "${sudo_cmd[@]}" env DEBIAN_FRONTEND=noninteractive apt-get "$@"
}

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

log "Installing Docker apt prerequisites..."
run_apt update
run_apt install -y ca-certificates curl

log "Installing Docker apt repository key..."
"${sudo_cmd[@]}" install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o "$tmp_dir/docker.asc"
"${sudo_cmd[@]}" install -m 0644 "$tmp_dir/docker.asc" /etc/apt/keyrings/docker.asc

log "Configuring Docker apt repository for Ubuntu $ubuntu_codename ($arch)..."
printf 'deb [arch=%s signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu %s stable\n' \
  "$arch" \
  "$ubuntu_codename" \
  > "$tmp_dir/docker.list"
"${sudo_cmd[@]}" install -m 0644 "$tmp_dir/docker.list" /etc/apt/sources.list.d/docker.list

log "Installing Docker Engine, CLI, Buildx, and Compose plugin..."
run_apt update
run_apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

if command -v systemctl >/dev/null 2>&1; then
  log "Enabling and starting Docker service..."
  "${sudo_cmd[@]}" systemctl enable --now docker
fi

if [[ "$add_current_user" == true ]]; then
  target_user="${SUDO_USER:-${USER:-}}"

  if [[ -z "$target_user" || "$target_user" == "root" ]]; then
    log "Skipping docker group membership because no non-root invoking user was detected."
  else
    log "Adding $target_user to the docker group..."
    "${sudo_cmd[@]}" usermod -aG docker "$target_user"
    log "Log out and back in before running docker without sudo."
  fi
fi

log "Docker installation complete."
docker --version
docker compose version
