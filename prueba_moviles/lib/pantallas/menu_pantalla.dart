import 'package:flutter/material.dart';

class MenuPantalla extends StatelessWidget {
  const MenuPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    const opciones = {
      '/invertir': 'Inversión de un número',
      '/suma': 'Suma de dígitos de un número',
      '/divisores': 'Divisores de un número',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Menú de ejercicios')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
    
          const Text('Selecciona un ejercicio.'),
          const SizedBox(height: 20),
          for (final opcion in opciones.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, opcion.key),
                child: Text(opcion.value),
              ),
            ),
        ],
      ),
    );
  }
}
