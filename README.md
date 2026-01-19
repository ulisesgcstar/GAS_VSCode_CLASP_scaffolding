# 🏭 Scaffolding (GAS Boilerplate)

> **Versión:** 2.0 | **Arquitectura:** MVC / Cloud-Native
> **Autor:** Arquitectura Técnica / Ulises GC

Permite desplegar un entorno de desarrollo para **Google Apps Script**, automatizando la configuración de herramientas, calidad de código y arquitectura de software.

---

## 🚀 ¿Qué hace esta herramienta?

Al ejecutar el script maestro, esta plantilla genera automáticamente:

1.  **Estructura de Carpetas:** Organizada bajo el patrón **MVC** (Modelos, Vistas, Controladores).
2.  **Configuración de VS Code:** Habilita **IntelliSense** (Autocompletado de Google) y **ESLint** (Calidad de código).
3.  **Servicios Pre-programados:** Incluye `ConfigService.js` listo para leer la hoja `ADMIN_CONFIG`.
4.  **Conexión a Nube:** Vincula el proyecto local con Google Drive usando **CLASP**.

---

## 🛠️ Requisitos Previos

Antes de usar la fábrica, asegúrate de tener instalado en tu entorno (WSL/Ubuntu/Mac):

1.  **Node.js** (v16 o superior):
    ```bash
    node -v
    ```
2.  **Herramientas Globales:**
    ```bash
    npm install -g @google/clasp typescript
    ```
3.  **Sesión de Google Activa:**
    ```bash
    clasp login
    ```

---

## ⚡ Guía de Inicio Rápido

### 1. Clonar la Fábrica (Solo la primera vez)
Descarga esta plantilla en tu carpeta de herramientas:
```bash
git clone [https://github.com/TU_USUARIO/gaspar-enterprise-boilerplate.git](https://github.com/TU_USUARIO/gaspar-enterprise-boilerplate.git)
cd gaspar-enterprise-boilerplate

2. Generar un Nuevo ProyectoEjecuta el script automatizador:Bash./init_project.sh
3. Sigue el AsistenteEl script te pedirá:Nombre del Proyecto: (Ej. Gaspar-Monterrey).Tipo de Despliegue:1: Crear Hoja y Script Nuevos en Drive.2: Clonar un proyecto existente (necesitas el Script ID).3: Modo Offline (Solo crea archivos locales).¡Listo! VS Code se abrirá automáticamente con tu entorno configurado.🏗️ Arquitectura GeneradaCada proyecto nuevo nace con esta estructura profesional:Plaintext/src
  ├── config/
  │   └── ConfigService.js    # Conexión automática a hoja ADMIN_CONFIG
  ├── controllers/            # Lógica de negocio (Forms -> Sheets)
  ├── models/                 # Acceso a datos (Lectura de Catálogos)
  ├── utils/                  # Helpers (Mailer, Fechas)
  ├── index.js                # Orquestador (Triggers onOpen/onFormSubmit)
  └── appsscript.json         # Manifiesto de Google
🧠 Características "Smart"Autocompletado (IntelliSense)Gracias al archivo jsconfig.json incluido, VS Code te sugerirá métodos de Google automáticamente:Escribe SpreadsheetApp. y verás la magia.Calidad de Código (Linter)El archivo .eslintrc.json vigilará que no cometas errores básicos (como usar variables no definidas o sintaxis obsoleta).Configuración "Soft"El servicio ConfigService ya viene programado para buscar una hoja llamada ADMIN_CONFIG y leer sus claves/valores.Uso inmediato: const config = ConfigService.get();📦 Comandos DisponiblesUna vez dentro de tu nuevo proyecto, puedes usar estos comandos en la terminal:ComandoAcciónnpm run pushSube tu código a Google Drive (clasp push).npm run pullDescarga cambios desde Google Drive (clasp pull).npm run watchSube cambios automáticamente cada vez que guardas (clasp push --watch).📄 LicenciaPropiedad interna de Gestión de Equipos Gaspar.Desarrollado para estandarización de procesos técnicos.
