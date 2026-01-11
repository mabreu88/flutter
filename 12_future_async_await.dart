// FUNCIÓN MAIN - asincrónica
// ===================================
// void main() async { ... }
// - La palabra clave 'async' permite usar 'await' dentro de la función
// - main puede ser async en Dart
// - El programa esperará a que se completen los awaits
void main() async {
  print('Program start');
  // ↑ Se ejecuta primero

  // TRY/CATCH - Manejo de errores en asincronía
  // ==========================================
  // Similar a manejo de excepciones sincrónico
  // - try: Bloque donde ocurren operaciones asincrónicas
  // - catch: Se ejecuta si algo falla
  // - finally: (opcional) Se ejecuta siempre al final
  try {
    // AWAIT - Espera a que el Future se complete
    // ==========================================
    // final value = await httpGet(...)
    // - 'await' pausa la ejecución aquí
    // - Espera a que httpGet() retorne un valor
    // - Cuando httpGet se completa, continúa la siguiente línea
    // - IMPORTANTE: Solo puedes usar 'await' en funciones async
    final value = await httpGet('https://google.com');
    print(value);
  } catch (err) {
    // Se ejecuta si httpGet() lanza una excepción
    print('We have an error: $err');
  }
  print('Program finish');
  // ↑ Se ejecuta después de que se resuelva el await
}

// FUNCIÓN ASINCRÓNICA QUE RETORNA FUTURE
// =====================================
// Future<String> httpGet(String url) async { ... }
//
// async: Indica que esta función es asincrónica
// - Puede usar 'await' dentro de ella
// - Automáticamente retorna un Future (incluso sin escribir Future explícitamente)
// - El tipo de retorno es el tipo contenido en el Future (String)
//
// ¿Por qué retorna Future<String>?
// - Aunque la función es async, sigue siendo asincrónica
// - Quien la llama puede hacer await o usar then()
Future<String> httpGet(String url) async {
  // AWAIT DENTRO DE FUNCIÓN ASYNC
  // =============================
  // await Future.delayed(...)
  // - Espera 2 segundos antes de continuar
  // - Durante estos 2 segundos, el programa NO se bloquea
  // - Otros código puede ejecutarse en otros "hilos" (event loop)
  await Future.delayed(const Duration(seconds: 2));

  // LANZAR EXCEPCIÓN
  // ================
  // throw hace que el Future se completa con error
  throw 'Petition error';

  // RETORNO EXITOSO (comentado)
  // ===========================
  // return 'Petition value';
  // - Si descomentaras esto, el Future se completaría con éxito
  // - El await en main() recibiría este valor
}

// ORDEN DE EJECUCIÓN ESPERADO EN CONSOLA:
// ========================================
// Program start
// (espera 2 segundos)
// We have an error: Petition error
// Program finish
//
// Si cambias a return exitoso:
// Program start
// (espera 2 segundos)
// Petition value
// Program finish

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ async - Declara una función asincrónica
// ✓ await - Pausa la ejecución hasta que un Future se complete
// ✓ try/catch - Manejo de errores en asincronía
// ✓ throw - Lanza una excepción que se captura en catch
// ✓ Future - Representa un valor futuro/promesa
// ✓ Duration - Representa un período de tiempo

// COMPARACIÓN: then/catchError vs async/await
// ============================================
//
// ESTILO: then/catchError (Anterior)
// -----------------------------------
// httpGet(url)
//   .then((value) {
//     print(value);
//   })
//   .catchError((err) {
//     print('Error: $err');
//   });
//
// VENTAJAS:
// • Funcional, encadenamiento natural
//
// DESVENTAJAS:
// • Menos legible con múltiples pasos
// • Callbacks anidados ("callback hell")
//
// ----
//
// ESTILO: async/await (RECOMENDADO)
// ----------------------------------
// try {
//   final value = await httpGet(url);
//   print(value);
// } catch (err) {
//   print('Error: $err');
// }
//
// VENTAJAS:
// ✓ Código más legible (parece síncrono)
// ✓ Manejo de errores familiar (try/catch)
// ✓ Más fácil de entender para principiantes
// ✓ Mejor para múltiples pasos asincronos secuenciales
//
// DESVENTAJAS:
// • Requiere función async

// CUÁNDO USAR async/await vs then/catchError
// ==========================================
// ASYNC/AWAIT:
// ✓ Operaciones secuenciales (paso 1, luego paso 2)
// ✓ Cuando necesitas el resultado antes de continuar
// ✓ Código más legible y mantenible
// ✓ RECOMENDADO en la mayoría de casos
//
// then/catchError:
// ✓ Operaciones paralelas (múltiples Futures simultáneamente)
// ✓ Transformaciones encadenadas
// ✓ Cuando necesitas máxima legibilidad funcional

// OPERACIONES ASINCRÓNICAS SECUENCIALES
// =====================================
// Esperar uno después de otro:
//
// Future<void> fetchData() async {
//   try {
//     final user = await getUser(1);
//     print('User: $user');
//
//     final posts = await getUserPosts(user.id);
//     print('Posts: $posts');
//
//     final comments = await getPostComments(posts.first);
//     print('Comments: $comments');
//   } catch (err) {
//     print('Error: $err');
//   }
// }

// OPERACIONES ASINCRÓNICAS PARALELAS
// ==================================
// Ejecutar múltiples Futures simultáneamente:
//
// Future<void> fetchParallel() async {
//   try {
//     final results = await Future.wait([
//       getUser(1),
//       getUser(2),
//       getUser(3),
//     ]);
//     print('Users: $results');
//   } catch (err) {
//     print('Error: $err');
//   }
// }
