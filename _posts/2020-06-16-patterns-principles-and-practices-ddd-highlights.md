---
layout: post
title: 'Patterns, Principles, and Practice of Domain Driven Design book highlights'
date: 2020-06-16 18:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
language: en
---

Recently in Aprendices book club, we have been reading [Patterns, Principles, and Practice od Domain Driven Design book](https://www.goodreads.com/book/show/25531393-patterns-principles-and-practices-of-domain-driven-design) and I'd like to share a few points I consider important.

#### Domain Driven Design

DDD is an approach to software development where the focus is on the **core domain** of the business.
Subdomains using DDD should be treated as a **product** rather than a project. They are the part of the business that matters, they will grow over time and need special care by everyone. Not all the subdomains need to be implemented using DDD, DDD fits perfectly for the core domain.

**Shared/Ubiquitous language** (UL) helps to connect the software model and the analysis model using the same terminology. By using UL with the business, the communication will be more explicit and both models will feed back and enrich. This is a key part of DDD that enables the domain experts and development teams to collaborate together.

Domain experts are usually people that are part of the organization, they can offer expertise in the problem domain. They could be a user of a current system. When talking with them try to keep the conversation focused on the problem space and do not jump to implementation details.

#### Implementation

- Not all the bounded context need to be the same shape nor implemented using DDD, the important is to have clear **boundaries** between them. 
- Physical boundaries are better to enforce clean models.
- A domain concept in one bounded context might mean something different in another bounded context. 

##### Tactical patterns

- **Entities** are domain concepts in the domain model. They are defined by their identity.
- **Value objects** represent domain concepts by their treats, they don't require identity.
- **Domain services** encapsulate domain logic that doesn't fit in entities/value objects.
- **Aggregates** define transactional concurrency boundaries per object graph, they group entities and value objects. The aggregate must be the entry point for any business case.
- **Repositories** are responsible for persisting and hydrating aggregates as an atomic unit. It abstracts the underlying persistence store from the domain model. Repositories are *not* required for UI/reporting purposes. Depending on the underlying persistence you domain model might be compromised, your domain model should be created without thinking on the persistence.

##### Desing patterns

- **CQRS** splits the domain model into two, a read model and a write model (transactional model). By applying this pattern, the transactional model does not need to expose internal state and be aware of the presentation concerns. It also helps to optimize/scaling the two models independently. There might be trade-offs when applying this pattern due to eventual consistency to the write or read model. Business must understand the *trade-off*.


This information here is not even 1% of you will get from reading the book, if you are new to DDD or you would like to reinforce some knowledge I encourage you to give it a try.