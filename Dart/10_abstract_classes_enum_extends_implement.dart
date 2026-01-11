void main() {
  // CREAR INSTANCIAS DE DIFERENTES PLANTAS DE ENERGÍA
  // =================================================
  // NuclearPlant HEREDA de EnergyPlant (extends)
  final nuclearPlant = NuclearPlant(initialEnergy: 100);

  // GeotermicPlant IMPLEMENTA EnergyPlant (implements)
  final geotermicPlant = GeotermicPlant(energyLeft: 1000);

  // POLIMORFISMO EN ACCIÓN
  // ----------------------
  // Ambas plantas pueden usarse como EnergyPlant
  // chargePhone() acepta cualquier tipo de EnergyPlant
  print('nuclear: ${chargePhone(nuclearPlant)}');
  print('geotermic: ${chargePhone(geotermicPlant)}');
}

// FUNCIÓN QUE USA POLIMORFISMO
// ============================
// Parámetro: EnergyPlant plant
// - Acepta CUALQUIER clase que sea EnergyPlant o herede/implemente de ella
// - Esto es POLIMORFISMO: una función trabaja con múltiples tipos
//
// Esta función:
// 1. Verifica que haya suficiente energía (>= 10)
// 2. Si no hay suficiente, lanza una excepción
// 3. Si hay suficiente, retorna la energía restante después de cargar
double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }
  return plant.energyLeft - 10;
}

// ENUM - ENUMERACIÓN (conjunto fijo de valores)
// ==============================================
// enum define un tipo con valores predefinidos y limitados
// Solo puede ser uno de estos 4 valores, nada más
//
// PlantType.nuclear, PlantType.wind, etc.
//
// VENTAJAS:
// ✓ Seguridad de tipos (no puedes poner valores incorrectos)
// ✓ Autocompletado en el editor
// ✓ Documentación clara de opciones válidas
// ✓ Evita errores de escritura ("nucliar" vs "nuclear")
enum PlantType { nuclear, wind, geotermic, water }

// CLASE ABSTRACTA - Plantilla que NO se puede instanciar
// =======================================================
// abstract class: Define una estructura que otras clases deben seguir
//
// NO PUEDES HACER: final plant = EnergyPlant(...); ← ERROR
// SÍ PUEDES: Usarla como tipo y heredar/implementar de ella
//
// PROPÓSITO:
// - Define un "contrato" o "interfaz" que otras clases deben cumplir
// - Agrupa funcionalidad común
// - Establece métodos que las subclases DEBEN implementar
abstract class EnergyPlant {
  // ATRIBUTOS
  // ---------
  // energyLeft: Energía disponible en la planta
  double energyLeft;

  // type: Tipo de planta (usa el enum PlantType)
  // final: No se puede cambiar después de asignarse
  final PlantType type;

  // CONSTRUCTOR
  // -----------
  // Define qué parámetros necesita cualquier clase que herede/implemente
  EnergyPlant({required this.energyLeft, required this.type});

  // MÉTODO ABSTRACTO - Sin implementación
  // =====================================
  // void consumeEnergy(double amount);
  // - No tiene cuerpo { }
  // - Las clases que hereden/implementen DEBEN implementar este método
  // - Es un "contrato": "Si eres una EnergyPlant, DEBES tener consumeEnergy"
  void consumeEnergy(double amount);
}

// HERENCIA CON EXTENDS - "ES UN" (Relación de herencia)
// ======================================================
// class NuclearPlant extends EnergyPlant
// - NuclearPlant ES UNA EnergyPlant (hereda de ella)
// - HEREDA todos los atributos y métodos de EnergyPlant
// - DEBE implementar los métodos abstractos
//
// CARACTERÍSTICAS DE EXTENDS:
// ✓ Hereda implementación (reutiliza código)
// ✓ Solo puede extender de UNA clase (herencia simple)
// ✓ Usa super() para llamar al constructor de la clase padre
class NuclearPlant extends EnergyPlant {
  // CONSTRUCTOR
  // -----------
  // super(...): Llama al constructor de la clase padre (EnergyPlant)
  // Pasa los valores al constructor de EnergyPlant
  NuclearPlant({required double initialEnergy})
    : super(energyLeft: initialEnergy, type: PlantType.nuclear);

  // @override: Indica que estamos implementando un método de la clase padre
  // -----------------------------------------------------------------------
  // OBLIGATORIO implementar consumeEnergy porque es abstracto en EnergyPlant
  @override
  void consumeEnergy(double amount) {
    // Reduce la energía en la cantidad especificada
    energyLeft -= amount;
  }
}

// IMPLEMENTACIÓN CON IMPLEMENTS - "SE COMPORTA COMO" (Contrato)
// =============================================================
// class GeotermicPlant implements EnergyPlant
// - GeotermicPlant SE COMPORTA COMO EnergyPlant (cumple el contrato)
// - NO hereda implementación (debe implementar TODO desde cero)
// - Puede implementar MÚLTIPLES interfaces
//
// DIFERENCIA CON EXTENDS:
// - extends: Hereda código (reutiliza implementación)
// - implements: Solo hereda el "contrato" (debe reimplementar todo)
//
// CUÁNDO USAR IMPLEMENTS:
// ✓ Cuando quieres cumplir un contrato pero con implementación totalmente diferente
// ✓ Cuando necesitas implementar múltiples interfaces
// ✓ Cuando NO quieres heredar la implementación de la clase padre
class GeotermicPlant implements EnergyPlant {
  // @override: Debemos declarar TODOS los atributos de EnergyPlant
  // --------------------------------------------------------------
  @override
  double energyLeft;

  @override
  final PlantType type = PlantType.geotermic;

  // CONSTRUCTOR
  // -----------
  // No usamos super() porque NO estamos heredando
  // Simplemente inicializamos nuestros propios atributos
  GeotermicPlant({required this.energyLeft});

  // @override: Implementamos el método consumeEnergy
  // ------------------------------------------------
  // Implementación DIFERENTE a NuclearPlant
  // Las plantas geotérmicas son más eficientes (consumen solo el 50%)
  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ enum - Conjunto fijo de valores constantes
// ✓ abstract class - Clase que no se puede instanciar, sirve como plantilla
// ✓ extends - Herencia (ES UN), reutiliza código de la clase padre
// ✓ implements - Implementación (SE COMPORTA COMO), solo cumple el contrato
// ✓ super - Llamar al constructor/métodos de la clase padre
// ✓ @override - Indica que reemplazamos/implementamos un método
// ✓ Polimorfismo - Una función acepta múltiples tipos relacionados

// COMPARACIÓN: EXTENDS vs IMPLEMENTS
// ===================================
// EXTENDS (Herencia):
// - "NuclearPlant ES UNA EnergyPlant"
// - Hereda atributos y métodos
// - Reutiliza código
// - Solo puede extender de UNA clase
// - Usa super() para llamar al padre
//
// IMPLEMENTS (Interfaz):
// - "GeotermicPlant SE COMPORTA COMO EnergyPlant"
// - NO hereda implementación
// - Debe reimplementar TODO
// - Puede implementar MÚLTIPLES interfaces
// - NO usa super()

// CUÁNDO USAR CADA UNO:
// =====================
// EXTENDS:
// ✓ Relación "ES UN" (un perro ES UN animal)
// ✓ Quieres reutilizar código de la clase padre
// ✓ Hay una jerarquía natural de clases
//
// IMPLEMENTS:
// ✓ Relación "SE COMPORTA COMO" (un pato SE COMPORTA COMO volador)
// ✓ Quieres cumplir un contrato sin heredar implementación
// ✓ Necesitas implementar múltiples interfaces
//
// ABSTRACT CLASS:
// ✓ Quieres definir una plantilla/contrato
// ✓ Tienes métodos que las subclases DEBEN implementar
// ✓ Quieres compartir código común entre clases relacionadas

// POLIMORFISMO EN ACCIÓN:
// =======================
// double chargePhone(EnergyPlant plant)
// - Acepta NuclearPlant ✓
// - Acepta GeotermicPlant ✓
// - Acepta cualquier clase que sea/implemente EnergyPlant ✓
//
// Esto permite escribir código genérico que funciona con múltiples tipos
