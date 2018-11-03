---
layout: post
title: 'Designing Data-Intensive Applications. Chapter 1'
date: 2018-11-03 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- data-intensive-applications
- book
---

The current book in the readers club is [**Designing Data-Intensive Applications**](https://www.goodreads.com/book/show/23463279-designing-data-intensive-applications) by Martin Kleppmann and I will try to write a little post with the highlights of every chapter we read. These posts will not replace the read of the book since there will be a lot of things I will not consider so I encourage you to read the book.

**Chapter 1 - Reliable, scalable and maintainable Applications**

When the developers think about data systems they become data system designers instead of being just application developers.

**Reliability**

Continuing to work correctly even when the situation is wrong.

* Hardware errors. Using software fault-tolerant techniques in preference to hardware redundancy.
* Software failures. Measuring, testing, monitoring and analyzing the system behavior to prevent software errors.
* Human errors. Can be prevented decoupling the places where people make most mistakes providing a fully non production environment to explore and experiment with real data. Also testing edge cases might help dealing with human errors.

We may choose to sacrifice reliability in order to avoid costs because we want a MVP or we want to prove an unknown market but we should be very conscious of when we are cutting edges.

**Scalability**

A system's ability to cope with increased load.

In terms of measuring the system, the mean is not the best metric to use  because the typical response time it doesn't tell you how many users experienced that delay. Usually is better to use percentiles.

An elastic system can be useful if load is unpredictable. Manual scaled systems are simple an may be have fewer operational surprises.

There is no such a thing as a generic architecture like one size fits all. It depends on the specific problem of the application.

**Maintainability**

It is basically the idea of making the life easier for the people who is involved with the system. The three basic pilar are:

* Operability. Monitoring the health of the system and tracking down problems. 
* Simplicity. Keeping the system easy to understand.
* Evolvability. Enabling making changes in the future.


My college [Fermín] (https://twitter.com/mintxelas) created a mind map to connect ideas and concepts of this chapter.

<img src="{{ "/assets/chapter1.map.jpg" | absolute_url }}" alt="Chapter 1 map" />
