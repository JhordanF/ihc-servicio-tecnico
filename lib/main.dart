import 'package:flutter/material.dart';

import 'screens/perfil_antes.dart';
import 'screens/perfil_despues.dart';
import 'theme/app_spacing.dart';

void main() => runApp(const ServicioTecnicoApp());

class ServicioTecnicoApp extends StatelessWidget {
  const ServicioTecnicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servicio tecnico a domicilio - IHC 2026-2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F2A37)),
      ),
      home: const ComparacionScreen(),
    );
  }
}

/// Pantalla contenedora: permite alternar entre la version anterior y la
/// version mejorada de la misma pantalla, con los mismos datos.
///
/// Existe para que la mejora se pueda revisar sin leer el codigo: se toca el
/// selector y se ve la diferencia.
class ComparacionScreen extends StatefulWidget {
  const ComparacionScreen({super.key});

  @override
  State<ComparacionScreen> createState() => _ComparacionScreenState();
}

class _ComparacionScreenState extends State<ComparacionScreen> {
  bool _mostrarDespues = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Column(
          children: [
            _Selector(
              mostrarDespues: _mostrarDespues,
              onCambio: (v) => setState(() => _mostrarDespues = v),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  // Ancho de celular. La app se disena para telefono, asi que
                  // en pantallas grandes se mantiene la medida real.
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: _mostrarDespues
                      ? const PerfilDespues()
                      : const PerfilAntes(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Selector extends StatelessWidget {
  const _Selector({required this.mostrarDespues, required this.onCambio});

  final bool mostrarDespues;
  final ValueChanged<bool> onCambio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1F2A37),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s3,
        vertical: AppSpacing.s2,
      ),
      child: Column(
        children: [
          const Text(
            'IHC 2026-2 · Clase 5 · Jerarquia, layout y espaciado',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9AA5B4),
              fontSize: AppType.menor,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: AppSpacing.s2),
          Row(
            children: [
              _Boton(
                texto: 'ANTES',
                activo: !mostrarDespues,
                onTap: () => onCambio(false),
              ),
              const SizedBox(width: AppSpacing.s1),
              _Boton(
                texto: 'DESPUES',
                activo: mostrarDespues,
                onTap: () => onCambio(true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  const _Boton({
    required this.texto,
    required this.activo,
    required this.onTap,
  });

  final String texto;
  final bool activo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.s1),
        child: Container(
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: activo ? Colors.white : Colors.transparent,
            border: Border.all(
              color: activo ? Colors.white : const Color(0xFF49535F),
            ),
            borderRadius: BorderRadius.circular(AppSpacing.s1),
          ),
          child: Text(
            texto,
            style: TextStyle(
              color: activo ? const Color(0xFF1F2A37) : const Color(0xFF9AA5B4),
              fontWeight: FontWeight.w700,
              fontSize: AppType.menor,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
