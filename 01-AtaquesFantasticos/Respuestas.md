## Preguntas

1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

## Respuestas

1. En primer lugar se puede considerar como código repetido, ya que estos mensajes en el fondo representan el mismo comportamiento sobre conocer el estado de salud del combatiente. Por otra parte el hecho de tener estas implementaciones obligan a repetir mas código en el futuro si se tienen en cuenta los tests que conllevan. Por ello consideramos que sería mejor utilizar el enfoque de un solo mensaje #estaHerido y poder conocer su negación.

2. Consideramos que desde un inicio hay un error de diseño al modelar los combatientes en objetos separados que se comportan de formas muy similares, esto lleva a que al momento de testear todas las funcionalidades de cada uno de ellos se caiga en repetir código para aplicarlo a cada combatiente. Esto se puede solucionar si llamamos dentro del mismo test a otro método que realice ese comportamiento con los combatientes que reciba, de manera que podamos reutilizar el codigo y aprovechar un poco el polimorfismo.  

3. Para modelar el resultado de haber un combate decidimos crear un objeto Resultado que guarde la información sobre la duración en rondas y el bando ganador. Dicho objeto es devuelto por el OrquestadorDeCombates luego de que se desarrolle un combate entre dos bandos por un número de rondas. Este comportamiento podria ser realizado por el orquestador, pero consideramos mejor separarlo en otro objeto para no tener que devolver al orquestador (con las posibles violaciones de principios que implicaría) y poder encapsular mejor el resultado. 
Otra opción que consideramos fue devolver un conjunto con bandoGanador y duración, pero la descartamos para evitar romper el encapsulamiento en los test, ya que uno de ellos tiene que saber en que posición se encuentra el bandoGanador y en que posición estaba la duración, hecho que consideramos mucho peor que las otras dos opciones.
