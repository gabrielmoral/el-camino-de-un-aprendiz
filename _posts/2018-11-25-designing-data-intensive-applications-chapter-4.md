---
layout: post
title: 'Designing Data-Intensive Applications. Chapter 4'
date: 2018-11-25 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- data-intensive-applications
- book
language: en
---

Chapter four, **Encoding and Evolution**, is the last one on the foundations of data systems section. It explores the different encodings formats used in applications and how that choice might affect the evolvability of the system. It also discusses several models of data flows where encodings are important.  

## Encoding and Evolution

Usually changing a data format or schema requires a change to the application code. That change will probably need to maintain compatibility in two directions, backward and forward.

**Backward compatibility.**
The newer code reads data that was written by older code.

**Forward compatibility.** 
The older code reads data that was written for newer code.

### Encodings

There are at least two different representations about how programs work with data: 
* In memory.
* When you want to write data to a file or send it over the network.

The two types of translation between both are **encoding**, from in-memory to a byte sequence, and **decoding**, from a byte sequence to in-memory.

Almost every language have built-in functionality for encoding in-memory and usually it is a bad idea to use that built-in feature. Decoding the data in another language is very difficult and normally they are not especially efficient. For this reason, there are several standard encodings that can be used for several programming languages like **XML** and **JSON**.

There are also binary encoding libraries that can compact and parse the data faster. **MessagePack**, **Thrift**, **Protocol Buffers** and **Avro** are some interesting alternatives to take into account.

### Data flows

Some modes of data flow where the encoding is important:

* **Databases**. The process of writing encodes the data and reading decodes it.
* **RPC and REST**. A client encodes a request, the server decodes it. Then the server encodes the response and finally, the client decodes it.
* **Asynchronous passing messages like message brokers and actors**. The sender encodes the message and the recipient decodes it.


The first part of the book has settled the fundamentals to explore in details how distributed data works.

[<- Chapter 3. Storage and retrieval]({% post_url 2018-11-18-designing-data-intensive-applications-chapter-3 %})

<p style="text-align: right">
<a href="{% post_url 2018-12-02-designing-data-intensive-applications-chapter-5 %}">Chapter 5. Replication -></a>
</p>