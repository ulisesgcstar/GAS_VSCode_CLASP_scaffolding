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
