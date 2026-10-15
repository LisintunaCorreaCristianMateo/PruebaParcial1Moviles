import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_moviles/logica/invertir_logica.dart';

void main() {
  group('Pruebas de Inversión de un número', () {
    test('Invierte número de varios dígitos correctamente', () {
      final juego = JuegoInvertir();
      final respuesta = juego.invertir('12345');
      expect(respuesta, contains('54321'));
      expect(juego.numInvertido, 54321);
      expect(juego.numIngresar, 12345);
    });

    test('Invierte número terminado en cero', () {
      final juego = JuegoInvertir();
      final respuesta = juego.invertir('120');
      expect(respuesta, contains('21'));
      expect(juego.numInvertido, 21);
    });

    test('Lanza FormatException si el texto es vacío o inválido', () {
      final juego = JuegoInvertir();
      expect(() => juego.invertir(''), throwsFormatException);
      expect(() => juego.invertir('abc'), throwsFormatException);
    });

    test('Lanza FormatException si el número es menor o igual a cero', () {
      final juego = JuegoInvertir();
      expect(() => juego.invertir('0'), throwsFormatException);
      expect(() => juego.invertir('-15'), throwsFormatException);
    });
  });
}
