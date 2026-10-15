import 'package:flutter/material.dart';
import 'pantallas/menu_pantalla.dart';
import 'pantallas/invertir_pantalla.dart';
import 'pantallas/suma_digitos_pantalla.dart';
import 'pantallas/divisores_pantalla.dart';

void main() => runApp(const EjerciciosApp());

class EjerciciosApp extends StatelessWidget {
  const EjerciciosApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Ejercicios NRC 36873',
    theme: ThemeData(colorSchemeSeed: Colors.teal),
    initialRoute: '/',
    routes: {
      '/': (_) => const MenuPantalla(),
      '/invertir': (_) => const InvertirPantalla(),
      '/suma': (_) => const SumaPantalla(),
      '/divisores': (_) => const DivisoresPantalla(),
    },
  );
}
