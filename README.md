packer-buildpack
================

 - Para construir localmente ejecute `./local`, necesitará:
   - Docker (https://www.docker.com/)
   - Drone (http://readme.drone.io/devs/cli/)
   - Un archivo con las configuraciones necesarias en `~/.drone_secrets` como mínimo se necesita lo que se lista en el archivo `secrets_example.yml`
 - Para construir automáticamente activar el proyecto en Drone
   - Generar los secretos necesarios según el archivo `secrets_example.yml` de la siguiente manera:
     ```
     cp secrets_example.yml .drone.sec.yml
     # editar el archivo .drone.sec.yml
     drone secure --repo plataforma/packer-buildpack --checksum
     git add .drone.sec
     git commit -m "configurando secretos"
     git push origin master
     ```
