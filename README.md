# MINDS - Theory v0.9

v0.9 consolida la arquitectura del “tercer cerebro” antes de conectar Supabase y un modelo vivo.

## Arquitectura de producto

La navegación principal tiene solo dos espacios de contenido:

- **MINDS** — hilos de pensamiento vivos y longitudinales.
- **LECTURAS** — textos, subrayados, notas, conversaciones y relectura.

**Preguntar a MINDS** deja de ser una sección. Es una capacidad universal disponible desde el encabezado y desde cualquier selección de texto.

**MEMORIA** deja de ser una pestaña: es infraestructura transversal. **TOPOLOGÍA** permanece fuera de la navegación global; las conexiones se conservan como información contextual de cada hilo.

## MINDS

Un hilo no es una entrada de blog. Conserva una formulación actual, procedencia, marcas, conversaciones y una biografía de versiones. La portada muestra solo los hilos que están “cerca ahora”. Los demás permanecen en **Archivo vivo** y pueden volver a aparecer en el futuro.

La distinción activo/latente no borra ni mueve destructivamente el hilo. En esta versión se preserva además la posibilidad de **Mantener cerca** un hilo de forma manual.

## Conversaciones

Toda pregunta queda guardada con su contexto de origen:

- un hilo de MINDS;
- un pasaje de una lectura;
- una pregunta global.

El icono de historial permite buscar y reabrir conversaciones antiguas. Una conversación no se convierte automáticamente en teoría aceptada.

v0.9 migra localmente las conversaciones existentes de v0.8 cuando es posible.

## LECTURAS

Filtros disponibles:

- Todo
- Subrayados
- Con notas
- Conversaciones
- Por volver
- Relectura

**Relectura** muestra los pasajes que el usuario decidió conservar, sus notas y accesos al contexto original. La selección contextual ofrece `Subrayar · Nota · Preguntar`.

## Persistencia actual

Todo sigue almacenado en `localStorage`. Por tanto, todavía no hay sincronización entre ordenador y teléfono. Supabase será la siguiente fase.

Las respuestas de MINDS son todavía locales y provisionales: no hay un LLM conectado. La interfaz y el modelo de datos ya están preparados para sustituir esa capa por un motor seguro sin cambiar el recorrido de usuario.

## Publicación en GitHub Pages

Sube **todos** los archivos de esta carpeta al repositorio, sustituyendo la versión anterior. `index.html`, `v09.css` y `v09.js` deben quedar en la raíz junto a los demás archivos. GitHub Pages redeployará automáticamente después del commit.
