# Publicar MINDS - Theory sin programar

## Parte 1 · GitHub Pages

1. Entra a GitHub e inicia sesión.
2. Pulsa **New repository**.
3. Nombre recomendado: `minds-theory`.
4. Elige **Private** si quieres conservar el código privado. Ojo: la disponibilidad de GitHub Pages para repositorios privados depende del plan de GitHub. Si tu plan no lo permite, usa **Public** o después podemos desplegar en otro servicio.
5. Crea el repositorio sin añadir README, `.gitignore` ni licencia, porque esta carpeta ya trae su README.
6. Dentro del repositorio pulsa **Add file → Upload files**.
7. Arrastra TODO el contenido de esta carpeta, incluyendo `supabase/` y `.nojekyll`. No subas la carpeta contenedora: `index.html` debe quedar en la raíz del repositorio.
8. Escribe un mensaje como `Publicar MINDS - Theory v0.7` y pulsa **Commit changes**.
9. Ve a **Settings → Pages**.
10. En **Build and deployment**, selecciona **Deploy from a branch**.
11. Branch: `main`. Folder: `/(root)`. Guarda.
12. Espera aproximadamente 1–3 minutos. GitHub mostrará la URL pública de Pages.
13. Abre la URL en ordenador y teléfono.

## Parte 2 · Supabase

No la hagas todavía hasta comprobar que GitHub Pages abre correctamente. Después crea el proyecto de Supabase y sigue `supabase/README.md`. En esa fase moveremos subrayados y notas desde `localStorage` a la base de datos, añadiremos login por email y conectaremos PENSAMIENTO a una función de IA del lado servidor.
