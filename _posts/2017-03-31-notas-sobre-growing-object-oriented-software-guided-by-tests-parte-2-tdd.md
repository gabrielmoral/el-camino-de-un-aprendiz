---
layout: post
title: 'Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 2: TDD.'
date: 2017-03-31 09:08:03.000000000 +01:00
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
En este segundo capítulo del GOOS, Nat Pryce y Steve Freeman nos explican lo que puede aportar el ciclo de TDD y cómo sería para ellos un buen diseño orientado a objetos.

### **TDD**

#### **Incertidumbre y fuente de feedback**

Los riesgos de dejar el despliegue de la aplicación para el final son demasiado altos. Nada mejor que automatizar el despliegue desde el principio para entender el proceso y que el equipo entienda como encaja.

Tener un sistema desplegable es útil para poder lanzar los tests contra él. Esto aportará fuente de feedback en el proceso de desarrollo, sobre la calidad del sistema y del código.

Todo este trabajo previo de automatización puede parecer excesivo pero ayuda a exponer la incertidumbre lo más pronto posible.

#### **Mantener el ciclo de TDD**

Empezar escribiendo un test de aceptación en el lenguaje del negocio/dominio ayuda a entender lo que el sistema debe de hacer, sin hacer presunciones de como tiene que ser la implementación.

Los tests unitarios nos ayudan a diseñar los objetos necesarios para cumplir con el objetivo.

Una de las mejores cosas que se puede conseguir con TDD es la confianza de cambiar el código sin miedo a romperlo. El miedo paraliza el progreso.

Consejos:

*   Es preferible empezar escribiendo los tests con el caso más sencillo posible e ir añadiendo tests para validar nuestras ideas e ir haciendo más robusta la nueva feature.
*   Deberíamos escribir el test que nos gustaría leer, sin tener en cuenta si el código compila, centrándonos solo en cómo está escrito.
*   Es fundamental ver fallar el test para comprobar si falla de la forma que esperamos.
*   Los tests unitarios deberían comprobar el comportamiento de una unidad, no todos los posibles caminos del código.
*   Escuchar a los tests. Cuando el código es difícil de testear, probablemente el diseño de la aplicación necesita ser mejorado.

### **Orientación a objetos**

Para diseñar una aplicación mantenible hay que centrarse principalmente en dos objetivos_._ El primero es la **separación de responsabilidades** que ayuda a cambiar menos código cuando hay que implementar una nueva funcionalidad. El segundo es **elevar el nivel de abstracción**, ya que se consigue bajar la complejidad.

Consejos:

*   Exponer solo lo necesario en la interfaz pública de nuestros objetos.
*   Encapsular el comportamiento de un objeto para que pueda solo ser modificado a través de su API.
*   Ocultar como un objeto implementa la funcionalidad para la que existe.
*   Un objeto solo debe tener una responsabilidad.
*   Nombrar objetos sin utilizar ningún tipo de conjunción ("y", "o", "con").
*   Construir un objeto válido desde el constructor.

#### **Relaciones entre los objetos**

Se puede categorizar la relación entre los objetos en tres tipos. Un objeto puede tener  relaciones con objetos que son dependencias, objetos a los que notificar y objetos que ajustan el propio comportamiento del objeto.

Al componer un objeto con otros objetos se espera que la API del nuevo objeto oculte los componentes del nuevo objeto y sus interacciones, exponiendo una abstracción más simple.

#### **Logrando un diseño orientado a objetos**

Empezar primero escribiendo los tests ayuda con el diseño y a describir lo que se quiere conseguir y no cómo conseguirlo. Para construir el objeto que se quiere testear es necesario conocer las dependencias del objeto, esto ayuda a mantener la independencia del objeto sobre la aplicación y a conocer como se relaciona el objeto en el sistema.

#### **Value types**

Los conceptos de dominio deberían de estar definidos como tipos aunque no tengan demasiada implementación.

Tres técnicas básicas para introducir value types son:

*   Extraer nuevos tipos que ayuden a eliminar la complejidad de un objeto que tiene múltiples responsabilidades.
*   Introducir un nuevo concepto de dominio.
*   Agrupar grupos de valores que son usados siempre conjuntamente.

#### **Identificar relaciones con interfaces**

Usar interfaces para identificar los roles que un objeto cumple en el sistema ayuda a describir los mensajes que el objeto acepta.

Cuantos menos métodos tenga la interfaz más claro será el rol que define, además será más fácil escribir adaptadores y decoradores para ella.

#### **Clases**

Son un detalle de implementación, una forma de implementar los tipos.

### **Construir sobre código de terceros**

Uno de los principales problemas cuando se utiliza código de terceros es que no tenemos el control sobre él y no podemos usar nuestro proceso para guiar el diseño. Es aconsejable centrarse en el proceso que integra nuestro diseño y el código de terceros.

Consejos:

*   Mockear tipos que te pertenecen.
*   Escribir adaptadores para comunicarse con el código de terceros.

Enlaces relacionados:

[Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 1: Introducción](https://elcaminodeunaprendiz.wordpress.com/2017/01/04/notas-sobre-growing-object-oriented-software-guided-by-tests-parte-1-introduccion/)