import 'package:flutter/material.dart';
import '../logica/invertir_logica.dart';

class InvertirPantalla extends StatefulWidget {
  const InvertirPantalla({super.key});

  @override
  State<InvertirPantalla> createState() => _InvertirPantallaState();
}

class _InvertirPantallaState extends State<InvertirPantalla> {
  final control = TextEditingController();
  var juego = JuegoInvertir();
  String resultado = 'Ingresa un número para invertir sus dígitos.';

  void procesar() {
    FocusScope.of(context).unfocus();
    try {
      final respuesta = juego.invertir(control.text);
      setState(() => resultado = respuesta);
      control.clear();
    } on FormatException catch (error) {
      setState(() => resultado = error.message);
    }
  }

  void reiniciar() {
    control.clear();
    setState(() {
      juego = JuegoInvertir();
      resultado = 'Ingresa un número para invertir sus dígitos.';
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
      title: const Text('Inversión de un número'),
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
            child: const Text('Invertir'),
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
