import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_moviles/main.dart';

void main() {
  testWidgets('App carga menú de ejercicios correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(const EjerciciosApp());
    expect(find.text('Menú de ejercicios'), findsOneWidget);
  });
}
