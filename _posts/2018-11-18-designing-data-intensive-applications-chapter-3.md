---
layout: post
title: 'Designing Data-Intensive Applications. Chapter 3'
date: 2018-11-18 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- data-intensive-applications
- book
language: en
---

The third chapter of the book is divided into two main sections. The first one explains the most typical data structures to store information in a database and the second describes the differences between OLTP and data warehouse databases. This post will not deep into much detail so I would recommend you to read the chapter to fully understand how these two data structured models work in details. 

#### Storage and Retrieval

**Data structures**

Log-structured and B-Trees are the most common data structures used.

The log-structured model allows appending data to files and deleting obsolete files, but never updates an existing file that has already been written. Some examples of log-structured databases are Bitcask, LevelDB, Cassandra, HBase and Lucene.

On the other hand, we have the B-tree type model where the storage is divided into fixed pages that can be overwritten. The majority of the relational databases use this model.

As an unwritten rule, log-structured models are faster for writes and B-trees are better on readings. Reads are slower on log-structured because they have to check several data structures at different stages of compaction.

Of course, you will need to test which model suits you better for each specific case.

**OLTP and data warehouse databases**

OLTP (Online transaction processing) systems are typically user-oriented, which means they have to deal with a high volume of requests. They are designed to be effective when only touching a small number of records in each query.

On the other side, data warehouse databases are analytic systems prepared to be used by analytics people. They handle a much lower volume of requests but these queries are usually very demanding, scanning millions of records in a short time. 
