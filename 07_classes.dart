void main() {
  // CREAR UNA INSTANCIA (OBJETO) DE LA CLASE HERO
  // ============================================
  // new Hero(...) - Crea un nuevo objeto de tipo Hero
  // NOTA: La palabra clave 'new' es opcional en Dart (puedes omitirla)
  //
  // OPCIÓN 1 - Parámetros posicionales (comentada):
  // final Hero magneto = Hero('Erik', 'Magnetismo');
  //
  // OPCIÓN 2 - Parámetros nombrados (RECOMENDADO - más legible):
  // name: 'Erik' - Asigna 'Erik' al atributo name
  // power: 'Magnetismo' - Asigna 'Magnetismo' al atributo power
  final Hero magneto = Hero(name: 'Erik', power: 'Magnetismo');

  // IMPRIMIENDO EL OBJETO
  // -------------------
  // print(magneto) - Imprime la representación del objeto
  // Llama automáticamente al método toString()
  print(magneto); // Erik - Magnetismo

  // ACCEDIENDO A ATRIBUTOS
  // ----------------------
  // magneto.name - Accede a la propiedad 'name' del objeto
  print(magneto.name); // Erik

  // magneto.power - Accede a la propiedad 'power' del objeto
  print(magneto.power); // Magnetismo
}

// DEFINICIÓN DE UNA CLASE
// =======================
// class NombreClase {
//   // Atributos
//   // Constructores
//   // Métodos
// }
class Hero {
  // ATRIBUTOS (Propiedades) DE LA CLASE
  // ===================================
  // String name: Propiedad de tipo String que almacena el nombre del héroe
  String name;

  // String power: Propiedad de tipo String que almacena el poder del héroe
  String power;

  // CONSTRUCTOR - Método especial para inicializar objetos
  // =====================================================
  // Se ejecuta automáticamente cuando creas un objeto new Hero(...)
  //
  // SINTAXIS: NombreClase({required tipo atributo, tipo atributo = valor})
  //
  // {required this.name, this.power = 'Sin poder'}
  // - required: Este parámetro es OBLIGATORIO
  // - this.name: Asigna el parámetro al atributo 'name' de la clase
  // - this.power = 'Sin poder': Parámetro opcional con valor por defecto
  //
  // EJEMPLOS DE USO:
  // Hero(name: 'Superman', power: 'Fuerza') → Superman - Fuerza
  // Hero(name: 'Batman') → Batman - Sin poder (valor por defecto)
  Hero({required this.name, this.power = 'Sin poder'});

  // OTROS TIPOS DE CONSTRUCTORES (comentados para referencia):
  // =========================================================

  // CONSTRUCTOR POSICIONAL:
  // Hero(this.name, this.power);
  // Uso: Hero('Erik', 'Magnetismo')

  // CONSTRUCTOR CON INITIALIZER LIST:
  // Hero(String pName, String pPower)
  //     : name = pName,
  //       power = pPower;
  // Más verboso pero da más control (útil para lógica compleja)

  // MÉTODO toString() - Convertir el objeto a String
  // =============================================
  // @override: Anotación que indica que estamos reemplazando un método de la clase padre
  //
  // toString() es un método especial que define cómo se representa el objeto como texto
  // Se llama automáticamente cuando haces print(objeto)
  //
  // Por defecto, Dart imprime algo como: Instance of 'Hero'
  // Nosotros lo personalizamos para que imprima: 'Erik - Magnetismo'
  @override
  String toString() {
    // Retorna un string con el nombre y poder del héroe
    return '$name - $power';
  }
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ Clase - Plantilla para crear objetos
// ✓ Atributo - Propiedad o característica de un objeto
// ✓ Constructor - Método especial para inicializar objetos
// ✓ this - Palabra clave que se refiere a la instancia actual
// ✓ required - Parámetro obligatorio en el constructor
// ✓ toString() - Método que define cómo se imprime el objeto
// ✓ @override - Anotación para reemplazar métodos de la clase padre

// ESTRUCTURA DE UNA CLASE:
// =======================
// class NombreClase {
//   // 1. ATRIBUTOS
//   String nombre;
//   int edad;
//   
//   // 2. CONSTRUCTOR
//   NombreClase({required this.nombre, required this.edad});
//   
//   // 3. MÉTODOS
//   void saludar() {
//     print('Hola, me llamo $nombre');
//   }
//   
//   @override
//   String toString() => '$nombre ($edad años)';
// }

// CICLO DE VIDA DE UN OBJETO:
// ===========================
// 1. DECLARACIÓN:
//    final Hero magneto = Hero(...)
//    - Se declara una variable que almacenará el objeto
//
// 2. INSTANTIACIÓN:
//    Hero(name: 'Erik', power: 'Magnetismo')
//    - Se crea una nueva instancia (objeto) de la clase Hero
//    - Se ejecuta el constructor
//
// 3. ASIGNACIÓN:
//    magneto = Hero(...)
//    - Se asigna el objeto a la variable
//
// 4. USO:
//    print(magneto.name)
//    - Se accede a los atributos y métodos del objeto

// DIFERENCIA: Clase vs Objeto
// ===========================
// CLASE (Hero):      Plantilla, definición, tipo de dato
// OBJETO (magneto):  Instancia específica, valor concreto
//
// Analogía:
// Clase = Plano de una casa
// Objeto = Casa construida a partir del plano
