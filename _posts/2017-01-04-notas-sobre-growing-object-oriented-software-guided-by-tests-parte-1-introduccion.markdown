---
layout: post
title: 'Notas sobre Growing Object-Oriented Software, Guided By Tests - Parte 1: Introducción'
date: 2017-01-04 09:27:29.000000000 +00:00
type: post
published: true
status: publish
categories:
- Aprendizaje
- Libros
tags:
- GOOS
- software
---
Empecé a leer el GOOS hace unos días y me di cuenta que para profundizar en el libro tenía que hacer algo más que leerlo. Por eso voy a empezar a escribir en el blog algunos posts  con notas del libro que me parezcan interesantes. Por supuesto solo serán unas notas, para profundizar con el libro y sacarle todo el jugo posible habrá que leerlo y releerlo varias veces.

### **Parte 1: Introducción**

Es necesario contar con procesos / herramientas que proporcionen feedback lo más rápido posible para solucionar la incertidumbre que existe cuando se empieza a desarrollar un proyecto de software.

El desarrollo iterativo refina progresivamente la implementación de las nuevas funcionalidades hasta que son suficientemente buenas.

#### **Prácticas que soportan el cambio.**

*   Se necesitan tests automatizados para comprobar constantemente los posibles errores de regresión que surjan, así se podrán añadir nuevas funcionalidades sin romper las existentes.
*   Mantener el código lo más simple posible para que sea más fácil de entender y modificar.

TDD da cabida a estas dos prácticas, si dejamos que los tests nos guíen a escribir el código, se puede construir una red automatizada de tests que nos ayude a tener la suficiente confianza a la hora de realizar cambios.

#### **Niveles de testing.**

**Tests de aceptación**: Nos ayudan a entender el domino de la aplicación. Sirven para asegurar que no se ha roto ninguna funcionalidad existente.

**Tests de integración**: Ayudan a testear como nuestro código colabora con sistemas que no podemos cambiar.

**Tests unitarios**: Comprueban que los objetos de nuestro código hacen lo que se espera de ellos  y si trabajan bien conjuntamente.

#### **Calidad interna y externa.**

La calidad externa es cómo el sistema satisface las necesidades de los usuarios. Por otra parte, la calidad interna es cómo la aplicación satisface las necesidades de los desarrolladores y administradores de la misma. La calidad interna se debería de mantener  alta para poder modificar el comportamiento del sistema de forma predecible y segura.

Los tests de aceptación nos dicen cómo es la calidad externa de nuestro sistema. Lo que no nos dicen es si el código que hay detrás está bien escrito, es modular, etc.

Los tests unitarios y de integración son los que nos dan pistas sobre la calidad de nuestro artefacto.

Si los tests son difíciles de escribir es un mal olor en el cual hay que fijarse ya que quiere decir que no se ha hecho un diseño lo suficientemente bueno.

#### **Buenas prácticas para hacer TDD con objetos.**

Un sistema orientado a objetos es una red de objetos colaborando entre si. La orientación a objetos se centra en cómo los objetos se comunican entre ellos¹ en lugar de en los objetos en si mismos.

Solo podremos beneficiarnos de la orientación a objetos si los objetos están diseñados para ser fácilmente conectables. Que un objeto sea conectable significa que sigue un patrón de comunicación y que sus dependencias son explícitas.

Un patrón de comunicación² es un conjunto de reglas que marcan como los objetos interactúan entre si: los roles que juegan, los objetos con los que colaboran, qué responsabilidades tienen, etc.

#### Ley de Demeter.

La ley de Demeter se basa en que los objetos toman decisiones basándose solo en la información interna de los objetos. El consumidor de un método no debería de conocer la estructura interna del objeto ya que debería de estar oculta. La aplicación de esta práctica ayuda a expresar mejor la interacción entre los dos objetos, centrándose en el qué en lugar del cómo.

{% highlight csharp %}
var button = new Button();  
panel.GetChild()[0].AddControl(button);  
{% endhighlight %}

Después de cumplir la Ley de Demeter nos damos cuenta que el nuevo método expresa qué propósito se quiere conseguir y no cómo se consigue.

{% highlight csharp %}
var button = new Button();  
panel.AddControlToTheRibbon(button);  
{% endhighlight %}

* * *

1\. Para profundizar en el tema me gustó mucho un excelente libro sobre comunicación entre objetos,  [Practical Object-Oriented Design in Ruby](http://www.poodr.com) de **Sandy Metz**.

2\. Un libro que leí hace algún tiempo sobre roles, responsabilidades y colaboración entre objetos, [Object Design: Roles, Responsibilities, and Collaborations](http://www.wirfs-brock.com/DesignBooks.html) de **Rebecca Wirfs-Brock.**