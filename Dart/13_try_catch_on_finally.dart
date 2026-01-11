void main() async {
  print('Program start');

  // ESTRUCTURA COMPLETA: try-on-catch-finally
  // =========================================
  try {
    // BLOQUE TRY - Código que puede fallar
    // ------------------------------------
    // Aquí se ejecuta código que podría lanzar excepciones
    final value = await httpGet('https://google.com');
    print('Success!!: $value');

    // ON - Captura excepciones ESPECÍFICAS
    // =====================================
    // on Exception catch(err) { ... }
    // - 'on Exception': Solo captura excepciones de tipo Exception
    // - 'catch(err)': Variable que contiene la excepción capturada
    //
    // USO:
    // - Cuando quieres manejar diferentes tipos de errores de forma diferente
    // - Más específico que catch genérico
    //
    // ORDEN DE EVALUACIÓN:
    // 1. Dart busca el primer 'on' que coincida con el tipo de excepción
    // 2. Si ningún 'on' coincide, busca el catch genérico
    // 3. Si no hay catch genérico, la excepción se propaga
  } on Exception catch (err) {
    // Se ejecuta si la excepción es de tipo Exception
    // (como throw Exception('mensaje'))
    print('We have an Exception: $err');
  } catch (err) {
    // CATCH GENÉRICO - Captura CUALQUIER error
    // ========================================
    // catch(err) sin 'on' captura todo lo que no fue capturado antes
    // - Strings lanzados con throw
    // - Otros tipos de errores
    // - Cualquier excepción no capturada por los 'on' anteriores
    //
    // IMPORTANTE: Debe ir DESPUÉS de los 'on' específicos
    print('We have an error: $err');
  } finally {
    // FINALLY - Siempre se ejecuta
    // ============================
    // El bloque finally se ejecuta SIEMPRE, sin importar:
    // ✓ Si el try se completó con éxito
    // ✓ Si se lanzó una excepción
    // ✓ Si hubo un return en try o catch
    //
    // USOS COMUNES:
    // - Cerrar archivos
    // - Cerrar conexiones de red/base de datos
    // - Liberar recursos
    // - Logging/registro
    // - Limpiar variables temporales
    print('End of try catch');
  }

  print('Program finish');
}

// FUNCIÓN QUE LANZA DIFERENTES TIPOS DE EXCEPCIONES
// =================================================
Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 2));

  // OPCIÓN 1: Lanzar una Exception (tipo específico)
  // ------------------------------------------------
  // throw Exception('mensaje')
  // - Exception es una clase de Dart
  // - Se puede capturar con 'on Exception'
  // - Más estructurado y estándar
  throw Exception('Dont have URL parameters');

  // OPCIÓN 2: Lanzar un String (cualquier objeto)
  // ---------------------------------------------
  // throw 'Petition error';
  // - Puedes lanzar cualquier objeto en Dart (String, int, etc.)
  // - Solo se captura con catch genérico (no con 'on Exception')
  // - Menos recomendado pero válido

  // OPCIÓN 3: Retorno exitoso
  // -------------------------
  // return 'Petition value';
  // - Si todo sale bien, retorna un valor
  // - El try se completa con éxito
}

// ORDEN DE EJECUCIÓN ESPERADO EN CONSOLA:
// ========================================
// Program start
// (espera 2 segundos)
// We have an Exception: Exception: Dont have URL parameters
// End of try catch
// Program finish
//
// Si cambias a throw 'Petition error':
// Program start
// (espera 2 segundos)
// We have an error: Petition error
// End of try catch
// Program finish
//
// Si cambias a return exitoso:
// Program start
// (espera 2 segundos)
// Success!!: Petition value
// End of try catch
// Program finish

// CONCEPTOS CLAVE APRENDIDOS:
// ---------------------------
// ✓ try - Bloque donde ocurre código que puede fallar
// ✓ on TipoExcepcion - Captura excepciones de tipo específico
// ✓ catch - Captura cualquier excepción (genérico)
// ✓ finally - Se ejecuta siempre al final
// ✓ throw Exception() - Lanza excepción estructurada
// ✓ throw String - Lanza cualquier objeto como error

// ORDEN DE LOS BLOQUES CATCH:
// ===========================
// CORRECTO:
// try { ... }
// on SpecificException catch(e) { ... }  ← Más específico primero
// on AnotherException catch(e) { ... }
// catch (e) { ... }                       ← Genérico al final
// finally { ... }
//
// INCORRECTO:
// try { ... }
// catch (e) { ... }                       ← Si pones esto primero,
// on Exception catch(e) { ... }           ← esto nunca se ejecutará

// CAPTURANDO STACK TRACE:
// =======================
// Puedes capturar el stack trace (rastreo de pila) para debugging:
//
// try {
//   // código
// } catch (err, stackTrace) {
//   print('Error: $err');
//   print('Stack trace: $stackTrace');
// }

// EJEMPLOS DE DIFERENTES TIPOS DE EXCEPCIONES:
// ============================================
// try {
//   throw FormatException('Invalid format');
// } on FormatException catch(e) {
//   print('Format error: $e');
// } on Exception catch(e) {
//   print('General exception: $e');
// } catch(e) {
//   print('Unknown error: $e');
// }

// RETHROW - Relanzar excepciones:
// ===============================
// A veces quieres capturar una excepción, hacer algo, y relanzarla:
//
// try {
//   await someOperation();
// } catch(e) {
//   print('Logging error: $e');
//   rethrow;  // Relanza la excepción para que la capture otro catch
// }

// FINALLY SIN CATCH:
// ==================
// finally puede usarse sin catch:
//
// try {
//   openFile();
//   processFile();
// } finally {
//   closeFile();  // Se ejecuta siempre, incluso si hay error
// }

// CASOS DE USO COMUNES:
// ====================
// RECURSOS:
// try {
//   final file = File('data.txt');
//   final contents = await file.readAsString();
// } catch(e) {
//   print('Cannot read file: $e');
// } finally {
//   // Cerrar archivo siempre
// }
//
// RED/API:
// try {
//   final response = await http.get(url);
//   return response.body;
// } on SocketException {
//   print('No internet connection');
// } on HttpException {
//   print('Server error');
// } catch(e) {
//   print('Unknown error: $e');
// } finally {
//   print('Request completed');
// }
