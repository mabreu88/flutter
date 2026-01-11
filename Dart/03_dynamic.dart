// ============================================
// LECCIÓN 3: EL TIPO DYNAMIC EN DART
// ============================================

// En esta lección aprenderás:
// - Qué es el tipo 'dynamic'
// - Cuándo y por qué usarlo
// - Las ventajas y DESVENTAJAS de usar dynamic

void main() {
  final String pokemon = 'Pikachu';
  final int hp = 100;
  final bool isAlive = true;
  final List<String> abilities = [
    'Electric Shock',
    'Quick Attack',
    'Thunderbolt',
  ];
  final sprites = <String>['sprite_front.png', 'sprite_back.png'];

  // TIPO DYNAMIC - Variables de tipo flexible
  // ------------------------------------------
  // ⚠️ IMPORTANTE: 'dynamic' permite que una variable cambie de tipo en cualquier momento
  // A diferencia de String, int, bool que son tipos fijos, dynamic puede ser CUALQUIER COSA

  // Empieza como String (texto)
  dynamic errorMessage = 'An error occurred';

  // Ahora cambia a int (número entero) - ¡Dart lo permite!
  errorMessage = 404;

  // Ahora cambia a bool (booleano) - ¡También permitido!
  errorMessage = true;

  // Ahora cambia a List (lista de números) - ¡Sin problemas!
  errorMessage = [1, 2, 3];

  // Al imprimir, mostrará el último valor asignado: [1, 2, 3]
  print(errorMessage);

  print('Pokemon: $pokemon');
  print('HP: $hp');
  print('Is Alive: $isAlive');
  print('Abilities: ${abilities.join(', ')}');
  print('Sprites: ${sprites.join(', ')}');
}

// ⚠️ CUÁNDO USAR DYNAMIC:
// -----------------------
// ✓ Cuando trabajas con JSON (datos de internet)
// ✓ Cuando no conoces el tipo de dato que recibirás
// ✓ Al interactuar con APIs externas
// ✓ En casos muy específicos donde necesitas flexibilidad extrema

// ❌ DESVENTAJAS DE USAR DYNAMIC:
// -------------------------------
// • Pierdes la seguridad de tipos (type safety)
// • El editor NO te ayudará con autocompletado
// • Puedes tener errores en tiempo de ejecución (crashes)
// • El código es más difícil de mantener y entender

// 💡 RECOMENDACIÓN:
// -----------------
// Usa tipos específicos (String, int, bool, etc.) siempre que puedas.
// Solo usa 'dynamic' cuando realmente lo necesites.

// COMPARACIÓN:
// ------------
// String name = 'Ana';
// name = 123;  // ❌ ERROR: No puedes asignar un número a un String
//
// dynamic data = 'Ana';
// data = 123;  // ✓ OK: dynamic acepta cualquier tipo
