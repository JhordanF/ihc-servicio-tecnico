import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ihc_servicio_tecnico/main.dart';
import 'package:ihc_servicio_tecnico/screens/perfil_antes.dart';
import 'package:ihc_servicio_tecnico/screens/perfil_despues.dart';
import 'package:ihc_servicio_tecnico/theme/app_spacing.dart';

void main() {
  testWidgets('la app abre en la version mejorada', (tester) async {
    await tester.pumpWidget(const ServicioTecnicoApp());

    expect(find.byType(PerfilDespues), findsOneWidget);
    expect(find.byType(PerfilAntes), findsNothing);
  });

  testWidgets('el selector alterna entre las dos versiones', (tester) async {
    await tester.pumpWidget(const ServicioTecnicoApp());

    await tester.tap(find.text('ANTES'));
    await tester.pumpAndSettle();
    expect(find.byType(PerfilAntes), findsOneWidget);

    await tester.tap(find.text('DESPUES'));
    await tester.pumpAndSettle();
    expect(find.byType(PerfilDespues), findsOneWidget);
  });

  testWidgets('la version mejorada orienta, informa y deja actuar',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PerfilDespues()));

    // ORIENTAR: el titulo nombra la tarea, no la pantalla.
    expect(find.text('Elegir plomero'), findsOneWidget);

    // INFORMAR: el dato con el que se decide esta presente y etiquetado.
    expect(find.text('Costo de visita'), findsOneWidget);
    expect(find.text('Bs 80'), findsOneWidget);
    expect(find.text('Disponible'), findsOneWidget);

    // ACTUAR: una sola accion principal.
    expect(find.widgetWithText(FilledButton, 'Solicitar servicio'),
        findsOneWidget);
  });

  testWidgets('las dos versiones muestran los mismos datos', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PerfilAntes()));
    expect(find.textContaining('Ramiro Justiniano'), findsOneWidget);
    expect(find.textContaining('80'), findsWidgets);

    await tester.pumpWidget(const MaterialApp(home: PerfilDespues()));
    expect(find.textContaining('Ramiro Justiniano'), findsOneWidget);
    expect(find.textContaining('80'), findsWidgets);
  });

  test('la escala de espaciado esta basada en 8 px', () {
    expect(AppSpacing.s1, 8);
    expect(AppSpacing.s2, 16);
    expect(AppSpacing.s3, 24);
    expect(AppSpacing.s4, 32);

    // Cada paso es un multiplo exacto de la base.
    for (final v in [AppSpacing.s1, AppSpacing.s2, AppSpacing.s3, AppSpacing.s4]) {
      expect(v % AppSpacing.s1, 0);
    }
  });
}
