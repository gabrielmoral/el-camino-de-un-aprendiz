---
layout: post
title: Cultura de la automatización
date: 2016-06-23 16:58:45.000000000 +01:00
type: post
published: true
status: publish
categories:
- Automatización
- Errores aprendidos
- Software
tags: []
---
Recientemente, he tenido el placer de asistir a un [curso de Continuous Delivery](https://geekshubsacademy.com/cursos/continuous-delivery) impartido por [Néstor Salceda](https://twitter.com/nestorsalceda) y la gente de [GeeksHubs Academy](https://geekshubsacademy.com) y de leer un par de libros, _Building Microservices_, de Sam Newman y _[Continuous Delivery with Windows and .NET](http://www.oreilly.com/webops-perf/free/continuous-delivery-with-windows-and-net.csp)_ de Chris O'Dell y Matthew Skelton. Todo esto me ha ayudado a descubrir una serie de prácticas y herramientas con las que conseguir automatizar los procesos rutinarios que hacemos todos los días.

Para entregar valor de forma continuada, sin estrés y a un ritmo sostenible en un proyecto de software es fundamental no gastar tiempo haciendo tareas repetitivas que no aportan valor. En mi opinión, una de las claves para conseguir el objetivo es automatizar procesos y crear una **cultura de la automatización** dónde nos tendríamos que preguntar si merece la pena automatizar una tarea y si el retorno de la inversión pagará el coste de la automatización.

Hay muchas tareas repetitivas en las que diariamente gastamos un tiempo muy valioso el cual lo podríamos a hacer algo que aporte más valor. Al automatizar los procesos rutinarios se pueden evitar horas de despliegues manuales y errores humanos que son inevitables debido a nuestra propia naturaleza. También, se evitaría el factor autobús ya que se transfiere el conocimiento de la persona al proceso automatizado.

Automatizar procesos es un hábito difícil de adquirir. En mi experiencia personal, cuanto más tiempo se hace una tarea de las consideradas _waste of time_, se es menos consciente de que automatizarla podría tener un gran beneficio. Posiblemente esto puede ser debido a que a corto plazo automatizar puede ser considerado una pérdida de tiempo, por eso es muy importante la cultura de la automatización comentada anteriormente.

A continuación, comento algunos de los problemas que tenemos en el equipo y cómo los hemos automatizado:

**El tiempo para montar el entorno de desarrollo desde 0.**

El motivo por el que tardábamos tanto tiempo en montar un nuevo entorno para desarrollar era porque no gestionábamos correctamente las dependencias del proyecto. Lo que hicimos fue crear un repositorio de dependencias privado donde pudiéramos versionar nuestras propias dependencias. Para las dependencias de terceros utilizar el repositorio standard de la plataforma en la que trabajamos, en este caso el gestor de paquetes Nuget del ecosistema .NET.

**Pruebas manuales.**

Para probar que las funcionalidades desarrolladas funcionaban correctamente se hacían multitud de pruebas manuales. Como ya sabemos las pruebas manuales no son repetibles y no aportan el mismo valor que las automatizadas. Poco a poco fuimos añadiendo tests unitarios y de integración, los cuales hicieron que aumentara nuestra confianza por si se rompía algo al añadir una nueva funcionalidad.

**Tareas de despliegue artesanales.**

Antes, todas la tareas de despliegue de la aplicación se hacían de forma manual, copiando y pegando ficheros, empaquetando la aplicación de forma manual, corriendo decenas de scripts en la base de datos, etc. Para evitar el factor autobús y que todo el equipo pudiera desplegar hemos montado un servidor de integración continua en el cual hemos definido un _pipeline_ para que ejecute los tests y despliegue la aplicación en los servidores de pruebas. Asimismo, se ha automatizado el despliegue a producción y solo hay que ejecutar una tarea en el servidor de integración para desplegar.

Todavía nos queda mucho camino por recorrer ya que tenemos que mejorar muchísimo en la forma en la que hacemos los tests, tampoco estaría mal el poder gestionar los entornos de desarrollo, pruebas y producción con Ansible, Vagrant, Docker o las herramientas que sean. Todo se andará, lo importante es empezar poniendo la primera piedra :)