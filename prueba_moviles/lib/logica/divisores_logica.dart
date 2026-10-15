class JuegoDivisores {
  int numIngresar;
  List<int> divisores;

  JuegoDivisores({
    this.numIngresar = 0,
    List<int>? divisores,
  }) : divisores = divisores ?? [];

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
    List<int> lista = [];

    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        lista.add(i);
      }
    }

    divisores = lista;
    final cantidad = divisores.length;

    return 'Número original: $numIngresar\nDivisores: ${divisores.join(", ")}\nCantidad de divisores: $cantidad';
  }
}

// ignore: camel_case_types
typedef juegoDivisores = JuegoDivisores;
