import 'package:flutter/material.dart';
import '../logica/suma_digitos_logica.dart';

class SumaPantalla extends StatefulWidget {
  const SumaPantalla({super.key});

  @override
  State<SumaPantalla> createState() => _SumaPantallaState();
}

class _SumaPantallaState extends State<SumaPantalla> {
  final control = TextEditingController();
  var juego = JuegoSumaDigitos();
  String resultado = 'Ingresa un número para calcular la suma de sus dígitos.';

  void procesar() {
    FocusScope.of(context).unfocus();
    try {
      final respuesta = juego.calcular(control.text);
      setState(() => resultado = respuesta);
      control.clear();
    } on FormatException catch (error) {
      setState(() => resultado = error.message);
    }
  }

  void reiniciar() {
    control.clear();
    setState(() {
      juego = JuegoSumaDigitos();
      resultado = 'Ingresa un número para calcular la suma de sus dígitos.';
    });
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Ejercicio 9. Suma de dígitos'),
      automaticallyImplyLeading: false,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Ingresa un número entero positivo:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: control,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => procesar(),
            decoration: const InputDecoration(
              labelText: 'Tu número',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: procesar,
            child: const Text('Calcular suma'),
          ),
          TextButton(
            onPressed: reiniciar,
            child: const Text('Reiniciar'),
          ),
          const SizedBox(height: 10),
          Text(resultado, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Volver al menú'),
          ),
        ],
      ),
    ),
  );
}
