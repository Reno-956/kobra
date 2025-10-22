<img width="150" src="assets/kobra-k.png" alt="Kobra Logo">

## Origen del proyecto

Este proyecto está basado en [**duekasir**](https://github.com/hifiaz/duekasir), un sistema de punto de venta (POS) desarrollado originalmente por **@hifiaz**.

A partir de esa base se realizaron adaptaciones y personalizaciones para ajustarlo a las necesidades específicas del presente proyecto, incluyendo:

- ✅ Mejoras en la **gestión de usuarios** (ej: resetear contraseñas, perfiles).
- ✅ Ajustes para **soporte multiplataforma** (Windows y Android).
- ✅ Personalización de **reportes**.

> ℹ️ El proyecto mantiene varias de las características originales de *duekasir*, pero añade nuevas funciones y mejoras orientadas al uso en entornos de facturación electrónica.

## Empezar 

Para poner en funcionamiento una copia local siga estos pasos. 

Prerequisitos: https://flutter.dev/docs/get-started/install 

1. Para empezar, crea un fork de este repositorio en tu cuenta de GitHub. 

3. Clonar el repositorio.
   ```sh
     git clone https://github.com/Reno-956/kobra.git
    ```
3. Instalar paquetes.
    ```sh
     flutter pub get
    ```
4. Ejecutar proyecto.
    ```sh
     flutter run
    ```
   
## Características 

1. Productos 
   - [x] Buscar 
   - [x] Listar 
   - [x] CRUD 
   - [x] Exportar e importar inventario CSV 
   - [x] Escanear código de barras con dispositivo externo para agregar artículos 
   - [x] Escanear código de barras con teléfono móvil para agregar artículos 
2. Venta 
   - [x] Imprimir en impresora térmica (Windows) 
   - [x] Imprimir para abrir la caja registradora (Windows) 
   - [x] Escanear código de barras con dispositivo externo 
   - [x] Escanear código de barras con teléfono móvil 
3. Clientes 
   - [x] Listar 
   - [x] CRUD 
   - [x] Buscar 
4. Usuarios 
   - [x] Listar 
   - [x] CRUD 
   - [x] Buscar 
5. Reporte 
   - [x] Filtrar por fecha 
   - [x] Ventas totales hoy 
   - [x] Ganancias 
   - [x] Clientes totales 
   - [x] Agotado 
   - [x] Más vendidos 
   - [x] Lista de ventas 
   - [x] Ingresos por día 
6. Backup & Restore Isar 

* MacOS Support 
* Windows Support 
* IOS Support 
* Android Support