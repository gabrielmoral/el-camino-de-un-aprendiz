---
layout: post
title: 'Designing Data-Intensive Applications. Chapter 5'
date: 2018-12-02 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- data-intensive-applications
- book
language: en
---

Chapter five, **Replication**, faces the benefits and issues when data replication happens. It explains the main different approaches to replication and their peculiarities.

## Replication

There are several reasons why we want the data replicated:

* Latency. Data physically closer to your users.
* High availability.
* Scalability.

**Leaders and followers**

Leader nodes are responsible for accepting client write requests, which will be written firstly in the leader and then sent to their followers.

Followers are meant to save the data sent by the leader and store it. They can also accept reads from clients.

The communication interaction between leaders and followers may be **synchronous** or **asynchronous**. The synchronous approach is simpler but impractical if applied to every follower because with just one faulty follower the write cannot be processed. The async mode is faster but it is important to figure it out what happens when replication lag increases and servers fail.  

This configuration between leaders and followers may variate for two different reasons:
* A leader does no longer respond and a follower needs to be promoted as a leader.
* New followers are added to the network to redistribute the load.

**Multi-leader replication**

This configuration usually makes sense when there is more than one data center involved. 

In a multi-leader configuration, you can have a leader in each data center and they are responsible to coordinate replication between themselves.
It is necessary to figure it out what happens with conflict resolution when several writes occur to the same key in different leaders.

**Leaderless replication**

In this configuration, clients send write and read requests to every replica in parallel to detect and correct nodes with stale data.

This chapter contains several concepts like conflict resolution mechanisms or quorums for reading and writing that I decided not to mention in this summary for brevity. So, if you are interested in knowing more about those topics I suggest you read the chapter to fully understand it.

[<- Chapter 4. Storage and retrieval]({% post_url 2018-11-25-designing-data-intensive-applications-chapter-4 %})