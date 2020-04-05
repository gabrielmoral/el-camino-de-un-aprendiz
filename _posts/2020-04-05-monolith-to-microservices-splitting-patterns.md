---
layout: post
title: 'Monolith to microservices - Splitting patterns'
date: 2020-04-05 18:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
language: en
---

During a period Iḿ going to be working with the team trying to improve the evolvability of a system with a lot of responsibilities. That involves splitting apart it into a few microservices. The first thing we did in the team was to buy the book called [Monolith to
Microservices Evolutionary Patterns to Transform Your Monolith](https://www.goodreads.com/book/show/44144499-monolith-to-microservices) written by Sam Newman because we knew it would help us decide from where to start.

On the third chapter of the book, Sam enumerates and explains a few patterns that will help when extracting microservices:

## **Strangler Fig Application**

It helps to move functionality out of the monolith without doing a big bang release.

1. Identify asset to move.
2. Move asset (copy-paste if possible).
3. Redirect calls.

It's recommended to extract a vertical slice of the functionality.
To use it with success, the functionality being extracted has to map clearly to an inbound call.

#### Where to use it
To move functionality to the new service without touching or making any change to it.

## **UI Composition**
Show together with a group of pages or widgets exposed by different microservices. Allow vertical slices to be migrated.

#### Where to use it
When composing UI from a different microservices makes sense. It must be possible to modify the existing user interface for the new functionality to be added.

## **Branch by Abstraction**
It allows adding a different implementation for the functionality you want to extract that will coexist with the old one until ready to migrate.

1. Create abstraction of the functionality to be replaced.
2. Replace clients for them to use the abstraction.
3. Create the new implementation of the abstraction.
4. Change the abstraction to use the new implementation.
5. Clean the old implementation and abstraction.

It can be combined with feature toggles to change between implementations.
When switching to the new implementation, keeping the old one for some time can be useful as a fallback mechanism if something goes wrong with the new code.

#### Where to use it
If the functionality to be decomposed is deeper inside in the system and it is not possible to intercept the calls at the monolith boundaries.

## **Parallel Run**
It is used to mitigate the risk of introducing the new implementation having errors. The pattern allows comparing the results of the new implementation with the old one to verify that the new one will behave correctly. Only one implementation is, in this case, the source of truth.

#### Where to use it
Use it when the functionality to be replaced is high risk.

## **Decorating Collaborator**
Introducing a proxy that can intercept inbound requests or responses from the monolith allows adding new behaviour that is in a new microservice. 

#### Where to use it
Use it when the monolith code is complex or cannot be modified.

## **Change Data Capture**
Instead of intercepting calls to the monolith, the pattern intercepts changes in the data store. A few options to implement this pattern can be:

- Database Triggers.
- Transaction log pollers.
- Batch scheduled process.

#### Where to use it
If there is a need to act to a data change in the monolith and there are no other options to intercept it differently. 


**Useful articles about this topic**

- [StranglerFigApplication](https://martinfowler.com/bliki/StranglerFigApplication.html)
- [EventInterception](https://mrtinfowler.com/bliki/EventInterception.html)
- [AssetCapture](https://martinfowler.com/bliki/AssetCapture.html)
- [Make Large Scale Changes Incrementally with Branch By Abstraction](https://continuousdelivery.com/2011/05/make-large-scale-changes-incrementally-with-branch-by-abstraction/)
- [Legacy Application Strangulation: Case Studies](https://paulhammant.com/2013/07/14/legacy-application-strangulation-case-studies/)
- [Micro Frontends](https://martinfowler.com/articles/micro-frontends.html)
- [What are Micro Frontends?](https://micro-frontends.org/)
- [Refactoring Legacy Code with the Strangler Fig Pattern](https://engineering.shopify.com/blogs/engineering/refactoring-legacy-code-strangler-fig-pattern)