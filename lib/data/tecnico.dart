/// Datos de prueba del MVP.
///
/// Un unico tecnico, con la informacion que la persona necesita para decidir
/// si lo contrata. Las dos versiones de la pantalla (antes y despues) usan
/// EXACTAMENTE estos mismos datos: lo unico que cambia entre ellas es la
/// jerarquia, el layout y el espaciado.
class Tecnico {
  const Tecnico({
    required this.nombre,
    required this.oficio,
    required this.zona,
    required this.calificacion,
    required this.cantidadResenas,
    required this.trabajosHechos,
    required this.anosExperiencia,
    required this.costoVisita,
    required this.disponibilidad,
    required this.descripcion,
    required this.especialidades,
  });

  final String nombre;
  final String oficio;
  final String zona;
  final double calificacion;
  final int cantidadResenas;
  final int trabajosHechos;
  final int anosExperiencia;
  final int costoVisita;
  final String disponibilidad;
  final String descripcion;
  final List<String> especialidades;
}

const tecnicoDemo = Tecnico(
  nombre: 'Ramiro Justiniano',
  oficio: 'Plomero',
  zona: 'Zona Norte, 3er anillo',
  calificacion: 4.8,
  cantidadResenas: 34,
  trabajosHechos: 52,
  anosExperiencia: 9,
  costoVisita: 80,
  disponibilidad: 'Hoy, desde las 15:00',
  descripcion:
      'Trabajo instalaciones y reparaciones de agua en domicilios. '
      'Llevo mis propias herramientas y doy garantia de 30 dias sobre la '
      'reparacion.',
  especialidades: [
    'Fugas de agua',
    'Destape de canerias',
    'Cambio de griferia',
    'Instalacion de tanques',
  ],
);
