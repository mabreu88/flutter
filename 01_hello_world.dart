// ============================================
// LECCIÓN 1: HOLA MUNDO EN DART
// ============================================

// Este es tu primer programa en Dart. Aquí aprenderás los conceptos básicos:
// - La función main()
// - Variables y tipos de datos
// - Impresión en consola
// - Interpolación de strings

// FUNCIÓN MAIN - El punto de entrada de tu programa
// ------------------------------------------------
// Cada programa en Dart comienza ejecutando la función main().
// Es obligatoria y es donde se inicia la ejecución del código.
void main() {
  // DECLARACIÓN DE VARIABLES
  // ------------------------
  // String es un tipo de dato que representa texto (cadena de caracteres)
  // 'myName' es el nombre de la variable
  // 'Martin' es el valor asignado (debe ir entre comillas simples o dobles)
  String myName = 'Martin';

  // FUNCIÓN PRINT - Imprimir en consola
  // ------------------------------------
  // print() muestra información en la consola/terminal
  //
  // INTERPOLACIÓN DE STRINGS (muy importante en Dart)
  // -------------------------------------------------
  // El símbolo $ se usa para insertar el valor de una variable dentro de un string
  // Sintaxis: $nombreVariable
  // En este caso, $myName será reemplazado por 'Martin'
  print('Hello, World!, great job $myName');

  // RESULTADO ESPERADO EN CONSOLA:
  // Hello, World!, great job Martin
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ void main() - Función principal de todo programa Dart
// ✓ String - Tipo de dato para texto
// ✓ print() - Función para mostrar información
// ✓ $variable - Interpolación de strings (insertar variables en texto)
