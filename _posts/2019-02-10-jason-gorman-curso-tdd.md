---
layout: post
title: 'Curso de TDD con Jason Gorman'
date: 2019-02-10 09:00:00.000000000 +01:00
type: post
published: true 
status: published
categories:
- Aprendizaje
- TDD
language: es
---


Hace algunas semanas tuve el placer de asistir al curso de [Jason Gorman](https://twitter.com/jasongorman) en Londres sobre TDD. El curso no fue el típico de tres días que Jason hace [normalmente](http://www.codemanship.co.uk/tdd.html), sino un solo día con el primer tercio del contenido del curso.

El día fue muy ameno en cuanto a contenidos. Jason empezó el curso introduciendo que es TDD y explicando conceptos "básicos" (muchos decimos que ya los sabemos pero no siempre es así) como las mecánicas de TDD y por qué hacer TDD.

Durante el día nos dio tiempo a ver muchísimos conceptos, algunos relacionados con el diseño de los tests, diseño simple, refactorización o consejos para dar buenos nombres. Parece mucho para un solo día pero como no éramos demasiados participantes dio tiempo a verlo todo. Una de las cosas que me gustó mucho es que entre un concepto y otro había una parte práctica (parecido a una kata) para poder aplicar lo que has aprendido.

A continuación voy a ir comentando algunas de las prácticas y conceptos que me han parecido interesantes después de haber hecho el curso.

### Diseño de los tests.

- Un test solamente debe comprobar un ejemplo/regla y por lo tanto solo debe de fallar por un motivo.

- Al Igual que esperamos a ver la duplicación tres veces[^1] para eliminarla en el código, la misma regla debería aplicar también a los tests. Tener paciencia a la hora de refactorizar los tests es importante ya que un generalización prematura podría ofuscar su significado.

- Crear generalizaciones en los tests puede ayudar a minimizar el impacto de los cambios cuando el código de producción cambia. Varios ejemplos serían crear una fachada para crear instancias de un objeto o extraer la configuración de un mock a un único lugar.

- Parametrizar los tests, siempre y cuando tenga sentido, puede ser una buena opción para incrementarla cobertura de código o hacer mutation testing.

- Al escribir un test deberíamos de empezar por la aserción y continuar completando el test hacia arriba. Esta práctica ayuda a centrarnos en lo que queremos probar y a no crear un setup innecesario.

### Refactorizar

Una de las frases que mencionó Jason durante el curso y que me resultó muy reveladora:
>Don't leave the path. Don't go to the deep forest. 

Quien no se ha encontrado en la fase de refactorización y cambiando un montón de código/ficheros y cuando nos damos cuenta se nos ha ido de las manos. Otra situación muy común es que no ejecutamos los test con cada pequeño cambio y después están en rojo y no sabemos a que se debe.

A estos dos ejemplos es a lo que se refiere la frase de Jason, es muy importante hacer commits muy pequeños durante la refactorización y ejecutar los tests muy a menudo para comprobar en todo momento que no se ha roto el código de producción.

### Nombres

Una de las tareas más complicadas en programación es dar buenos nombres a las abstracciones que creamos. Para los componentes que creemos tengan una correlación conceptual con el negocio, podemos apoyarnos en herramientas como un generador de nube de tags[^2]. Por ejemplo, utilizar el texto de la historia de usuario para generar tags puede ayudarnos a descubrir palabras y nombres que nos pueden ser de utilidad.  

### Diseño simple

Otra de las cosas que hicimos fue enumerar qué es diseño simple en los siguientes puntos:  

1. Funciona (Pasan los tests)
2. Revela la intención
3. Libre de duplicación
4. Partes simples
5. Responsabilidad única
6. Tell don't ask (Feature envy)
7. Interfaces especificas por parte del cliente
8. Intercambiable

Son básicamente los mismos puntos que Kent Beck[^3] enumeró en su libro Extreme Programming con un mayor nivel de detalle.

Otro consejo con el que me quedo del curso:
>Clases que crean objetos no deberían usarlos, clases que los usan no deberían crearlos. 


Para finalizar el post me gustaría recomendar el curso a todos ellos que quieran aprender TDD o quieran mejorar su técnica. A mi me resultó muy útil y volveré para completarlo si hay una segunda y tercera parte.

[^1]: <http://wiki.c2.com/?ThreeStrikesAndYouRefactor>
[^2]: <https://www.jasondavies.com/wordcloud/>
[^3]: <https://martinfowler.com/bliki/BeckDesignRules.html>