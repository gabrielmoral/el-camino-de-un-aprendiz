---
layout: post
title: 'Abstract Factory code smell refactoring'
date: 2018-07-21 13:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- Code smell
- Refactoring
---

Reading the book **Dependency Injection in .NET second edition** I realised Abstract Factories could become a problem and a code smell in our codebases.

The authors of the book demonstrate that Abstract Factories increase the number of dependencies of a consumer, which could be a problem since testing and mantaing the code of the consumer will be more difficult. (Chapter 6 Code Smells, Section 6.2 Abuse of Abstract Factories).

The example in the repo tries to refactor that code smell. It simulates the problem of having to decide in runtime what is the right implementation depending of the user choice.

The example uses StructureMap as a DI container but that is not really needed. I just meant to use it in a .NET Core project. 

You can find te repo here https://github.com/gabrielmoral/AbstractFactorySmell.

The commit [488be61f11905186f04e17c8dc5baa469d74f3fc](https://github.com/gabrielmoral/AbstractFactorySmell/commit/488be61f11905186f04e17c8dc5baa469d74f3fc)  solves the problem using an abstract factory and the commit [1d3493a1652617d92666d00a993b9e4c51260b2b](https://github.com/gabrielmoral/AbstractFactorySmell/commit/1d3493a1652617d92666d00a993b9e4c51260b2b) removes the smell introducing a facade.

By the way, the more I read the book Dependency Injection in .NET second edition the more I like it. It is a book that every software developer should read in order to have a better understanding of Dependency Injection practice and Inversion of Control design principle. The code of the book is based in C# but that should not be an obstacle for non .NET developers.

https://www.manning.com/books/dependency-injection-in-dot-net-second-edition
