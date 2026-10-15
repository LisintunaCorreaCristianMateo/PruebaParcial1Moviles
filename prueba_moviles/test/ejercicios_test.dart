import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_moviles/logica/suma_digitos_logica.dart';
import 'package:prueba_moviles/logica/divisores_logica.dart';

void main() {
  group('Pruebas de Ejercicio 9. Suma de dígitos', () {
    test('Calcula suma de dígitos y determina si es par', () {
      final juego = JuegoSumaDigitos();
      // 1 + 2 + 3 + 4 = 10 (Par)
      final resultado = juego.calcular('1234');
      expect(juego.suma, 10);
      expect(juego.esPar, isTrue);
      expect(resultado, contains('Suma de dígitos: 10'));
      expect(resultado, contains('Par'));
    });

    test('Calcula suma de dígitos y determina si es impar', () {
      final juego = JuegoSumaDigitos();
      // 1 + 2 = 3 (Impar)
      final resultado = juego.calcular('12');
      expect(juego.suma, 3);
      expect(juego.esPar, isFalse);
      expect(resultado, contains('Suma de dígitos: 3'));
      expect(resultado, contains('Impar'));
    });

    test('Lanza FormatException si el valor es <= 0 o inválido', () {
      final juego = JuegoSumaDigitos();
      expect(() => juego.calcular(''), throwsFormatException);
      expect(() => juego.calcular('0'), throwsFormatException);
      expect(() => juego.calcular('-10'), throwsFormatException);
      expect(() => juego.calcular('abc'), throwsFormatException);
    });
  });

  group('Pruebas de Ejercicio 7. Divisores de un número', () {
    test('Obtiene todos los divisores y cantidad correctamente', () {
      final juego = JuegoDivisores();
      // Divisores de 12: 1, 2, 3, 4, 6, 12 (6 divisores)
      final resultado = juego.calcular('12');
      expect(juego.divisores, [1, 2, 3, 4, 6, 12]);
      expect(juego.divisores.length, 6);
      expect(resultado, contains('1, 2, 3, 4, 6, 12'));
      expect(resultado, contains('Cantidad de divisores: 6'));
    });

    test('Obtiene divisores para número primo', () {
      final juego = JuegoDivisores();
      // Divisores de 7: 1, 7 (2 divisores)
      final resultado = juego.calcular('7');
      expect(juego.divisores, [1, 7]);
      expect(juego.divisores.length, 2);
      expect(resultado, contains('Cantidad de divisores: 2'));
    });

    test('Lanza FormatException si el valor es <= 0 o inválido', () {
      final juego = JuegoDivisores();
      expect(() => juego.calcular(''), throwsFormatException);
      expect(() => juego.calcular('0'), throwsFormatException);
      expect(() => juego.calcular('-5'), throwsFormatException);
      expect(() => juego.calcular('xyz'), throwsFormatException);
    });
  });
}
