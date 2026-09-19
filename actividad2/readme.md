Actividad 3 - Programación asíncrona en Dart
Descripción

Esta actividad implementa un sistema de búsqueda de pedidos utilizando programación asíncrona en Dart.

El programa simula un repositorio de pedidos y permite realizar búsquedas individuales y búsquedas de varios pedidos en paralelo.

Temas trabajados
Programación asíncrona con Future y async/await.
Uso de Future.delayed.
Manejo de excepciones personalizadas.
Manejo de TimeoutException.
Búsqueda de elementos en una lista.
Ejecución de varias operaciones en paralelo utilizando Future.wait.
Simulación de errores de conexión aleatorios.
Funcionamiento

El programa contiene una lista de pedidos con diferentes marcas y modelos de dispositivos.

Se realizan tres pruebas principales:

Buscar un pedido individual mediante su ID.
Intentar buscar un pedido que no existe.
Buscar varios pedidos simultáneamente.

También se simula un fallo de conexión con una probabilidad del 20% y se controla el tiempo de espera de las operaciones.

Archivos
main.dart: contiene todo el código de la actividad.
README.md: contiene la descripción y explicación de la actividad.