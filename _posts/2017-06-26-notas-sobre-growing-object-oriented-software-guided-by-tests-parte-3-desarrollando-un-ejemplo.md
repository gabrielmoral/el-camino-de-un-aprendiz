---
layout: post
title: 'Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 3: Desarrollando
  un ejemplo.'
date: 2017-06-26 19:23:35.000000000 +01:00
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
En la tercera parte del GOOS los amigos Nat Pryce y Steve Freeman nos cuentan como construyen una aplicación que permite automáticamente pujar online en subastas. Ellos empiezan a escribir la aplicación partiendo desde la iteración 0, mediante pequeños incrementos de funcionalidad y TDD van dando forma al software que quieren conseguir.

En este post voy a citar algunos puntos y consejos que ellos destacan durante el proceso de la construcción de la aplicación. Para profundizar en el proceso es imprescindible leer todos los capítulos que comprenden esta parte.

#### **Divide y vencerás**

Es importante separar en pequeñas porciones las funcionalidades que se quieren implementar e ir añadiendo esas porciones incrementalmente y solo una cada vez. A la hora de refactorizar se debería seguir el mismo principio, pequeños refactorings que no comprometan el estado de la aplicación.

#### **Iteración 0**

La "iteración 0" sirve para crear el esqueleto de la aplicación junto con el primer test de aceptación. Esto ayuda a entender desde el principio la automatización de la construcción, empaquetado y despliegue de la aplicación. Puede suponer un importante esfuerzo al principio pero es una de las tareas más importantes ya que si se deja para más tarde podrían surgir problemas inesperados.

#### **Tests de aceptación**

Cada vez que se implemente una nueva porción de funcionalidad se debería añadir un test de aceptación simulando un evento de entrada a la aplicación para lograr un efecto en ella. Una característica de los test de aceptación es que permiten explorar el espacio que hay en medio desde que el mensaje entra a la aplicación y el resultado que produce ese mensaje.

#### **Código mantenible**

Los equipos deberían invertir tiempo en escribir código mantenible a la vez que van añadiendo nuevas funcionalidades, ya que si no se hace, el coste de mantenimiento a largo plazo será cada vez mayor. Algunos consejos a tener en cuenta:

*   Principio de responsabilidad única, ayuda a separar la complejidad.
*   Métodos pequeños para expresar intención.
*   No tener miedo de crear nuevos tipos, por ejemplo, encapsular tipos primitivos ayuda a expresar el dominio de una mejor forma.
*   Encapsular colecciones. Utilizando el lenguaje del problema en lugar del lenguaje del lenguaje de programación ayuda a describir mejor un concepto de dominio.

#### **Tests**

Algunos consejos útiles que los autores recomiendan a la hora de escribir tests:

*   Utilizar null cuando el argumento en el test no importe.
{% highlight csharp %}
Chat UNUSED_CHAT = null;
{% endhighlight %}
*   A veces puede ser beneficioso calcular el valor esperado en un test ya que hace el test más legible. Algunos puntos negativos de esta técnica pueden ser que haya que escribir el mismo código en el test que en la implementación y el cálculo puede ser demasiado complicado.
*   Pair programming es beneficioso durante todo el proceso de desarrollo, puede serlo incluso más durante la fase de refactoring en el ciclo de TDD, ya que aporta varios puntos de vista a la hora de realizar el diseño.

#### **Decisiones**

Decidir si realizar o postponer un refactoring o el cambio de diseño de la aplicación es una difícil decisión. Es fundamental tener en cuenta los trade offs que hay detrás de ese cambio y no hay una regla común para decidirlo, requiere experiencia y madurez técnica.

No tener miedo a cambiar el nombre de los objetos es una parte esencial del proceso de desarrollo de software. Cada vez que conocemos más la aplicación y el dominio irán surgiendo mejores nombres y abstracciones las cuales facilitarán la lectura del código.

[Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 1: Introducción](https://elcaminodeunaprendiz.wordpress.com/2017/01/04/notas-sobre-growing-object-oriented-software-guided-by-tests-parte-1-introduccion/)

[Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 2: TDD.](https://elcaminodeunaprendiz.wordpress.com/2017/03/31/notas-sobre-growing-object-oriented-software-guided-by-tests-parte-2-tdd/)