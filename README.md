# App de servicio técnico a domicilio · IHC 2026-2

Aplicación móvil para contratar técnicos a domicilio por categoría: plomería,
electricidad, electrónica, carpintería.

## Entregables

| Qué | Dónde |
|---|---|
| **Persona + Flujo 1 + Flujo 2** | [`persona-v01.md`](persona-v01.md) |
| **Segundo flujo · Clase 5** (jerarquía, layout, espaciado) | [`persona-v01.md`](persona-v01.md) §4 y la decisión completa más abajo |
| **Wireframes** (12 pantallas) | [`wireframes/wireframes-12-pantallas.html`](wireframes/wireframes-12-pantallas.html) |
| **Escala de espaciado de 8 px** | [`lib/theme/app_spacing.dart`](lib/theme/app_spacing.dart) |
| **Pantalla ANTES** | [`lib/screens/perfil_antes.dart`](lib/screens/perfil_antes.dart) |
| **Pantalla DESPUÉS** | [`lib/screens/perfil_despues.dart`](lib/screens/perfil_despues.dart) |

> La app abre con un selector **ANTES / DESPUÉS**. Las dos versiones muestran los
> mismos datos: lo único que cambia es la jerarquía, el layout y el espaciado.

electricidad, electrónica, carpintería.

---

## Cómo revisar este avance

La app abre en una pantalla con un selector **ANTES / DESPUÉS**. Las dos
versiones muestran **exactamente los mismos datos**: lo único que cambia entre
ellas es la jerarquía, el layout y el espaciado.

```bash
flutter pub get
flutter run -d chrome
```

También corre en Android con `flutter run` teniendo un dispositivo conectado.

| Archivo | Qué contiene |
|---|---|
| `lib/theme/app_spacing.dart` | **La escala de espaciado de 8 px.** Es el entregable central de esta clase. |
| `lib/screens/perfil_antes.dart` | La pantalla como estaba, con los problemas documentados en comentarios. |
| `lib/screens/perfil_despues.dart` | La misma pantalla con la decisión de diseño aplicada. |
| `lib/data/tecnico.dart` | Datos de prueba, compartidos por las dos versiones. |
| `lib/main.dart` | Selector para alternar entre ambas. |

---

## La escala de espaciado

La guía de clase muestra la escala como variables CSS. Como este MVP está en
Flutter, la misma idea vive en una clase de Dart:

```dart
class AppSpacing {
  static const double s1 = 8;   //  --space-1
  static const double s2 = 16;  //  --space-2
  static const double s3 = 24;  //  --space-3
  static const double s4 = 32;  //  --space-4
}
```

**En `perfil_despues.dart` no hay ni un solo número suelto**: toda distancia
sale de `AppSpacing`. En `perfil_antes.dart` quedaron a propósito las medidas
originales, elegidas una por una (5, 11, 7, 13, 21, 3), para que se vea la
diferencia.

El criterio no es el número, es la relación:

| Distancia | Cuándo | Ejemplo en la pantalla |
|---|---|---|
| 8 px | Elementos que se leen como una sola unidad | Etiqueta «Costo de visita» y el monto |
| 16 px | Contenido relacionado dentro de un grupo | Foto y bloque de nombre + oficio |
| 24 px | Entre grupos distintos | Bloque de decisión y bloque de respaldo |
| 32 px | Entre momentos distintos de la tarea | Información para decidir y contenido secundario |

---

## La decisión de diseño

**Pantalla elegida:** perfil del técnico.

**Momento de la tarea:** la persona está **decidiendo** si contrata a este
técnico para una fuga de agua en su casa.

### Antes

Tres problemas concretos en la versión original:

1. **La pantalla no nombraba la tarea.** El título decía «Detalle». No orientaba
   sobre qué está haciendo la persona.
2. **El dato para decidir estaba enterrado.** El costo de la visita aparecía en
   el sexto renglón de una lista plana de ocho datos, con el mismo tamaño y peso
   que la zona, los años de experiencia y las especialidades.
3. **Tres acciones competían entre sí.** «Compartir», «Guardar» y «Solicitar»
   tenían el mismo estilo y el mismo ancho. No había un paso siguiente
   reconocible.

A eso se sumaba que ninguna distancia respondía a un sistema: cada espacio se
había elegido a ojo.

### Cambio

Se reordenó la pantalla según las tres prioridades de la clase —
**orientar, informar, actuar**:

| Prioridad | Qué se hizo |
|---|---|
| **Orientar** | El título pasó a nombrar la tarea («Elegir plomero») y el nombre del técnico subió a 26 px como primer elemento de la pantalla. |
| **Informar** | El **costo de la visita** y la **disponibilidad** se sacaron de la lista y se agruparon en un bloque propio, arriba de todo lo demás. Son los dos datos con los que se decide. Debajo, tres métricas de respaldo (calificación, trabajos, años) con forma idéntica para que se comparen de un vistazo. |
| **Actuar** | Una sola acción principal, fija en la base y a ancho completo. «Guardar» y «Compartir» pasaron a íconos en la barra superior: siguen disponibles, pero ya no compiten. |
| **Espaciado** | Toda distancia sale de la escala de 8 px. La información secundaria quedó separada por 32 px del bloque de decisión. |

Lo secundario —la descripción del trabajo y las especialidades— sigue estando,
pero abajo y con menos peso. Se puede ignorar sin perder la tarea.

### Después

> **PENDIENTE — completar después de la prueba con otra persona.**
>
> Registrar acá lo que se **observó**, no lo que se supone. Formato:
>
> - **Persona:** quién probó y en qué contexto.
> - **Consigna:** la tarea que se le pidió, sin explicarle la interfaz.
> - **Qué hizo:** el recorrido real. Ejemplo: «buscó el precio abajo de todo
>   antes de encontrarlo arriba».
> - **Dónde dudó:** el punto exacto donde se detuvo.
> - **Tiempo:** cuánto tardó en encontrar la acción principal.

### Siguiente

- Aplicar la escala de 8 px al resto de las pantallas del flujo.
- Diseñar los flujos alternativos: solicitud rechazada, sin técnicos
  disponibles en la zona.
- Resolver estados vacíos y de error, que hoy no existen.
- Validar si el bloque de decisión funciona igual cuando el técnico no tiene
  disponibilidad inmediata.

---

## Estado del avance

| Entregable de la clase | Estado |
|---|---|
| Wireframe actualizado en Figma | Hecho |
| Escala de 8 px en al menos una pantalla | Hecho — `app_spacing.dart` |
| Misma mejora implementada en el código | Hecho — `perfil_despues.dart` |
| Prueba con otra persona | **Pendiente** |
| Decisión escrita (antes / cambio / después / siguiente) | Parcial — falta «Después» |
| Subido al repositorio | Hecho |

---

## Entorno

Flutter 3.24.5 · Dart 3.5.4 · Material 3.
Plataformas configuradas: Web y Android.
