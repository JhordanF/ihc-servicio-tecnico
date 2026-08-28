import 'package:flutter/material.dart';

import '../data/tecnico.dart';

/// VERSION ANTES - la pantalla tal como estaba en el MVP.
///
/// Problemas deliberados que esta version conserva, para poder compararlos:
///
/// 1. JERARQUIA: el titulo dice "Detalle" y no nombra la tarea. El dato que
///    la persona necesita para decidir (el costo de la visita) esta perdido
///    en el medio de una lista de datos secundarios.
/// 2. LAYOUT: todo es una lista plana. Nada esta agrupado, asi que no se ve
///    que la disponibilidad y el precio pertenecen a la misma decision.
/// 3. ACCIONES: tres botones con el mismo peso visual. La persona no sabe
///    cual es el paso siguiente.
/// 4. ESPACIADO: distancias arbitrarias (5, 11, 7, 13, 21, 3) elegidas una
///    por una, sin escala. No hay ritmo.
class PerfilAntes extends StatelessWidget {
  const PerfilAntes({super.key, this.tecnico = tecnicoDemo});

  final Tecnico tecnico;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detalle'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        // Padding elegido a ojo, distinto en cada lado.
        padding: const EdgeInsets.fromLTRB(14, 11, 18, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 22, backgroundColor: Color(0xFFD9D9D9)),
                const SizedBox(width: 7),
                Text(
                  tecnico.nombre,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(tecnico.oficio, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 11),
            Text(tecnico.descripcion, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 13),
            Text('Zona: ${tecnico.zona}', style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            Text('Experiencia: ${tecnico.anosExperiencia} anos',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            Text('Trabajos realizados: ${tecnico.trabajosHechos}',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            Text('Calificacion: ${tecnico.calificacion} (${tecnico.cantidadResenas})',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            // El dato mas importante para decidir, con el mismo peso que todo
            // lo demas y en el medio de la lista.
            Text('Costo de visita: Bs ${tecnico.costoVisita}',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            Text('Disponible: ${tecnico.disponibilidad}',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            Text('Especialidades: ${tecnico.especialidades.join(", ")}',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 21),
            // Tres acciones con exactamente el mismo peso visual.
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: () {}, child: const Text('Compartir')),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: OutlinedButton(onPressed: () {}, child: const Text('Guardar')),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: OutlinedButton(onPressed: () {}, child: const Text('Solicitar')),
                ),
              ],
            ),
            const SizedBox(height: 11),
          ],
        ),
      ),
    );
  }
}
