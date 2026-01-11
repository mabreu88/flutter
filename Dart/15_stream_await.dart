void main() {
  // SUSCRIBIRSE AL STREAM
  // =====================
  // emitNumbers() retorna un Stream creado con async*/yield
  // listen() recibe cada valor emitido con yield
  emitNumbers().listen((value) {
    print('Stream value: $value');
  });
}

// CREAR STREAM CON ASYNC* Y YIELD
// ================================
// Stream emitNumbers() async* { ... }
//
// PALABRAS CLAVE:
// - async*: Indica que esta función es un GENERADOR ASINCRÓNICO
//   • Retorna un Stream automáticamente
//   • Puede usar await dentro
//   • Puede usar yield para emitir valores
//
// DIFERENCIA async vs async*:
// - async: Retorna Future (un solo valor futuro)
// - async*: Retorna Stream (múltiples valores a lo largo del tiempo)
Stream emitNumbers() async* {
  // DATOS A EMITIR
  // --------------
  // Lista de valores que queremos emitir uno por uno
  final valuesToEmit = [1, 2, 3, 4, 5];

  // ITERAR Y EMITIR VALORES
  // =======================
  // for (int i in valuesToEmit)
  // - Recorre cada elemento de la lista
  // - Para cada elemento, espera 1 segundo y lo emite
  for (int i in valuesToEmit) {
    // AWAIT - Esperar antes de emitir
    // ===============================
    // await Future.delayed(Duration(seconds: 1))
    // - Pausa la ejecución por 1 segundo
    // - Esto crea un intervalo de 1 segundo entre emisiones
    // - Solo puedes usar await dentro de funciones async* o async
    await Future.delayed(const Duration(seconds: 1));

    // YIELD - Emitir un valor al Stream
    // ==================================
    // yield i;
    // - Emite el valor 'i' al Stream
    // - Todos los listeners recibirán este valor
    // - Después de yield, la función continúa (a diferencia de return)
    // - Se puede usar yield múltiples veces en la misma función
    //
    // DIFERENCIA yield vs return:
    // - return: Termina la función y devuelve un valor (una vez)
    // - yield: Emite un valor y continúa ejecutando (múltiples veces)
    yield i;
  }
  // Cuando termina el bucle, el Stream se cierra automáticamente
}

// ORDEN DE EJECUCIÓN ESPERADO EN CONSOLA:
// ========================================
// (espera 1 segundo)
// Stream value: 1
// (espera 1 segundo)
// Stream value: 2
// (espera 1 segundo)
// Stream value: 3
// (espera 1 segundo)
// Stream value: 4
// (espera 1 segundo)
// Stream value: 5
// (Stream se cierra automáticamente)

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ async* - Generador asincrónico que retorna Stream
// ✓ yield - Emite un valor al Stream y continúa
// ✓ await - Espera dentro de async* antes de continuar
// ✓ Generadores - Funciones que producen secuencias de valores
// ✓ Control manual - Tienes control total sobre cuándo emitir

// COMPARACIÓN: Stream.periodic vs async*/yield
// ============================================
//
// Stream.periodic (Lección anterior):
// -----------------------------------
// Stream<int> emitNumbers() {
//   return Stream.periodic(Duration(seconds: 1), (value) => value)
//     .take(5);
// }
//
// CARACTERÍSTICAS:
// • Automático (emite en intervalos regulares)
// • Menos control sobre qué y cuándo emitir
// • Bueno para contadores y temporizadores simples
//
// ----
//
// async*/yield (Esta lección):
// ----------------------------
// Stream emitNumbers() async* {
//   for (int i in [1,2,3,4,5]) {
//     await Future.delayed(Duration(seconds: 1));
//     yield i;
//   }
// }
//
// CARACTERÍSTICAS:
// ✓ Control manual total
// ✓ Puedes hacer lógica compleja entre emisiones
// ✓ Puedes usar await para operaciones asincrónicas
// ✓ Puedes emitir desde diferentes fuentes
// ✓ RECOMENDADO cuando necesitas lógica personalizada

// SINTAXIS DE GENERADORES:
// ========================
// GENERADOR SÍNCRONO (Iterable):
// Iterable<int> count() sync* {
//   yield 1;
//   yield 2;
//   yield 3;
// }
// - sync*: Retorna Iterable (síncrono)
// - yield: Emite valores inmediatamente
// - No puede usar await
//
// GENERADOR ASINCRÓNICO (Stream):
// Stream<int> count() async* {
//   yield 1;
//   await Future.delayed(Duration(seconds: 1));
//   yield 2;
// }
// - async*: Retorna Stream (asincrónico)
// - yield: Emite valores a lo largo del tiempo
// - Puede usar await

// YIELD* - Emitir otro Stream completo
// ====================================
// Stream<int> numbers() async* {
//   yield 1;
//   yield 2;
//   yield* otherStream();  // Emite todos los valores de otherStream
//   yield 3;
// }
//
// yield* emite TODOS los valores de otro Stream/Iterable

// EJEMPLO COMPLEJO CON LÓGICA CONDICIONAL:
// ========================================
// Stream<int> smartNumbers() async* {
//   for (int i = 1; i <= 10; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     
//     if (i % 2 == 0) {
//       yield i;  // Solo emite números pares
//     }
//     
//     if (i == 5) {
//       yield -1; // Emite un valor especial
//     }
//   }
// }

// MANEJO DE ERRORES EN async*:
// ============================
// Stream<int> numbersWithErrors() async* {
//   for (int i = 0; i < 5; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     
//     if (i == 3) {
//       throw Exception('Error at 3');  // Lanza error
//     }
//     
//     yield i;
//   }
// }
//
// // En el listener:
// numbersWithErrors().listen(
//   (value) => print(value),
//   onError: (error) => print('Error: $error')
// );

// CONSUMIR STREAMS CON AWAIT FOR:
// ===============================
// Alternativa a listen() para procesar Streams:
//
// Future<void> processStream() async {
//   await for (int value in emitNumbers()) {
//     print('Value: $value');
//     // Se ejecuta para cada valor emitido
//   }
//   print('Stream finished');
// }

// EJEMPLO PRÁCTICO - Stream de datos de API:
// ==========================================
// Stream<User> fetchUsers() async* {
//   final userIds = [1, 2, 3, 4, 5];
//   
//   for (int id in userIds) {
//     // Llamada asincrónica a API
//     final user = await fetchUserFromApi(id);
//     yield user;  // Emite cada usuario apenas llega
//     
//     // Espera antes del siguiente
//     await Future.delayed(Duration(milliseconds: 500));
//   }
// }

// CASOS DE USO PARA async*/yield:
// ===============================
// ✓ Procesar listas grandes de forma incremental
// ✓ Emitir resultados de múltiples llamadas a API
// ✓ Streaming de datos de archivos
// ✓ Procesar datos de bases de datos por lotes
// ✓ Generación de secuencias complejas
// ✓ Combinar múltiples fuentes de datos
// ✓ Transformación de datos con lógica compleja

// CUÁNDO USAR CADA MÉTODO:
// ========================
// Stream.periodic:
// ✓ Temporizadores regulares
// ✓ Contadores automáticos
// ✓ Intervalos fijos sin lógica compleja
//
// async*/yield:
// ✓ Lógica personalizada entre emisiones
// ✓ Datos de múltiples fuentes
// ✓ Operaciones asincrónicas (API, archivos, DB)
// ✓ Secuencias con patrones complejos
//
// StreamController:
// ✓ Eventos externos (UI, websockets)
// ✓ Necesitas control imperativo (add, close)
// ✓ Múltiples productores
