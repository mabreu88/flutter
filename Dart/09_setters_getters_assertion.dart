void main() {
  // CREAR UN CUADRADO CON LADO = -10
  // ---------------------------------
  // NOTA: Este código lanzará un error porque -10 es negativo
  // El assert en el constructor verificará que side >= 0
  // ⚠️ Si ejecutas esto, verás: Assertion failed: "Side must be positive"
  final mySquare = Square(side: -10);

  // USANDO UN SETTER (comentado)
  // ----------------------------
  // mySquare.side = -5;
  // Si descomentaras esto, lanzaría un error porque -5 es negativo
  // El setter valida que el valor sea positivo

  // USANDO UN GETTER
  // ----------------
  // mySquare.area NO es un método (no lleva paréntesis)
  // Es una propiedad calculada que usa el getter
  print('area: ${mySquare.area}');
}

// DEFINICIÓN DE LA CLASE
// =======================
class Square {
  // ATRIBUTO PRIVADO
  // ================
  // _side: El guión bajo _ indica que es PRIVADO
  // Solo puede accederse desde dentro de esta clase
  // Otras clases/archivos NO pueden leer ni modificar _side directamente
  // Esto se llama ENCAPSULACIÓN (proteger los datos)
  double _side;

  // CONSTRUCTOR CON ASSERTION
  // =========================
  // Sintaxis: NombreClase({parámetros}) : assert(condición, mensaje), inicialización;
  //
  // assert(side >= 0, 'Side must be positive'):
  // - assert: Verifica una condición en desarrollo
  // - Si side < 0, el programa se detiene y muestra el mensaje
  // - Las assertions solo funcionan en modo DEBUG (no en producción)
  // - Útil para detectar errores durante el desarrollo
  //
  // _side = side:
  // - Asigna el parámetro al atributo privado después de validarlo
  Square({required double side})
    : assert(side >= 0, 'Side must be positive'),
      _side = side;

  // GETTER - Propiedad calculada (solo lectura)
  // ===========================================
  // Sintaxis: TipoDeRetorno get nombrePropiedad { ... }
  //
  // double get area:
  // - 'get' indica que es un getter
  // - Se usa como una propiedad: mySquare.area (sin paréntesis)
  // - Calcula el área al momento de accederlo
  // - NO almacena el valor, lo calcula cada vez
  //
  // VENTAJAS:
  // - Sintaxis más limpia que un método
  // - Parece un atributo pero se calcula dinámicamente
  // - Útil para valores derivados/calculados
  double get area {
    return _side * _side;
  }

  // SETTER - Validación al asignar (escritura controlada)
  // ====================================================
  // Sintaxis: set nombrePropiedad(TipoDeParametro valor) { ... }
  //
  // set side(double value):
  // - 'set' indica que es un setter
  // - Se usa como asignación: mySquare.side = 10
  // - Permite validar/transformar el valor antes de asignarlo
  //
  // En este caso:
  // 1. Imprime el valor que se intenta asignar
  // 2. Valida que sea positivo
  // 3. Si es válido, lo asigna a _side
  // 4. Si NO es válido, lanza una excepción (throw)
  //
  // VENTAJAS:
  // - Control total sobre qué valores se pueden asignar
  // - Validación centralizada
  // - Mantiene la integridad de los datos
  set side(double value) {
    print('Setting side to $value');
    if (value <= 0) throw 'Side must be positive';
    _side = value;
  }

  // MÉTODO NORMAL (para comparación)
  // ================================
  // calculatedArea() es un MÉTODO tradicional
  // Se llama con paréntesis: mySquare.calculatedArea()
  //
  // DIFERENCIA CON GETTER:
  // - Método: mySquare.calculatedArea()  ← Con paréntesis
  // - Getter: mySquare.area              ← Sin paréntesis (como propiedad)
  double calculatedArea() {
    return _side * _side;
  }
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ _atributo - Atributo privado (solo accesible en la clase)
// ✓ get - Define un getter (propiedad calculada de solo lectura)
// ✓ set - Define un setter (validación al asignar valores)
// ✓ assert - Validación en constructor (solo en modo DEBUG)
// ✓ throw - Lanza una excepción (error)
// ✓ Encapsulación - Proteger datos usando privacidad

// GETTERS vs MÉTODOS:
// ===================
// GETTER:
//   double get area { return _side * _side; }
//   Uso: mySquare.area  ← Sin paréntesis
//
// MÉTODO:
//   double calculatedArea() { return _side * _side; }
//   Uso: mySquare.calculatedArea()  ← Con paréntesis

// CUÁNDO USAR GETTERS/SETTERS:
// ============================
// GETTERS:
// ✓ Valores calculados/derivados (área, perímetro, etc.)
// ✓ Formatear datos antes de devolverlos
// ✓ Propiedades de solo lectura
//
// SETTERS:
// ✓ Validar valores antes de asignarlos
// ✓ Transformar datos (convertir a mayúsculas, redondear, etc.)
// ✓ Mantener invariantes (reglas que siempre deben cumplirse)

// ASSERTIONS vs VALIDACIÓN CON THROW:
// ===================================
// ASSERT (en constructor):
// - Solo funciona en modo DEBUG
// - Para detectar errores de programación
// - Se desactiva en producción (RELEASE)
//
// THROW (en setter/método):
// - Funciona siempre (DEBUG y RELEASE)
// - Para validar datos de usuario
// - Errores que pueden ocurrir en producción

// EJEMPLO DE USO CORRECTO:
// ========================
// final square = Square(side: 10);    // ✓ OK
// print(square.area);                  // 100
// square.side = 5;                     // ✓ OK, actualiza _side a 5
// print(square.area);                  // 25
// square.side = -3;                    // ❌ ERROR: "Side must be positive"
