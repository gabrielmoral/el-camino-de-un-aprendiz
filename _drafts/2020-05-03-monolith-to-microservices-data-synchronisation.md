---
layout: post
title: 'Monolith to microservices - Data synchronisation'
date: 2020-05-04 18:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
language: en
---

Continuing...
### **Syncronisation**

#### **Sync data in application**
#### **Tracer write**

Splitting tables (Paragraph)

#### **Split table**
This pattern is used to separate a part of the table schema that belongs to different bounded contexts. Data that is updated by two different parts of the system has to be placed behind bounded context who owns and modifies through it.

#### **Move foreign key relationship to code**
To split new microservices the foreign key table relationships between different bounded contexts need to be broken apart. We should only do this if we are 100% sure, an aggregate should not be split. Given that the new microservice still needs the data from the other bounded context, how is the data going to be accessed? A possible solution is to expose the data differently. This change will probably introduce some latency so needs to be taken into account.

A different problem to solve is how the application is going to handle data consistency. For instance, Service A exposes some data that Service B needs, at some point Service A removes a subset of data in its side, how is Service B going to be affected? A few possible solutions to this problem are:
- Check before delete item.
- Handle deletion gracefully within the microservices affected.
- Do not allow hard deletion.
