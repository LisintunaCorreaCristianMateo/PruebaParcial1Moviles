class JuegoSumaDigitos {
  int numIngresar;
  int suma;
  bool esPar;

  JuegoSumaDigitos({
    this.numIngresar = 0,
    this.suma = 0,
    this.esPar = false,
  });

  String calcular(String texto) {
    if (texto.trim().isEmpty) {
      throw const FormatException('Por favor, ingresa un número.');
    }

    final n = int.tryParse(texto.trim());
    if (n == null) {
      throw const FormatException('Debe ingresar un número entero válido.');
    }

    if (n <= 0) {
      throw const FormatException('El número debe ser un entero positivo mayor a cero.');
    }

    numIngresar = n;
    int aux = n;
    int sumaDigitos = 0;

    while (aux > 0) {
      sumaDigitos += aux % 10;
      aux = aux ~/ 10;
    }

    suma = sumaDigitos;
    esPar = suma % 2 == 0;
    final tipo = esPar ? 'Par' : 'Impar';

    return 'Número original: $numIngresar\nSuma de dígitos: $suma\nEl resultado es: $tipo';
  }
}

// ignore: camel_case_types
typedef juegoSumaDigitos = JuegoSumaDigitos;
