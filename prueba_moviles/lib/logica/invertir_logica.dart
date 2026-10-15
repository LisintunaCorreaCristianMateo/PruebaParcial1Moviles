class JuegoInvertir {
  int numIngresar;
  int numInvertido;

  JuegoInvertir({this.numIngresar = 0, this.numInvertido = 0});

  String invertir(String texto) {
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
    int inv = 0;

    while (aux > 0) {
      int digito = aux % 10;
      inv = (inv * 10) + digito;
      aux = aux ~/ 10;
    }

    numInvertido = inv;
    return 'Número original: $numIngresar\nNúmero invertido: $numInvertido';
  }
}

// ignore: camel_case_types
typedef juegoInvertir = JuegoInvertir;