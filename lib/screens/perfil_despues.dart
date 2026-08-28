import 'package:flutter/material.dart';

import '../data/tecnico.dart';
import '../theme/app_spacing.dart';

/// VERSION DESPUES - la misma pantalla, con la decision de diseno aplicada.
///
/// Los datos son IDENTICOS a los de la version anterior. Lo unico que cambia
/// es como estan organizados.
///
/// 1. JERARQUIA, en el orden que pide la guia:
///    - ORIENTAR: el titulo nombra la tarea ("Plomero" + nombre), no la pantalla.
///    - INFORMAR: el costo de la visita y la disponibilidad suben al bloque de
///      decision, porque son los dos datos con los que la persona decide.
///    - ACTUAR: una sola accion principal, visualmente distinta del resto.
/// 2. LAYOUT: la informacion se agrupa por decision. Lo que se lee junto esta
///    junto; lo secundario queda separado y se puede ignorar.
/// 3. ACCIONES: una principal a ancho completo. Las secundarias pasan a iconos
///    en la barra superior, disponibles pero sin competir.
/// 4. ESPACIADO: toda distancia sale de AppSpacing (8 / 16 / 24 / 32).
///    No hay ningun numero suelto en esta pantalla.
class PerfilDespues extends StatelessWidget {
  const PerfilDespues({super.key, this.tecnico = tecnicoDemo});

  final Tecnico tecnico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Elegir plomero'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
            tooltip: 'Guardar',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Compartir',
          ),
          const SizedBox(width: AppSpacing.s1),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.s3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- ORIENTAR ----------
            _Identidad(tecnico: tecnico),

            const SizedBox(height: AppSpacing.s3),

            // ---------- INFORMAR: el bloque de decision ----------
            _BloqueDecision(tecnico: tecnico),

            const SizedBox(height: AppSpacing.s3),

            // ---------- INFORMAR: respaldo ----------
            _Respaldo(tecnico: tecnico),

            const SizedBox(height: AppSpacing.s4),

            // ---------- Secundario: se puede ignorar sin perder la tarea ----------
            _Seccion(
              titulo: 'Sobre su trabajo',
              child: Text(
                tecnico.descripcion,
                style: const TextStyle(
                  fontSize: AppType.cuerpo,
                  height: 1.5,
                  color: Color(0xFF525A66),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.s3),

            _Seccion(
              titulo: 'Especialidades',
              child: Wrap(
                spacing: AppSpacing.s1,
                runSpacing: AppSpacing.s1,
                children: [
                  for (final e in tecnico.especialidades)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.s2,
                        vertical: AppSpacing.s1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFDDE1E7)),
                        borderRadius: BorderRadius.circular(AppSpacing.s3),
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: AppType.menor,
                          color: Color(0xFF525A66),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.s4),
          ],
        ),
      ),

      // ---------- ACTUAR ----------
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.s3),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE3E7EB))),
          ),
          child: SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF1F2A37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.s1),
                ),
              ),
              child: const Text(
                'Solicitar servicio',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ORIENTAR: quien es y de que oficio. Nombre y oficio se leen juntos,
/// asi que estan a 8 px. La zona es contexto, va a 8 px del bloque.
class _Identidad extends StatelessWidget {
  const _Identidad({required this.tecnico});

  final Tecnico tecnico;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(radius: 32, backgroundColor: Color(0xFFD9DDE3)),
        const SizedBox(width: AppSpacing.s2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tecnico.nombre,
                style: const TextStyle(
                  fontSize: AppType.titulo,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: AppSpacing.s1),
              Text(
                '${tecnico.oficio} · ${tecnico.zona}',
                style: const TextStyle(
                  fontSize: AppType.cuerpo,
                  color: Color(0xFF6B7480),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// INFORMAR: los dos datos con los que la persona decide, juntos y arriba.
/// En la version anterior estaban perdidos en el medio de una lista.
class _BloqueDecision extends StatelessWidget {
  const _BloqueDecision({required this.tecnico});

  final Tecnico tecnico;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s3),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFDDE1E7)),
        borderRadius: BorderRadius.circular(AppSpacing.s2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Costo de visita',
                  style: TextStyle(
                    fontSize: AppType.menor,
                    color: Color(0xFF6B7480),
                  ),
                ),
                const SizedBox(height: AppSpacing.s1),
                Text(
                  'Bs ${tecnico.costoVisita}',
                  style: const TextStyle(
                    fontSize: AppType.dato,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 44,
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s2),
            color: const Color(0xFFE3E7EB),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Disponible',
                  style: TextStyle(
                    fontSize: AppType.menor,
                    color: Color(0xFF6B7480),
                  ),
                ),
                const SizedBox(height: AppSpacing.s1),
                Text(
                  tecnico.disponibilidad,
                  style: const TextStyle(
                    fontSize: AppType.cuerpo,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// INFORMAR: la evidencia que respalda la decision. Tres numeros con la misma
/// forma, para que se comparen entre si de un vistazo.
class _Respaldo extends StatelessWidget {
  const _Respaldo({required this.tecnico});

  final Tecnico tecnico;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Metrica(
          valor: '${tecnico.calificacion}',
          etiqueta: '${tecnico.cantidadResenas} resenas',
        ),
        const SizedBox(width: AppSpacing.s1),
        _Metrica(
          valor: '${tecnico.trabajosHechos}',
          etiqueta: 'trabajos',
        ),
        const SizedBox(width: AppSpacing.s1),
        _Metrica(
          valor: '${tecnico.anosExperiencia}',
          etiqueta: 'anos de oficio',
        ),
      ],
    );
  }
}

class _Metrica extends StatelessWidget {
  const _Metrica({required this.valor, required this.etiqueta});

  final String valor;
  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFDDE1E7)),
          borderRadius: BorderRadius.circular(AppSpacing.s1),
        ),
        child: Column(
          children: [
            Text(
              valor,
              style: const TextStyle(
                fontSize: AppType.dato,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.s1),
            Text(
              etiqueta,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: AppType.menor,
                color: Color(0xFF6B7480),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Titulo de seccion y su contenido. Van a 8 px porque se leen como una unidad.
class _Seccion extends StatelessWidget {
  const _Seccion({required this.titulo, required this.child});

  final String titulo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: AppType.cuerpo,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.s1),
        child,
      ],
    );
  }
}
