void main() {
  // FUENTE DE DATOS: JSON en un Map (clave → valor)
  // ------------------------------------------------
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': true,
  };

  // CONSTRUCTOR NOMBRADO: fromJson
  // -------------------------------
  // Crea una instancia de Hero a partir del Map `rawJson`.
  // Útil cuando los datos vienen de APIs/archivos.
  final ironman = Hero.fromJson(rawJson);

  // CONSTRUCTOR NORMAL CON PARÁMETROS NOMBRADOS
  // -------------------------------------------
  // Alternativamente, puedes construir objetos manualmente.
  // Los parámetros nombrados hacen el código más legible.
  final thor = Hero(isAlive: true, power: 'Thunder', name: 'Thor');

  print(ironman); // Tony Stark - Money - isAlive: YES!
  print(thor); // Thor - Thunder - isAlive: YES!
}

// DEFINICIÓN DE LA CLASE
// =======================
class Hero {
  // ATRIBUTOS
  String name;
  String power;
  bool isAlive;

  // CONSTRUCTOR NORMAL (parámetros nombrados)
  // ========================================
  // `required` indica que esos argumentos son obligatorios.
  Hero({required this.name, required this.power, required this.isAlive});

  // CONSTRUCTOR NOMBRADO: fromJson
  // ================================
  // Permite construir `Hero` desde un Map (por ejemplo, JSON).
  // Se utiliza una "initializer list" para asignar valores
  // antes de que el constructor termine de ejecutarse.
  Hero.fromJson(Map<String, dynamic> json)
    : name = (json['name'] as String?) ?? 'No name found',
      power = (json['power'] as String?) ?? 'No power found',
      // Aseguramos que el tipo sea bool; si no lo es o falta, usamos `false`.
      isAlive = (json['isAlive'] is bool) ? json['isAlive'] as bool : false;

  // PERSONALIZAR IMPRESIÓN DEL OBJETO
  // =================================
  // `toString()` define cómo se imprime el objeto.
  @override
  String toString() {
    return '$name - $power - isAlive:  ${isAlive ? 'YES!' : 'Nope'}';
  }
}
