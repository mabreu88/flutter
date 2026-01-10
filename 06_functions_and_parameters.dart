void main() {
  // LLAMANDO FUNCIONES SIN PARÁMETROS
  // ---------------------------------
  print(greetEveryOne());

  // LLAMANDO FUNCIONES CON PARÁMETROS POSICIONALES
  // -----------------------------------------------
  print('Suma: ${addTwoNumbers(10, 20)}');

  // LLAMANDO FUNCIONES CON PARÁMETROS NOMBRADOS
  // -------------------------------------------
  // name: 'Martin' - Los parámetros nombrados se pasan con su nombre
  print(greetPerson(name: 'Martin'));
}

// FUNCIÓN 1: Sin parámetros, arrow function
// ==========================================
// String: Tipo de retorno
// greetEveryOne(): Nombre de función
// =>: Arrow function (una línea)
String greetEveryOne() => 'Hello everyone!';

// FUNCIÓN 2: Con parámetros posicionales, arrow function
// =======================================================
// Parámetros posicionales: Se pasan en orden (10, 20)
// (int a, int b): Ambos parámetros son OBLIGATORIOS
int addTwoNumbers(int a, int b) => a + b;

// FUNCIÓN 3: Con parámetro opcional
// ==================================
// int a: Parámetro OBLIGATORIO
// [int b = 0]: Parámetro OPCIONAL (entre corchetes)
//   - Si no se proporciona, b = 0 por defecto
//
// Ejemplos:
// addTwoNumbersOptional(5)      → 5 + 0 = 5
// addTwoNumbersOptional(5, 10)  → 5 + 10 = 15
int addTwoNumbersOptional(int a, [int b = 0]) {
  // b = b ?? 0;
  // El operador ?? significa: "Si b es null, usa 0"
  return a + b;
}

// FUNCIÓN 4: Con parámetros nombrados (Named Parameters)
// ======================================================
// SINTAXIS: { parámetro1, parámetro2 }
// Las llaves {} indican que son parámetros NOMBRADOS (no posicionales)
//
// required String name:
//   - required: Este parámetro es OBLIGATORIO (debe proporcionarse)
//   - String name: Tipo y nombre del parámetro
//   - Se pasa así: greetPerson(name: 'Martin')
//
// String? message = 'Hola,':
//   - String?: Tipo nullable (puede ser String o null)
//   - message: Nombre del parámetro
//   - = 'Hola,': Valor por defecto
//   - Es OPCIONAL (puede no proporcionarse)
//
// Ventajas de parámetros nombrados:
// - Mejor legibilidad (sabes qué parámetro es cuál)
// - Orden no importa
// - Más fácil de mantener con muchos parámetros
String greetPerson({required String name, String? message = 'Hola,'}) {
  // Esta función retorna un string interpolado
  // '$message, $name' → 'Hola, Martin'
  return '$message, $name';
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ Arrow function (=>) - Funciones de una línea
// ✓ Parámetros posicionales - Se pasan en orden: func(10, 20)
// ✓ [Parámetro] - Parámetro opcional (entre corchetes)
// ✓ {Parámetro} - Parámetro nombrado (entre llaves)
// ✓ required - Parámetro nombrado OBLIGATORIO
// ✓ String? - Tipo nullable (puede ser String o null)
// ✓ ?? - Null coalescing operator (usa valor si es null)

// COMPARACIÓN DE PARÁMETROS:
// ==========================
// POSICIONALES:
//   void func(int a, int b)         → func(1, 2)  ← Orden importa
//   void func(int a, [int b = 0])   → func(1) o func(1, 2)  ← Opcional
//
// NOMBRADOS:
//   void func({required int a})     → func(a: 1)  ← Obligatorio, por nombre
//   void func({int a = 0})          → func() o func(a: 1)  ← Opcional
//   void func({int a = 0, int b = 0}) → func(a: 1, b: 2) o func(b: 2, a: 1)  ← Orden NO importa

// NULLABLE vs NON-NULLABLE:
// =========================
// String name:      ← NO puede ser null (obligatoriamente tiene un valor)
// String? message:  ← SÍ puede ser null (puede no tener valor)

// CASOS DE USO:
// =============
// ✓ Parámetros posicionales: Funciones simples con 1-2 parámetros
// ✓ Parámetros opcionales []: Cuando algunos parámetros podrían no necesitarse
// ✓ Parámetros nombrados {}: APIs, funciones con muchos parámetros, más legibilidad
// ✓ required: Cuando un parámetro nombrado es obligatorio
