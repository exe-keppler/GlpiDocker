#!/bin/bash



# Mover directorios y actualizar config.php
mv /var/www/html/glpi/files /path/to/new/location/files
mv /var/www/html/glpi/config /path/to/new/location/config
# Actualiza config.php con las nuevas rutas...

# Iniciar Apache en modo foreground
apache2-foreground
