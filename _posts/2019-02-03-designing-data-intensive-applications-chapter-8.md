---
layout: post
title: 'Designing Data-Intensive Applications. Chapter 8'
date: 2019-02-03 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- data-intensive-applications
- book
language: en
---

So far, this chapter is the most depressing and pessimistic until now. Which is also good because it helps us to realise that not all is a bed of roses in distributed systems. Martin Kleppmann explains **The Trouble with Distributed Systems** and why it is naive to think that faults are the exception. For that reason, we should consider a range of possible faults such as **Unreliable Networks** or **Unreliable Clocks**.

### Unreliable Networks

In shared-nothing systems, the network is the only way machines can communicate between themselves. The network cannot guarantee when a message will arrive or even if it will arrive at all. A few things can go wrong:

- The request has been lost.
- The request may have been queued and will be delivered later.
- The remote node has failed.
- The remote node may have temporarily stopped responding.
- The remote node may have been processed the request but the response has been lost on the network.  
- The remote node may have been processed the request but the response has been delayed and will be delivered later.

These issues are impossible to identify, you only know you have not received a response. The usual way of handling that is through **timeouts**. With timeouts, some questions arise, i.e. how long the timeout should be? should we retry after a while?  


### Unreliable Clocks

The communication in distributed systems is tricky because sometimes is not immediate, it takes time for a message to reach the destination machine.

Moreover, each machine on the network has its own clock, which is not a perfectly accurate hardware component. The most common option to synchronize clocks is Network Time Protocol (NTP) where the clock adjusts taking into account the time reported for a group of servers. Although, there are more reliable options like GPS receivers.

The methods for getting a clock to tell the right time are no accurate or reliable as we might think. But it is also true that most data processing systems do not need real-time guarantees. The effort to build it taking those details into account may be neither appropriate nor economical.

<br>

In summary, a distributed system cannot rely on a single node because that node can fail unexpectedly. Distributed systems rely on quorum algorithms. The nodes need an absolute majority of more than half of them to take a decision (there are other kinds of quorums). For instance, even if a quorum decides that a node is dead the node will be declared dead, even although the node is still alive.



<img src="{{ "/assets/chapter8.map.jpg" | absolute_url }}" alt="Chapter 8 map" />
Provided by <a href="https://twitter.com/mintxelas" target="_blank">@mintxelas</a>

[<- Chapter 7. Transactions]({% post_url 2019-01-26-designing-data-intensive-applications-chapter-7 %})