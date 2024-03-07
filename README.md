Laravel - API

### Instalación
- Clonar repositorio.

- Dentro del proyecto:  
**`docker-compose build`**

- Dentro del proyecto: Ejecutar Contenedores
**`docker-compose up -d`**

### Contenedor 'app'
- Entrar al contenedor 'app': 
**`docker-compose exec app sh`**

- Ajustar el archivo .env

- Ajustar permisos
**`chmod -R 777 storage`**
**`chmod -R 777 bootstrap/cache`**

- Generar Key
**`php artisan key:generate`**

- Migrar Estructura de la BD 
**`php artisan migrate`**

- Opcional - Para forzar a la instalación de los nuevos paquetes.
**`composer i`**