/// Escala de espaciado basada en 8 px.
///
/// Es el equivalente en Dart de las variables CSS que pide la guia de Clase 5:
///
///   :root {
///     --space-1: 8px;   -->  AppSpacing.s1
///     --space-2: 16px;  -->  AppSpacing.s2
///     --space-3: 24px;  -->  AppSpacing.s3
///     --space-4: 32px;  -->  AppSpacing.s4
///   }
///
/// La regla no es memorizar numeros, sino mantener relaciones consistentes:
/// lo que se lee junto va cerca, lo que pertenece a otro momento de la tarea
/// va lejos.
class AppSpacing {
  const AppSpacing._();

  /// 8 px - separacion minima. Etiqueta y su dato, titulo y su bajada.
  static const double s1 = 8;

  /// 16 px - contenido relacionado dentro de un mismo grupo.
  static const double s2 = 16;

  /// 24 px - separacion entre grupos distintos.
  static const double s3 = 24;

  /// 32 px - separacion entre secciones o momentos de la tarea.
  static const double s4 = 32;
}

/// Jerarquia tipografica.
///
/// Tres niveles, uno por cada prioridad de la pantalla:
/// orientar (que tarea es), informar (que dato necesito) y actuar.
class AppType {
  const AppType._();

  /// Orientar: nombra la tarea o la informacion principal.
  static const double titulo = 26;

  /// Informar: el dato que permite decidir.
  static const double dato = 20;

  /// Contexto de apoyo.
  static const double cuerpo = 15;

  /// Informacion secundaria, que la persona puede ignorar sin perder la tarea.
  static const double menor = 13;
}
