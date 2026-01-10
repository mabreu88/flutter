void main() {
  // TIPO MAP - Diccionarios o Mapas
  // --------------------------------
  // Un Map es una colección de pares clave-valor (key-value)
  // Cada clave es única y apunta a un valor
  // Sintaxis: { 'clave': valor, 'clave2': valor2 }
  //
  // DIFERENCIA CON LIST:
  // - List: Acceso por índice (posición): lista[0]
  // - Map: Acceso por clave (nombre): pokemon['name']

  final Map<String, dynamic> pokemon = {
    // PARES CLAVE-VALOR
    // -----------------
    // 'name' es la CLAVE, 'Pikachu' es el VALOR
    'name': 'Pikachu',

    // Las claves deben ser únicas
    'type': 'Electric',

    // Los valores pueden ser diferentes tipos (String, int, List, etc.)
    'level': 25,

    // Un valor puede ser una LIST (colección de elementos)
    'abilities': ['Static', 'Lightning Rod'],

    // MAPAS ANIDADOS - Un valor puede ser otro Map
    // -----------------------------------------------
    // Útil para organizar datos jerárquicamente
    // stats es un Map dentro de otro Map
    'stats': {'hp': 35, 'attack': 55, 'defense': 40, 'speed': 90},
  };

  // Imprime el Map completo
  // Resultado: {name: Pikachu, type: Electric, level: 25, abilities: [Static, Lightning Rod], stats: {hp: 35, attack: 55, defense: 40, speed: 90}}
  print(pokemon);

  // ACCEDIENDO A LOS VALORES DEL MAP
  // --------------------------------
  // Usa la clave entre corchetes: map['clave']

  // Acceder a un valor simple:
  // print(pokemon['name']);  // Pikachu

  // Acceder a un valor que es una lista:
  // print(pokemon['abilities']);  // [Static, Lightning Rod]

  // Acceder a un valor anidado (dentro de un Map dentro de otro):
  // OPCIÓN 1: Usar el operador ?. (Safe Navigation - SEGURO)
  // Si 'stats' es null, devuelve null en lugar de causar error
  print(pokemon['stats']!['hp']); // 35
  print(pokemon['stats']?['attack']); // 55
  print(pokemon['stats']['defense']); // 40

  // OPCIÓN 2: Usar ! (null assertion - solo si estás SEGURO de que no es null)
  // print(pokemon['stats']!['hp']); // 35
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ Map - Colección de pares clave-valor
// ✓ Clave (key) - Identificador único para acceder a un valor
// ✓ Valor (value) - El dato almacenado
// ✓ Mapas anidados - Maps dentro de otros Maps
// ✓ Tipos mixtos - Un Map puede contener diferentes tipos de datos

// ESTRUCTURA DE DATOS - COMPARACIÓN:
// -----------------------------------
// List: [1, 2, 3, 4, 5]  → Acceso por índice (posición)
// Map: {'nombre': 'Ana', 'edad': 25}  → Acceso por clave (nombre)

// CASOS DE USO COMUNES:
// --------------------
// ✓ Datos de un usuario: {'email': '...', 'edad': 30, 'ciudad': '...'}
// ✓ Configuración: {'theme': 'dark', 'language': 'es', 'volume': 80}
// ✓ Respuestas JSON de APIs: API devuelve datos como Maps
// ✓ Bases de datos: Registros se representan como Maps
// ✓ Cualquier estructura de datos que requiera acceso por nombre en lugar de posición
