import 'dart:async';
import 'dart:math';

// Excepciones personalizadas

class PedidoNoEncontradoException implements Exception {
  final int id;
  PedidoNoEncontradoException(this.id);

  @override
  String toString() =>
      "PedidoNoEncontradoException: No se encontró el pedido con id $id";
}

class ConexionException implements Exception {
  final String mensaje;
  ConexionException(this.mensaje);

  @override
  String toString() => "ConexionException: $mensaje";
}

//Modelo 

class Pedido {
  final int id;
  final String marca;
  final String modelo;

  Pedido(this.id, this.marca, this.modelo);

  @override
  String toString() => "Pedido($id, $marca, $modelo)";
}

// Repositorio

class RepositorioPedidos {
  List<Pedido> baseDeDatosPedidos = [
    Pedido(1, "Samsung", "Galaxy S23"),
    Pedido(2, "Apple", "iPhone 15"),
    Pedido(3, "Xiaomi", "Redmi Note 13"),
    Pedido(4, "Apple", "iPhone 16 Pro"),
  ];

  final Random _random = Random();

  // Buscar un pedido individual
  Future<Pedido> buscarPedido(int id) {
    return Future.delayed(Duration(seconds: 2), () {
      // Simular error de conexión aleatorio (20% de probabilidad)
      if (_random.nextInt(5) == 0) {
        throw ConexionException("Fallo de conexión al buscar el pedido $id");
      }

      return baseDeDatosPedidos.firstWhere(
        (pedido) => pedido.id == id,
        orElse: () => throw PedidoNoEncontradoException(id),
      );
    }).timeout(
      Duration(seconds: 2),
      onTimeout: () {
        throw TimeoutException("La búsqueda del pedido $id tardó demasiado");
      },
    );
  }

  // Buscar varios pedidos en paralelo
  Future<List<Pedido>> buscarVariosPedidos(List<int> ids) async {
    List<Future<Pedido>> futures =
        ids.map((id) => buscarPedido(id)).toList();

    List<Pedido> resultados = await Future.wait(futures);
    return resultados;
  }
}

// Uso de ejemplo

void main() async {
  final repositorio = RepositorioPedidos();

  // Prueba búsqueda individual
  try {
    Pedido pedido = await repositorio.buscarPedido(2);
    print("Pedido encontrado: $pedido");
  } on PedidoNoEncontradoException catch (e) {
    print(e);
  } on ConexionException catch (e) {
    print(e);
  } on TimeoutException catch (e) {
    print(e);
  }

  // Prueba búsqueda de un id que no existe
  try {
    await repositorio.buscarPedido(99);
  } on PedidoNoEncontradoException catch (e) {
    print(e);
  }

  // Prueba búsqueda de varios pedidos en paralelo
  try {
    List<Pedido> pedidos = await repositorio.buscarVariosPedidos([1, 2, 3]);
    print("Pedidos encontrados: $pedidos");
  } catch (e) {
    print("Error al buscar varios pedidos: $e");
  }
}