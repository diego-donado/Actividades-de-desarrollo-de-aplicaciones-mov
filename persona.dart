// ============================================================
// Actividad: Desarrollo de Aplicaciones Móviles
// Autor: Diego Armando Donado Julio
// ============================================================

import 'dart:convert';

// 1. Clase Persona con atributos que queramos que tenga esa persona.
class Persona {
  String nombre;
  int edad;
  String ciudad;
  String profesion;

  // 2. Constructor que recibe los atributos
  Persona(this.nombre, this.edad, this.ciudad, this.profesion);

  // 3. Constructor con nombre personalizado que recibe datos en formato JSON
  // Se usa un factory constructor, que es la forma correcta en Dart
  // de construir un objeto a partir de una fuente externa como JSON.
  factory Persona.fromJson(String jsonData) {
    Map<String, dynamic> datos = jsonDecode(jsonData);
    return Persona(
      datos['nombre'],
      datos['edad'],
      datos['ciudad'],
      datos['profesion'],
    );
  }

  // 4. Método para imprimir en consola usando interpolación de strings
  void mostrarInformacion() {
    print('Nombre: $nombre, Edad: $edad años, Ciudad: $ciudad, '
        'Profesión: $profesion');
  }
}

// 5. Función tradicional CON parámetros
// Calcula en cuántos años una persona cumplirá determinada edad objetivo
int aniosParaCumplir(int edadActual, int edadObjetivo) {
  return edadObjetivo - edadActual;
}

// 5. Función tradicional SIN parámetros
String obtenerSaludo() {
  return 'Bienvenido al sistema de gestión de personas';
}

// 6. Función flecha CON parámetros.
// Indica si una persona es mayor de edad
bool esMayorDeEdad(int edad) => edad >= 18;

// 6. Función flecha SIN parámetros
String obtenerFechaActual() => DateTime.now().toString();

// 7. Pruebas (método void main).
void main() {
  print('--- Prueba del constructor normal ---');
  Persona persona1 = Persona('Diego Donado', 22, 'Cartagena', 'Estudiante');
  persona1.mostrarInformacion();

  print('\n--- Prueba constructor con nombre personalizado (JSON) ---');
  String jsonPersona = '''
  {
    "nombre": "Laura Martínez",
    "edad": 25,
    "ciudad": "Pereira",
    "profesion": "Contaduria publica"
  }
  ''';
  Persona persona2 = Persona.fromJson(jsonPersona);
  persona2.mostrarInformacion();

  print('\n--- Prueba función tradicional sin parámetros ---');
  print(obtenerSaludo());

  print('\n--- Prueba función tradicional con parámetros ---');
  int anios = aniosParaCumplir(persona1.edad, 30);
  print('${persona1.nombre} cumplirá 30 años en $anios años.');

  print('\--- Prueba función flecha con parámetros ---');
  print('${persona2.nombre} es mayor de edad: ${esMayorDeEdad(persona2.edad)}');

  print('\n--- Prueba función flecha sin parámetros ---');
  print('Fecha y hora actual: ${obtenerFechaActual()}');
}
