# MINDS - Theory

Prototipo del “tercer cerebro” para construir teoría: una memoria intelectual activa que conserva lecturas, subrayados, anotaciones y evolución temporal, y que usa esa memoria como materia para producir pensamiento argumentado.

## Qué funciona en v0.7

- **PENSAMIENTO:** superficie editorial con desarrollos largos. No es un dashboard de frases.
- **LECTURAS:** textos recuperados, lectura a ancho cómodo, subrayado, notas por pasaje, navegación al fragmento y memoria local. En móvil aparece una barra inferior grande para subrayar, anotar, abrir notas y ajustar el tamaño de texto.
- **MEMORIA:** episodios autobiográficos extensos con tus propios párrafos y el contexto de las respuestas, más acceso al origen completo.
- **PREGUNTAR:** sigue siendo una demostración local hasta conectar Supabase + modelo.
- **TOPOLOGÍA:** mapa navegable con zoom semántico. Lejos muestra territorios; al acercar aparecen autores, conceptos, hipótesis, obras, afirmaciones y relaciones.
- **Responsive:** escritorio y móvil.

## Abrir localmente

Mantén todos los archivos en la misma carpeta y abre `index.html` en Edge, Chrome, Firefox o Safari. Para uso real entre ordenador y móvil conviene publicarlo en GitHub Pages y después conectar Supabase.

## Datos actuales

`corpus.js` contiene las lecturas y conversaciones recuperadas. `graph-data.js` es una copia JavaScript de `graph.json` para que la topología funcione también al abrir el sitio localmente sin depender de `fetch()`.

Las anotaciones siguen guardándose temporalmente en `localStorage`. Esto significa que antes de Supabase una nota hecha en el ordenador no aparecerá automáticamente en el teléfono.

## Supabase

La carpeta `supabase/` contiene el esquema preparado para persistencia real. No lo ejecutes hasta haber creado tu proyecto de Supabase; lo haremos después de publicar la web.
