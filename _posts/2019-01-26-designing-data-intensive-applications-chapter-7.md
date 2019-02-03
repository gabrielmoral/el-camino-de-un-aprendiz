---
layout: post
title: 'Designing Data-Intensive Applications. Chapter 7'
date: 2019-01-26 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- data-intensive-applications
- book
language: en
---

In this chapter the author deeps in the world of transactions. **Transactions** have been for decades the mechanism of choice for simplifying:
- Databases failures.
- Network interruptions.
- Application crashes.
- Race conditions.


### ACID

It is important to define what ACID means since it is used to describe the safety guarantees provided by transactions.

**Atomicity** is the ability to abort a transaction on error have all the writes from that transaction discarded.

**Consistency** is in part relied on the application to preserve certain statements about the data (invariants). Specific invariants can be checked by the database, e.g., foreign keys.

**Isolation** means that concurrent transactions are isolated from each other. Each transaction can pretend that is the only one running on the database.

**Durability** promises that one the data has been committed successfully, the data will remain there. 

It is worth to mention that ACID implementations are different in each database vendor.


### Weak Isolation Levels

Databases have tried to hide concurrency problems from application developers by providing *transaction isolation*. In practice, it is not that simple. There is a level of isolation called *Serializable isolation* that comes with the price of worst performance. For that reason database systems implement weaker levels of isolation.

#### Read Committed

- Reading will only read data already committed (no dirty reads).
- Writing will only override data already committed (no dirty writes).

Commonly databases prevent dirty writes using row-level lock where only one transaction can hold the lock for a given object.

Most databases avoid dirty reads remembering the old committed value and the new value for a written object. Having that, the database can provide the old value for reads until the new value is committed. 


It is the default option in Oracle 11g, PostgreSQL, SQL Server 2012, MemSQL.

#### Snapshot isolation

With Snapshot isolation level transactions read from a consistent snapshot of the database. This technique avoids other transactions to see data that is changed by another transaction, each transaction sees only the old data from that particular point in time.


#### Preventing Lost Updates

The lost update problem can happen when the application reads a value from the database and modifies it. If two transactions do this concurrently, one of the updates might be lost because the second update does not have the first modification.

In order to avoid this issue a few solutions can be applied:

- Atomic write operations avoid the necessity of reading first from the database to modify a value.
- The application can lock the objects that are going to be modified rejecting the second update.



### Serializability

Serializable isolation is the strongest isolation level. It guarantees even transactions run in parallel, the result will be as if they had executed one at a time. All the race conditions are prevented by the database.

Most of the databases today implement serializable isolation use one of these techniques:

- Executing transactions in a serial order (Actual Serial Execution).
- Two-phase locking.
- Optimistic concurrency control techniques such as serializable snapshot isolation (SSI).



Since this post only touches the surface of the book chapter. I would encourage you to read the full book chapter to understand better how transactions work behind the scenes. 


<img src="{{ "/assets/chapter7.map.jpg" | absolute_url }}" alt="Chapter 7 map" />
Provided by <a href="https://twitter.com/mintxelas" target="_blank">@mintxelas</a>

[<- Chapter 6. Partitioning]({% post_url 2019-01-19-designing-data-intensive-applications-chapter-6 %})

<p style="text-align: right">
<a href="{% post_url 2019-02-03-designing-data-intensive-applications-chapter-8 %}">Chapter 8. The Trouble with Distributed Systems -></a>
</p>