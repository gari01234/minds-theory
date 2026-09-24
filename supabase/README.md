# Supabase para MINDS - Theory

Esta carpeta deja preparado el modelo de datos para la siguiente fase. No hace falta tocarla para publicar primero la web en GitHub Pages.

Cuando el sitio ya esté en línea:

1. Crear un proyecto nuevo en Supabase.
2. Abrir **SQL Editor** y ejecutar `schema.sql` completo.
3. Activar autenticación por email (Magic Link / OTP).
4. Copiar la URL del proyecto y la **publishable key** del panel de Supabase. La publishable key puede usarse en el navegador porque las tablas están protegidas con Row Level Security; una secret/service-role key nunca debe ponerse en el frontend.
5. En la siguiente versión conectaremos las anotaciones locales con la tabla `annotations`, el corpus con `documents`, la memoria temporal con `memory_events` y las piezas de PENSAMIENTO con `mind_dispatches`.
6. El motor de PENSAMIENTO debe vivir en una Edge Function para que la clave del proveedor de IA permanezca en secretos del servidor y no en GitHub ni en el navegador.

El esquema conserva por separado documento, anotación, evento autobiográfico y pieza generada de pensamiento. Una anotación aumenta relevancia autobiográfica; no modifica ni sobrescribe la evidencia documental.
