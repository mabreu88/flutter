void main() {
  print('Program start');
  // ↑ Se ejecuta primero

  // LLAMADA ASINCRÓNICA
  // -------------------
  // httpGet(...) devuelve un Future<String>
  // then(...) se ejecuta cuando el Future se completa con éxito
  // catchError(...) se ejecuta si el Future completa con error
  httpGet('https://google.com')
      .then((value) {
        print(value); // Se ejecuta cuando el Future completa OK
      })
      .catchError((err) {
        print('Error: $err'); // Se ejecuta si el Future falla
      });

  print('Program finish');
  // ↑ Se ejecuta ANTES de que termine el Future
  // porque la llamada es asincrónica (no bloquea el hilo)
}

// FUNCIÓN QUE SIMULA UNA LLAMADA HTTP
// ===================================
// Retorna un Future<String>
// Future.delayed simula una operación que tarda 5 segundos
Future<String> httpGet(String url) {
  return Future.delayed(const Duration(seconds: 5), () {
    // Simulamos un error (descomenta la línea de error o la de éxito)
    throw 'http petition error';
    // return 'Petition http response';
  });
}

// ORDEN DE EJECUCIÓN ESPERADO EN CONSOLA:
// ---------------------------------------
// Program start
// Program finish
// Error: http petition error     (después de 5 segundos)
//
// Si cambias a return exitoso:
// Program start
// Program finish
// Petition http response         (después de 5 segundos)

// NOTAS CLAVE:
// ------------
// • Un Future representa un valor que estará disponible en el FUTURO
// • El código NO se bloquea; continúa ejecutándose
// • then() maneja el resultado exitoso
// • catchError() maneja excepciones del Future
// • Puedes encadenar múltiples then() para procesar pasos
