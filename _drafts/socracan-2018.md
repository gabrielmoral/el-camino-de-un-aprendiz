#### **Danny - Effective remote teams** 

#### **Carlos Ble - Advance refactoring workshop (Parallel change)** 

Advises about how to do a parallel refactoring:
* Create the new method and do the changes there. When the method is ready call it inside the old method and the inline the old method to replace all the occurrences.
* Where there is no indirection to make the refactoring we could create the indirection anf after that an inline will happen :)

#### **Mashooq Badar - Nature of learning** 

Design our learning.
David Kolb's model. https://www.simplypsychology.org/learning-kolb.html
Neil Fleming's model. https://www.verywellmind.com/vark-learning-styles-2795156

#### **Rabea Gleissner - Fairer tech tests** 

Ideas to make test tech/interviews fairer:
* The company should alert the values first. (Clean code, testing, people first...)
* Send a tech test before event talk with the candidate. Is that better?
* Set expectations for the tech test.
* Once the candidate has done the test the company should give feedback. Maybe the company could give recommendations about her solution and the candidate could do them.
* Codility could be useful if the company gives a timebox to complete the test.

A possible test checklist:
* High test coverage.
* Naming / domain language.
* Git history.
* Tests intent / test readability.
* Good readme to explain naming / code / tests.
* Low coupling.


#### **Ruben - Coding like a monkey (Trunk based development)** 

Book recommendation -> DevOps handbook

#### **Paulo Clavijo - CDC Testing** 

https://www.slideshare.net/paucls/consumerdriven-contract-testing

It only works if you own client and provider.
Each client will consume the provider on its way and a contract will be generated to be use on the provider side.

#### **Tobias - Event storming** 

We had a session defining an example of business domain like eBay. 

#### **Paulo Clavijo - DDD Bounded context and Context map** 

https://www.slideshare.net/paucls/ddd-strategic-design-context-maps-paulo-clavijo-april-2018

#### **Wolfrang - TDD for kids** 

https://www.slideshare.net/wolframkriesing/tdd-for-kids-vlcjs-valencia-spain-july-2015

#### **Facilitating Katas**

In the session Fran and I proposed we explained how we prepared katas in Dublin Software Crafters.

Feedback ans new ideas from the attendants:
* Create a line with the people ordering them by TDD experience and make the pairs based on that.
* Setup a clock to change the role between drives and navigators.
* In order to include all the attendants to participate during the sessions we will try to be inclusive.
* Ping pong is a technique that could stimulate participation.
* Instead of doing kata problems in all sessions, we could focus in features of one language and try to master them (with mob programming)
* Calculator, Roman numbers and password validator are katas to start learning TDD.

Useful resources to get new katas and learn about how to facilitating them:
* http://kata-log.rocks/
* http://codingdojo.org/KataCatalogue/
* https://www.coderetreat.org/
* Emily Bache book https://leanpub.com/codingdojohandbook.
