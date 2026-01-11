void main() {
  // LIST - Colección ordenada que PERMITE duplicados
  // -------------------------------------------------
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];

  print('List original: $numbers');

  // PROPIEDADES DE LIST
  // -------------------
  // .length - Devuelve la cantidad de elementos en la lista
  print('Length: ${numbers.length}'); // 13

  // ACCESO POR ÍNDICE - Acceder a un elemento por su posición (inicia en 0)
  print('Index 0: ${numbers[0]}'); // 1

  // .first - Devuelve el primer elemento de la lista
  print('First: ${numbers.first}'); // 1

  // .reversed - Devuelve un Iterable con los elementos en orden inverso
  // IMPORTANTE: .reversed NO devuelve una List, devuelve un Iterable
  print(
    'Reversed: ${numbers.reversed}',
  ); // (10, 9, 9, 8, 7, 6, 5, 5, 5, 4, 3, 2, 1)

  // ITERABLE vs LIST
  // ----------------
  // Iterable: Es una colección "perezosa" (lazy) que se puede recorrer
  // List: Es una colección "concreta" en memoria con acceso por índice
  // Muchos métodos devuelven Iterables (más eficiente para operaciones grandes)
  final reversedNumbers = numbers.reversed;

  print('Iterable: $reversedNumbers'); // Muestra como (10, 9, 9, 8, 7...)

  // CONVERSIÓN: Iterable → List
  // ---------------------------
  // .toList() - Convierte un Iterable en una List concreta
  print(
    'List: ${reversedNumbers.toList()}',
  ); // [10, 9, 9, 8, 7, 6, 5, 5, 5, 4, 3, 2, 1]

  // CONVERSIÓN: Iterable → Set
  // --------------------------
  // .toSet() - Convierte a Set eliminando TODOS los duplicados
  // Set: Colección NO ordenada que NO permite duplicados
  print(
    'Set: ${reversedNumbers.toSet()}',
  ); // {10, 9, 8, 7, 6, 5, 4, 3, 2, 1} - ¡Sin duplicados!

  // MÉTODO WHERE() - Filtrar elementos
  // ----------------------------------
  // where() filtra elementos según una condición
  // Recibe una función que retorna true/false para cada elemento
  // (num) es el parámetro que representa cada número
  // Devuelve un Iterable con los elementos que cumplen la condición
  final numbersGreaterThan5 = numbers.where((num) {
    return num > 5; // Solo mantiene números mayores que 5
  });

  print('>5 iterable: $numbersGreaterThan5'); // (6, 7, 8, 9, 9, 10)

  // Convertir el resultado filtrado a Set (elimina duplicados)
  print(
    '>5 set: ${numbersGreaterThan5.toSet()}',
  ); // {6, 7, 8, 9, 10} - Sin duplicados
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ List - Colección ordenada, permite duplicados, acceso por índice
// ✓ Iterable - Colección "perezosa" que se puede recorrer
// ✓ Set - Colección sin orden específico, NO permite duplicados
// ✓ .length - Cantidad de elementos
// ✓ .first - Primer elemento
// ✓ .reversed - Invertir orden (devuelve Iterable)
// ✓ .toList() - Convertir a List
// ✓ .toSet() - Convertir a Set (elimina duplicados)
// ✓ .where() - Filtrar elementos según condición

// DIFERENCIAS CLAVE:
// ------------------
// List:     [1, 2, 2, 3]  → Ordenada, con duplicados, acceso por índice
// Set:      {1, 2, 3}     → Sin duplicados, sin orden garantizado
// Iterable: (1, 2, 2, 3)  → Secuencia perezosa, se evalúa cuando se usa

// CASOS DE USO:
// -------------
// ✓ List: Cuando necesitas orden y acceso por posición
// ✓ Set: Cuando necesitas eliminar duplicados o verificar existencia rápida
// ✓ Iterable: Para operaciones eficientes en cadena (.map, .where, etc.)
