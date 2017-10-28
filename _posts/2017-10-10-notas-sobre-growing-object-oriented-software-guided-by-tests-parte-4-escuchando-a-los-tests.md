---
layout: post
title: 'Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 4: Escuchando
  a los tests.'
date: 2017-10-10 19:50:16.000000000 +01:00
type: post
published: true
status: publish
categories:
- Libros
- Software
tags:
- GOOS
---
En esta cuarta parte del libro Nat y Steve nos cuentan que el código de los tests debe ser cuidado tanto como el código de producción. A lo largo de este post voy a resumir solo la parte de "Escuchando a los tests" ya que creo que se merece dedicarle un post entero.

Normalmente, cuando encontramos una nueva funcionalidad que es difícil de testear existe una razón detrás de ello. Si aprendemos a escuchar a los tests conseguiremos simplificarlos y a su vez mejorar el diseño de nuestra aplicación.

#### **Dependencias**

Las **dependencias ocultas** es una de las razones más habituales por las que es difícil testear el código. Por ejemplo, el uso de singletons dificulta probar una pieza de código en aislamiento. Un simple DateTime.Now puede ser más peligroso de lo que parece.

El proceso de TDD puede guiarnos (tal vez por nuestra falta de conocimiento sobre diseño) a la creación de un **objeto con muchas dependencias / colaboraciones**. Una opción para simplificar la creación del objeto es que algunos colaboradores definan un concepto nuevo y se junten para crear un nuevo colaborador. Para extraer esta nueva colaboración hay que buscar argumentos que siempre se usen conjuntamente y que tengan el mismo tiempo de vida.

Otra posibilidad es que el **objeto asuma demasiada responsabilidad** y necesita ser dividido en varios para así simplificar los tests.

También podría ser que algunos de los parámetros que acepta el constructor del objeto no sean solo dependencias, sino objetos para ajustar el comportamiento del objeto que pueden ser inicializados por defecto y luego modificados durante el ciclo de vida del objeto.

#### **Mocks**

Uno de los malos olores que pueden ayudarnos a mejorar nuestro diseño y tests tiene que ver con **mockear una implementación concreta**. TDD se basa en ir descubriendo relaciones entre objetos, por lo tanto mockear una clase concreta puede llevarnos a no ver la verdadera relación que hay entre los objetos. Si omitimos esa abstracción puede que más tarde sea relevante en otro lugar y sea difícil encontrarla.

Otra recomendación es no **mockear value objects**. Si detectamos este mal olor puede ser síntoma de que esos objetos son difíciles de crear y hay que simplificar la creación utilizando builders u otra técnica apropiada.

Una última pista que podemos usar para mejorar nuestros tests es identificar si se tienen **demasiadas expectaciones** de un colaborador que ha sido mockeado. Esto dificulta ver lo que es realmente importante en el test y que es lo que se está intentando probar.  Si se tienen más de unas cuantas expectaciones podría ser que el código probado o el colaborador tengan demasiadas responsabilidades.

#### **Naming**

Un aspecto del que no hay que olvidarse y que es fundamental (en mi opinión uno de los más complicados de conseguir) es el naming. Enfatizar en los roles de los objetos y como se comunican a través de un buen naming hará que los test sean más legibles y comuniquen mejor su intención.

[Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 1: Introducción](https://elcaminodeunaprendiz.wordpress.com/2017/01/04/notas-sobre-growing-object-oriented-software-guided-by-tests-parte-1-introduccion/)

[Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 2: TDD.](https://elcaminodeunaprendiz.wordpress.com/2017/03/31/notas-sobre-growing-object-oriented-software-guided-by-tests-parte-2-tdd/)

[Notas sobre Growing Object-Oriented Software, Guided By Tests – Parte 3: Desarrollando un ejemplo.](https://elcaminodeunaprendiz.wordpress.com/2017/06/26/notas-sobre-growing-object-oriented-software-guided-by-tests-parte-3-desarrollando-un-ejemplo/)