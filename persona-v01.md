# Persona y flujos · v01

**Materia:** Interacción Humano-Computador · IHC 2026-2
**Proyecto:** App de servicio técnico a domicilio
**Estudiante:** Jhordan F.

Aplicación móvil para contratar técnicos a domicilio por categoría:
plomería, electricidad, electrónica, carpintería.

---

## 1. Persona

### María Elena Áñez

| | |
|---|---|
| **Edad** | 38 años |
| **Ocupación** | Contadora en una empresa privada |
| **Vive en** | Santa Cruz de la Sierra, casa propia con su esposo y dos hijos |
| **Tecnología** | Usa el celular todo el día. WhatsApp, banca móvil y redes. No es técnica, pero no le tiene miedo a una app nueva |

### Qué necesita

Cuando se le rompe algo en la casa —una fuga de agua, un enchufe que no
funciona, una puerta que no cierra— necesita **encontrar a alguien de confianza
rápido**, sin depender de que un conocido le pase un contacto.

### Qué la frena hoy

- **No sabe a quién llamar.** Pide referencias por WhatsApp a familiares y espera.
- **No sabe cuánto va a costar** hasta que el técnico ya está en su casa.
- **No sabe si el técnico es confiable.** No hay antecedentes verificables.
- **No puede coordinar el horario.** Trabaja de 8 a 18; necesita saber si el
  técnico puede venir cuando ella está.

### Frase que la resume

> «No quiero al más barato. Quiero a alguien que sepa lo que hace, que me diga
> cuánto cuesta antes de venir, y que llegue cuando dijo que iba a llegar.»

### Criterio de éxito

María resuelve el problema de su casa **sin haber pedido una sola
recomendación por WhatsApp**, y sabiendo el costo antes de que el técnico
toque el timbre.

---

## 2. Flujo 1 — Contratar un servicio (cliente)

Es el flujo principal del sistema. Cubre desde que María detecta el problema
hasta que califica el trabajo.

```
Ingreso  →  Inicio  →  Resultados  →  Perfil del técnico
   01          03           04                05
                                               ↓
        Calificación  ←  Seguimiento  ←  Confirmación  ←  Solicitud
             10               08              07             06
```

| Paso | Pantalla | Qué decide o hace María |
|---|---|---|
| 1 | Ingreso | Entra a su cuenta |
| 2 | Inicio | Elige la categoría del problema: plomería |
| 3 | Resultados | Compara técnicos disponibles en su zona |
| 4 | Perfil del técnico | **Decide si contrata a este técnico** |
| 5 | Solicitud | Describe la fuga, sube fotos, elige fecha y dirección |
| 6 | Confirmación y pago | Ve el costo desglosado y confirma |
| 7 | Seguimiento | Ve el estado del servicio y dónde está el técnico |
| 8 | Calificación | Cierra el ciclo calificando el trabajo |

**El punto crítico del flujo es el paso 4.** Es donde María decide, y es la
pantalla sobre la que se trabajó en la tarea de Clase 5.

---

## 3. Flujo 2 — Atender una solicitud (técnico)

La otra cara del sistema. Sin este flujo no hay oferta que contratar.

```
Registro  →  Panel del técnico  →  Chat  →  (servicio ejecutado)
   02              11               09
```

| Paso | Pantalla | Qué hace el técnico |
|---|---|---|
| 1 | Registro | Se da de alta eligiendo el rol «técnico» |
| 2 | Panel del técnico | Activa su disponibilidad y ve las solicitudes entrantes |
| 3 | Panel del técnico | **Acepta o rechaza** cada solicitud |
| 4 | Chat | Coordina detalles con el cliente antes de ir |

**Por qué importa:** la calificación que María deja en el paso 8 del Flujo 1
alimenta el listado del paso 3 y el perfil del paso 4. Es un circuito cerrado:
la confianza que deja un cliente es con lo que decide el siguiente.

---

## 4. Segundo flujo · Tarea de Clase 5

**Jerarquía, layout y espaciado aplicados al punto de decisión.**

La pantalla intervenida es el **perfil del técnico** (paso 4 del Flujo 1),
porque es el momento exacto en que María decide si contrata.

La decisión completa —antes, cambio, resultado y siguiente paso— está
documentada en el [README del repositorio](README.md).

Resumen:

| | |
|---|---|
| **Antes** | El título no nombraba la tarea, el costo de la visita estaba enterrado en una lista plana de ocho datos, y tres acciones competían con el mismo peso visual |
| **Cambio** | Se reordenó según orientar / informar / actuar. El costo y la disponibilidad subieron a un bloque propio. Una sola acción principal. Escala de espaciado de 8 px |
| **Implementación** | `lib/screens/perfil_antes.dart` y `lib/screens/perfil_despues.dart`, con la escala en `lib/theme/app_spacing.dart` |
| **Cómo verlo** | La app abre con un selector ANTES / DESPUÉS. Mismos datos, distinta organización |

---

## 5. Wireframes

Los 12 wireframes de fidelidad media están en
[`wireframes/wireframes-12-pantallas.html`](wireframes/wireframes-12-pantallas.html).

Se abren en el navegador. En escala de grises y sin texto real, porque en esa
etapa lo que se evalúa es la estructura y el flujo, no el aspecto visual.

| Fase | Pantallas |
|---|---|
| Acceso y búsqueda | 01 Ingreso · 02 Registro · 03 Inicio · 04 Resultados |
| Contratación | 05 Perfil del técnico · 06 Solicitud · 07 Confirmación y pago · 08 Seguimiento |
| Cierre y lado del técnico | 09 Chat · 10 Calificación · 11 Panel del técnico · 12 Mi cuenta |

---

## 6. Estado

| Entregable | Estado |
|---|---|
| Persona definida | Hecho |
| Flujo 1 (cliente) | Hecho |
| Flujo 2 (técnico) | Hecho |
| Wireframes de los dos flujos | Hecho — 12 pantallas |
| Segundo flujo · jerarquía, layout y espaciado | Hecho — en Figma y en código |
| MVP funcionando con datos de prueba | Hecho — Flutter, corre en web y Android |
| Prueba con otra persona | Pendiente |
