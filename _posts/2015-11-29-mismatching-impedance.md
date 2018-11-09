---
layout: post
title: Mismatching impedance
date: 2015-11-29 16:10:47.000000000 +00:00
type: post
published: true
status: publish
categories:
- Base de datos
- Dominio
- Errores aprendidos
tags: []
---
El término **mismatching impedance** es un conjunto de problemas que surgen cuando se intenta persistir el estado de objetos representados en programación orientada a objetos en un sistema relacional de base de datos.

En el proyecto en el que trabajo actualmente estamos cambiando el sistema de nuestra base de datos de SAP a SQL Server. Al mismo tiempo que cambiamos la BDD estamos reorganizando y cambiando el modelo ya que en el anterior sistema reinaba el caos, vistas con múltiples niveles, infinidad de campos por tabla, etc.

Dado que se nos ha presentado la oportunidad de mejorar parte del sistema creímos conveniente que lo primero que debíamos de hacer era pensar de nuevo el modelo de dominio de nuestra aplicación y después intentar replicarlo en la base de datos con un maravilloso ORM. Craso error el nuestro.

Si algo he aprendido durante estas semanas es que no sirve de nada intentar replicar el dominio de la aplicación en la base de datos. Es muy diferente cómo se relacionan las entidades en tu dominio de cómo se persiste el estado de esas entidades. Estas dificultades se denominan **mismatching impedance.**

Los problemas que hemos encontrado al intentar replicar nuestro dominio en la BDD han sido estos:

*   Utilizar un ORM para que las entidades de tu dominio sean las de la base de datos **rompe la encapsulación**. Para que el ORM haga correctamente su trabajo hay que exponer en la interfaz pública el estado de las entidades.

*   Un ORM te guía a tener un **modelo anémico** donde las **entidades del dominio no tienen comportamiento**. Esto lleva a introducir todo tipo de trampas y artimañas para encontrar un lugar donde albergar la lógica que deberían de tener esas entidades. Al final la lógica acaba dispersa en helpers, servicios y métodos de extensión.

*   Las BDDrelacionales **no representan** **correctamente** el concepto de **herencia de la programación orientada a objetos**. Las tres aproximaciones que existen para pseudo representar la herencia en una BDDrelacional tienen inconvenientes. Podéis encontrar más información [aquí](http://c2.com/cgi/wiki?MappingInheritanceHierarchiesToRelationalSchemataInvolvesCompromises).

Algunas soluciones para evitar todos estos problemas podrían ser:

*   **Separar las entidades de domino** completamente de la persistencia de datos. Haciendo esto se puede tener un modelo de **dominio rico**, con **entidades que encapsulan el estado y tienen comportamiento** por sí mismas. Para guardar el estado de las entidades habrían adaptadores los cuales las transformarían en objectos que conoce la base de datos.
*   Utilizar un **sistema mixto de persistencia**. Se guardaría parte de la entidad en una BDDrelacional y otra parte en otro sistema de persistencia como puede ser una BDDNoSql. Por ejemplo, con esta solución se podría aislar la parte que varía en las entidades que representan una jerarquía.