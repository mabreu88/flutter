// ============================================
// LECCIÓN 2: VARIABLES Y TIPOS DE DATOS EN DART
// ============================================

// En esta lección aprenderás:
// - Diferentes tipos de datos primitivos (String, int, bool)
// - Listas (List)
// - La palabra clave 'final'
// - Inferencia de tipos
// - Interpolación avanzada de strings
// - Métodos de listas

void main() {
  // PALABRA CLAVE: final
  // --------------------
  // 'final' significa que la variable NO puede cambiar su valor después de ser asignada
  // Es como una constante en tiempo de ejecución
  // Sintaxis: final TipoDeDato nombreVariable = valor;

  // TIPO STRING - Cadenas de texto
  // ------------------------------
  // Almacena texto entre comillas simples o dobles
  final String pokemon = 'Pikachu';

  // TIPO INT - Números enteros
  // --------------------------
  // Almacena números sin decimales (positivos o negativos)
  final int hp = 100;

  // TIPO BOOL - Valores booleanos
  // -----------------------------
  // Solo puede ser true (verdadero) o false (falso)
  // Muy útil para condiciones y estados
  final bool isAlive = true;

  // TIPO LIST - Listas/Arreglos
  // ---------------------------
  // Colección ordenada de elementos del mismo tipo
  // List<String> significa "lista de strings"
  // Los elementos se separan por comas dentro de corchetes []
  final List<String> abilities = [
    'Electric Shock',
    'Quick Attack',
    'Thunderbolt',
  ];

  // INFERENCIA DE TIPOS
  // -------------------
  // Dart puede deducir el tipo automáticamente
  // <String> antes de los corchetes especifica el tipo de elementos
  // No necesitas escribir 'List<String>' al inicio porque Dart lo infiere
  final sprites = <String>['sprite_front.png', 'sprite_back.png'];

  // IMPRIMIENDO VALORES
  // -------------------
  // Interpolación simple: $nombreVariable
  print('Pokemon: $pokemon');
  print('HP: $hp');
  print('Is Alive: $isAlive');

  // INTERPOLACIÓN AVANZADA con {}
  // -----------------------------
  // Cuando necesitas llamar métodos o hacer operaciones, usa ${expresión}
  // abilities.join(', ') une todos los elementos de la lista con ", " como separador
  print('Abilities: ${abilities.join(', ')}');
  print('Sprites: ${sprites.join(', ')}');

  // RESULTADO ESPERADO EN CONSOLA:
  // Pokemon: Pikachu
  // HP: 100
  // Is Alive: true
  // Abilities: Electric Shock, Quick Attack, Thunderbolt
  // Sprites: sprite_front.png, sprite_back.png
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ final - Variables inmutables (no se pueden reasignar)
// ✓ String - Texto
// ✓ int - Números enteros
// ✓ bool - Verdadero o falso
// ✓ List<Tipo> - Listas de elementos del mismo tipo
// ✓ Inferencia de tipos - Dart deduce el tipo automáticamente
// ✓ ${expresión} - Interpolación con expresiones/métodos
// ✓ .join() - Método para unir elementos de una lista en un string

// DIFERENCIAS IMPORTANTES:
// ------------------------
// final vs var:
//   - final: NO se puede reasignar (pokemon = 'Charizard'; ❌ ERROR)
//   - var: SÍ se puede reasignar (var nombre = 'Ana'; nombre = 'Luis'; ✓ OK)
