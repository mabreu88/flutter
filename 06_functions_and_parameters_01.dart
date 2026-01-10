void main() {
  // LLAMANDO FUNCIONES SIN PARÁMETROS
  // ---------------------------------
  // greetEveryOne() no necesita argumentos
  print(greetEveryOne());

  // LLAMANDO FUNCIONES CON PARÁMETROS
  // ----------------------------------
  // addTwoNumbers() requiere dos argumentos (10 y 20)
  print('Suma: ${addTwoNumbers(10, 20)}');
}

// FUNCIÓN 1: Sin parámetros, retorna String
// ==========================================
// SINTAXIS: TipoDeRetorno nombreFuncion() => expresión;
//
// String: Tipo de dato que retorna la función
// greetEveryOne: Nombre de la función
// (): Parámetros (en este caso vacío, sin parámetros)
// =>: Arrow function (función de una línea)
// 'Hello everyone!': Lo que retorna la función
String greetEveryOne() => 'Hello everyone!';

// FUNCIÓN 2: Con parámetros posicionales, retorna int
// ===================================================
// SINTAXIS: TipoDeRetorno nombreFuncion(Tipo param1, Tipo param2) => expresión;
//
// int: Tipo de dato que retorna
// addTwoNumbers: Nombre de la función
// (int a, int b): Parámetros posicionales (OBLIGATORIOS)
//   - int a: Primer parámetro debe ser un entero
//   - int b: Segundo parámetro debe ser un entero
// => a + b: Arrow function que suma los dos parámetros
//
// Ejemplo de uso:
// addTwoNumbers(10, 20) → retorna 30
// addTwoNumbers(5, 15) → retorna 20
int addTwoNumbers(int a, int b) => a + b;

// FUNCIÓN 3: Con parámetros opcionales y valores por defecto
// ===========================================================
// SINTAXIS: TipoDeRetorno nombreFuncion(Tipo param1, [Tipo param2 = valor]) { ... }
//
// int a: Parámetro OBLIGATORIO
// [int b = 0]: Parámetro OPCIONAL (entre corchetes)
//   - Los corchetes [] indican que es opcional
//   - = 0 significa que si no se proporciona, b valdrá 0 por defecto
//
// Ejemplos de uso:
// addTwoNumbersOptional(5)      → a=5, b=0 (por defecto) → retorna 5
// addTwoNumbersOptional(5, 10)  → a=5, b=10 → retorna 15
int addTwoNumbersOptional(int a, [int b = 0]) {
  // b = b ?? 0;
  // El operador ?? significa: "Si b es null, usa 0"
  // En este caso no es necesario porque ya tiene un valor por defecto

  return a + b;
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ void - No retorna nada
// ✓ String - Retorna texto
// ✓ int - Retorna número entero
// ✓ () => expresión - Arrow function (función de una línea)
// ✓ Parámetros posicionales - Se pasan en orden obligatorio
// ✓ [parámetro = valor] - Parámetro opcional con valor por defecto
// ✓ return - Devuelve un valor de la función

// DIFERENCIA: ARROW FUNCTION vs FUNCIÓN NORMAL
// ============================================
// Arrow function (una línea):
// String greet() => 'Hola';
//
// Función normal (varias líneas):
// String greet() {
//   String message = 'Hola';
//   return message;
// }

// PARÁMETROS POSICIONALES vs OPCIONALES
// ======================================
// Posicionales: addTwoNumbers(10, 20)  → OBLIGATORIO el orden
// Opcionales: addTwoNumbersOptional(5) o addTwoNumbersOptional(5, 10)
