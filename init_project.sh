#!/bin/bash

# =========================================================
#  GENERADOR DE PROYECTOS "GAS_VSCode_Clasp" v2.0
#  Autor: UGC
# =========================================================

echo "=========================================="
echo "🚀 INICIANDO GENERADOR DE PROYECTOS GAS"
echo "=========================================="

# 1. PEDIR NOMBRE DEL PROYECTO
# ---------------------------------------------------------
read -p "Ingresa el nombre del nuevo proyecto (sin espacios): " PROJECT_NAME

if [ -d "../$PROJECT_NAME" ]; then
    echo "❌ Error: La carpeta ../$PROJECT_NAME ya existe."
    exit 1
fi

# 2. CLONAR LA PLANTILLA BASE
# ---------------------------------------------------------
echo "📂 Clonando plantilla..."
mkdir "../$PROJECT_NAME"
# Copia todo excepto la carpeta .git, el propio script y node_modules
rsync -av --progress . "../$PROJECT_NAME" --exclude .git --exclude init_project.sh --exclude node_modules

# 3. ENTRAR A LA NUEVA CARPETA
# ---------------------------------------------------------
cd "../$PROJECT_NAME" || exit

# 4. INYECCIÓN DE ARQUITECTURA "GASPAR" (MVC)
# ---------------------------------------------------------
echo "🏗️  Construyendo arquitectura de software..."

# A. Crear directorios
mkdir -p src/config
mkdir -p src/models
mkdir -p src/controllers
mkdir -p src/utils

# B. Crear servicio de CONFIGURACIÓN (Lectura de Hoja Soft Config)
echo "⚙️  Escribiendo servicio de configuración (Lectura de ADMIN_CONFIG)..."
cat <<EOF > src/config/ConfigService.js
/**
 * ConfigService.js
 * Servicio para leer la configuración global desde la hoja 'ADMIN_CONFIG'.
 * NO TOCAR CÓDIGO PARA CAMBIAR CONFIGURACIÓN.
 */

const ConfigService = (function () {
  const SHEET_NAME = 'ADMIN_CONFIG';
  let _cache = null;

  function _loadConfig() {
    const ss = SpreadsheetApp.getActiveSpreadsheet();
    const sheet = ss.getSheetByName(SHEET_NAME);
    
    if (!sheet) {
      // Si no existe la hoja, devolvemos objeto vacío o lanzamos error
      console.error("No se encontró la hoja '" + SHEET_NAME + "'");
      return {};
    }

    // Lee desde A2 hasta la última fila (Columna A=Llave, B=Valor)
    const lastRow = sheet.getLastRow();
    if (lastRow < 2) return {}; // Hoja vacía
    
    const data = sheet.getRange(2, 1, lastRow - 1, 2).getValues();
    const configMap = {};

    data.forEach(row => {
      if (row[0]) configMap[row[0]] = row[1];
    });

    return configMap;
  }

  return {
    get: function () {
      if (!_cache) _cache = _loadConfig();
      return _cache;
    }
  };
})();
EOF

# C. Crear otros archivos base
echo "/** Modelo para gestionar PDVs */" > src/models/PdvModel.js
echo "/** Modelo para gestionar Componentes */" > src/models/ComponentModel.js
echo "/** Modelo para gestionar Usuarios/Roles */" > src/models/UserModel.js
echo "/** Controlador de Sincronización */" > src/controllers/SyncController.js
echo "/** Controlador de Formularios */" > src/controllers/FormController.js
echo "/** Utilidad de Correo */" > src/utils/Mailer.js

# D. Configurar Inteligencia VS Code
echo "🧠 Configurando Autocompletado (IntelliSense)..."
cat <<EOF > jsconfig.json
{
  "compilerOptions": {
    "target": "ES2019", "lib": ["ESNext"], "moduleResolution": "node",
    "strict": false, "allowJs": true, "checkJs": true, "noEmit": true
  },
  "include": ["src/**/*"], "exclude": ["node_modules"]
}
EOF

cat <<EOF > .eslintrc.json
{
  "env": { "googleappsscript/googleappsscript": true, "es2020": true },
  "extends": ["eslint:recommended", "prettier"],
  "parserOptions": { "sourceType": "module" },
  "plugins": ["googleappsscript"],
  "rules": { "no-var": "error", "prefer-const": "warn" }
}
EOF

echo "✅ Arquitectura desplegada."

# 5. INICIALIZAR GIT Y DEPENDENCIAS
# ---------------------------------------------------------
echo "🔧 Inicializando Git y NPM..."
git init > /dev/null
npm install > /dev/null 2>&1

# 6. CONEXIÓN CON GOOGLE (CLASP)
# ---------------------------------------------------------
echo "------------------------------------------"
echo "🔗 CONEXIÓN CON GOOGLE APPS SCRIPT"
echo "1) Crear un Script NUEVO"
echo "2) Clonar un Script EXISTENTE (Por ID)"
read -p "Elige una opción (1 o 2): " OPTION

if [ "$OPTION" == "1" ]; then
    clasp create --type sheets --title "$PROJECT_NAME" --rootDir ./src
elif [ "$OPTION" == "2" ]; then
    read -p "Pega el Script ID aquí: " SCRIPT_ID
    clasp clone "$SCRIPT_ID" --rootDir ./src
fi

# 7. FINALIZAR
# ---------------------------------------------------------
echo "🎉 ¡LISTO! Abriendo VS Code..."
code .