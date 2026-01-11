void main() {
  // SUSCRIBIRSE A UN STREAM
  // =======================
  // emitNumbers().listen(callback)
  // - emitNumbers() retorna un Stream<int>
  // - listen() se SUSCRIBE al stream (comienza a escuchar)
  // - El callback se ejecuta cada vez que el Stream emite un valor
  //
  // DIFERENCIA CON FUTURE:
  // - Future: Retorna UN solo valor en el futuro
  // - Stream: Retorna MÚLTIPLES valores a lo largo del tiempo
  emitNumbers().listen((value) {
    // Este callback se ejecuta 5 veces (una por cada emisión)
    print('Stream value: $value');
  });
}

// FUNCIÓN QUE CREA UN STREAM
// ==========================
// Stream<int> emitNumbers()
// - Retorna un Stream que emite valores de tipo int
// - Es como una "tubería" de datos que fluyen continuamente
Stream<int> emitNumbers() {
  // STREAM.PERIODIC - Emite valores periódicamente
  // ==============================================
  // Stream.periodic(Duration, callback)
  // - Parámetro 1: Duration - Cada cuánto tiempo emitir
  // - Parámetro 2: callback(value) - Qué valor emitir
  //
  // FUNCIONAMIENTO:
  // 1. Cada 1 segundo, el Stream llama al callback
  // 2. El callback recibe un contador automático (0, 1, 2, 3, 4...)
  // 3. El callback retorna el valor que se emitirá
  // 4. El Stream emite ese valor a todos los suscriptores
  //
  // En este caso: retorna el mismo valor del contador (0, 1, 2, 3, 4)
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // value: contador automático (0, 1, 2, 3, 4, 5, 6...)
    // Retorna el valor sin modificar
    return value;
  }).take(5);
  // .take(5): Limita el Stream a emitir solo 5 valores y luego se cierra
  // Sin take(), el Stream continuaría infinitamente
}

// ORDEN DE EJECUCIÓN ESPERADO EN CONSOLA:
// ========================================
// (espera 1 segundo)
// Stream value: 0
// (espera 1 segundo)
// Stream value: 1
// (espera 1 segundo)
// Stream value: 2
// (espera 1 segundo)
// Stream value: 3
// (espera 1 segundo)
// Stream value: 4
// (Stream se cierra automáticamente)

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ Stream - Flujo continuo de datos a lo largo del tiempo
// ✓ Stream<T> - Stream que emite valores de tipo T
// ✓ Stream.periodic - Crear Stream que emite valores periódicamente
// ✓ listen() - Suscribirse a un Stream para recibir valores
// ✓ take(n) - Limitar el Stream a n emisiones
// ✓ Callback - Función que se ejecuta cada vez que llega un valor

// COMPARACIÓN: FUTURE vs STREAM
// ==============================
// FUTURE:
// - Retorna UN solo valor
// - Se completa una vez
// - await para esperar el resultado
// - Ejemplo: httpGet() retorna una respuesta
//
// STREAM:
// - Retorna MÚLTIPLES valores
// - Emite valores continuamente
// - listen() para recibir valores
// - Ejemplo: WebSocket, eventos de UI, sensores, timers

// ANATOMÍA DE UN STREAM:
// ======================
// Stream<int> numbers = Stream.periodic(...);
// numbers.listen(
//   (data) { print(data); },           // onData: Cada valor
//   onError: (err) { print(err); },     // onError: Si hay error
//   onDone: () { print('Done'); },      // onDone: Cuando se cierra
//   cancelOnError: false                // Continuar si hay error
// );

// MÉTODOS COMUNES DE STREAM:
// ==========================
// • take(n) - Toma solo los primeros n valores
// • skip(n) - Salta los primeros n valores
// • where(test) - Filtra valores según condición
// • map(convert) - Transforma cada valor
// • listen(callback) - Se suscribe al Stream
// • first - Obtiene el primer valor (retorna Future)
// • last - Obtiene el último valor (retorna Future)
// • toList() - Convierte todo el Stream a List (retorna Future)

// EJEMPLO CON TRANSFORMACIONES:
// =============================
// Stream<int> emitEvenNumbers() {
//   return Stream.periodic(Duration(seconds: 1), (value) => value)
//     .take(10)                      // Emite 0-9
//     .where((num) => num % 2 == 0) // Solo números pares
//     .map((num) => num * 2);        // Duplica el valor
// }
// // Resultado: 0, 4, 8, 12, 16

// TIPOS DE STREAMS:
// =================
// 1. SINGLE SUBSCRIPTION STREAM (por defecto)
//    - Solo un listener puede suscribirse
//    - Se cierra después de suscribirse
//    - Ejemplo: lectura de archivo, HTTP response
//
// 2. BROADCAST STREAM
//    - Múltiples listeners pueden suscribirse
//    - No se cierra automáticamente
//    - Ejemplo: eventos de UI, notificaciones
//    - Crear: stream.asBroadcastStream()

// MANEJO DE ERRORES EN STREAMS:
// =============================
// emitNumbers().listen(
//   (value) {
//     print('Value: $value');
//   },
//   onError: (error) {
//     print('Error: $error');
//   },
//   onDone: () {
//     print('Stream closed');
//   }
// );

// PAUSAR Y REANUDAR STREAMS:
// ==========================
// StreamSubscription<int> subscription = emitNumbers().listen(
//   (value) => print(value)
// );
//
// subscription.pause();   // Pausa el Stream
// subscription.resume();  // Reanuda el Stream
// subscription.cancel();  // Cancela la suscripción

// CREAR STREAMS PERSONALIZADOS:
// =============================
// Stream<int> countStream() async* {
//   for (int i = 0; i < 5; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     yield i;  // Emite el valor
//   }
// }

// STREAM CONTROLLERS (avanzado):
// ==============================
// StreamController<int> controller = StreamController<int>();
//
// // Agregar valores al Stream
// controller.sink.add(1);
// controller.sink.add(2);
// controller.sink.add(3);
//
// // Escuchar el Stream
// controller.stream.listen((value) => print(value));
//
// // Cerrar el Stream
// controller.close();

// CASOS DE USO REALES:
// ====================
// ✓ WebSockets (mensajes en tiempo real)
// ✓ Eventos de UI (clics, gestos, cambios de texto)
// ✓ Sensores (GPS, acelerómetro, giroscopio)
// ✓ Notificaciones push
// ✓ Temporizadores y contadores
// ✓ Monitoreo de cambios en bases de datos
// ✓ Streaming de audio/video
// ✓ Eventos del sistema
