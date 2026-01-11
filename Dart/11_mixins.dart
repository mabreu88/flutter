void main() {
  // CREAR INSTANCIAS DE DIFERENTES ANIMALES
  // =======================================
  final flipper = Dolphin();
  flipper.swim(); // I can swim!

  final batman = Bat();
  batman.fly(); // I can fly!
  batman.walk(); // I can walk!

  final donald = Duck();
  donald.fly(); // I can fly!
  donald.walk(); // I can walk!
  donald.swim(); // I can swim!
}

// CLASES BASE - Jerarquía de animales
// ===================================
abstract class Animal {}

// Mamíferos (animales vertebrados de sangre caliente)
abstract class Mammal extends Animal {}

// Aves (animales con plumas, alas)
abstract class Bird extends Animal {}

// Peces (animales acuáticos con aletas)
abstract class Fish extends Animal {}

// MIXINS - Reutilización de comportamiento sin herencia
// ======================================================
// mixin define un conjunto de métodos que pueden ser "mezclados" en otras clases
//
// DIFERENCIA CON HERENCIA:
// - Herencia: Una clase ES UN tipo de otra (jerarquía rígida)
// - Mixin: Una clase TIENE el comportamiento de un mixin (composición flexible)
//
// VENTAJAS DE MIXINS:
// ✓ Reutilización de código sin limitaciones de herencia única
// ✓ Composición flexible: una clase puede tener MÚLTIPLES mixins
// ✓ Evita la "explosión de clases" en jerarquías complejas
// ✓ Código más organizado y mantenible

// MIXIN 1: Flying - Comportamiento de volar
// ==========================================
// Define métodos que cualquier animal que vuele debe tener
mixin Flying {
  // Método que implementan todos los que pueden volar
  // arrow function (=>) para una línea simple
  void fly() => print('I can fly!');
}

// MIXIN 2: Swimmer - Comportamiento de nadar
// ============================================
mixin Swimmer {
  void swim() => print('I can swim!');
}

// MIXIN 3: Walker - Comportamiento de caminar
// ============================================
mixin Walker {
  void walk() => print('I can walk!');
}

// USANDO MIXINS CON "with"
// ========================
// Sintaxis: class NombreClase extends ClaseBase with Mixin1, Mixin2, ... { }
//
// "with" agrega el comportamiento del mixin a la clase
// Una clase puede tener MÚLTIPLES mixins (separados por comas)

// DELFÍN - Es un mamífero que nada
// =================================
// class Dolphin extends Mammal with Swimmer
// - Hereda de Mammal (es un mamífero)
// - Usa el mixin Swimmer (adquiere el método swim())
// - Resultado: Dolphin es un Mammal que PUEDE NADAR
class Dolphin extends Mammal with Swimmer {}

// MURCIÉLAGO - Es un mamífero que vuela y camina
// ===============================================
// class Bat extends Mammal with Flying, Walker
// - Hereda de Mammal
// - Usa dos mixins: Flying y Walker
// - Resultado: Bat puede VOLAR Y CAMINAR (nada)
class Bat extends Mammal with Flying, Walker {}

// GATO - Es un mamífero que camina
// =================================
class Cat extends Mammal with Walker {}

// PALOMA - Es un ave que vuela y camina
// ======================================
class Dove extends Bird with Flying, Walker {}

// PATO - Es un ave que vuela, camina Y nada
// ===========================================
// class Duck extends Bird with Swimmer, Flying, Walker
// - Hereda de Bird
// - Usa TRES mixins: puede nadar, volar y caminar
// - Esto sería muy difícil de modelar con herencia tradicional
class Duck extends Bird with Swimmer, Flying, Walker {}

// PEZ TIBURÓN - Es un pez que nada
// ================================
class Shark extends Fish with Swimmer {}

// PEZ VOLADOR - Es un pez que nada Y vuela
// ========================================
class FlyingFish extends Fish with Swimmer, Flying {}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ mixin - Define métodos reutilizables que se pueden mezclar
// ✓ with - Palabra clave para agregar mixins a una clase
// ✓ Composición - Combinar behaviors en lugar de jerarquía rígida
// ✓ Múltiples mixins - Una clase puede usar varios mixins
// ✓ Orden de mixins - Importa para resolución de conflictos

// COMPARACIÓN: HERENCIA vs MIXINS
// ================================
// HERENCIA (ES UN):
// class Dolphin extends Mammal
// - Relación: "Dolphin ES UN Mammal"
// - Jerarquía rígida
// - Solo puede heredar de UNA clase
//
// MIXINS (TIENE EL COMPORTAMIENTO DE):
// class Dolphin extends Mammal with Swimmer
// - Composición: "Dolphin ES UN Mammal QUE PUEDE NADAR"
// - Flexible: puede tener múltiples mixins
// - Reutiliza código sin limitaciones

// PROBLEMA QUE RESUELVEN LOS MIXINS:
// ==================================
// Imagina SIN MIXINS:
// - class SwimmingAnimal { swim() {} }
// - class FlyingAnimal { fly() {} }
// - class WalkingAnimal { walk() {} }
// - class DuckLike... ¿De cuál heredar? ¿Qué si necesito los tres?
//
// CON MIXINS:
// - class Duck extends Bird with Swimmer, Flying, Walker
// - ¡Problema resuelto! Duck tiene todos los comportamientos.

// ORDEN DE RESOLUCIÓN (Method Resolution Order):
// ===============================================
// class Duck extends Bird with Swimmer, Flying, Walker
//
// Si múltiples mixins tienen el mismo método:
// 1. Duck (clase principal)
// 2. Walker (último mixin)
// 3. Flying
// 4. Swimmer (primer mixin)
// 5. Bird (clase padre)
//
// El ÚLTIMO mixin tiene prioridad más alta

// CUÁNDO USAR MIXINS:
// ===================
// ✓ Compartir comportamiento entre clases no relacionadas
// ✓ Clases que necesitan MÚLTIPLES comportamientos
// ✓ Cuando la herencia no es suficiente o natural
// ✓ Traits o comportamientos reutilizables (logging, serialización, etc.)
//
// NO USAR MIXINS CUANDO:
// ✗ La herencia es más natural (relación claro "ES UN")
// ✗ Solo necesitas un nivel de reutilización

// EJEMPLO DE ESTRUCTURA NATURAL:
// ==============================
// abstract class Animal {}
// abstract class Mammal extends Animal {}
// abstract class Bird extends Animal {}
//
// mixin Swimmer { swim() {} }
// mixin Flying { fly() {} }
// mixin Walker { walk() {} }
//
// class Dolphin extends Mammal with Swimmer;
// class Bat extends Mammal with Flying, Walker;
// class Duck extends Bird with Swimmer, Flying, Walker;
