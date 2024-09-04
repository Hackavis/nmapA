# Nmapauto
Un script Bash para fascilitar tu viaje de Hacking

## Características
- El script hará primero un escaneo de puertos verboso, permitiéndole **saber instantáneamente** si un puerto está abierto
- Mientras comprueba algún puerto abierto `ex:80`, el script realizará escaneos de versiones y scripts sólo en puertos abiertos **ahorrándole bastante tiempo**
- Los resultados del escaneo se guardarán automáticamente en un archivo **fácil de localizar

### Escaneo de demostración
Escaneo en un equipo HTB
![Nmap-Automater](https://user-images.githubusercontent.com/70033863/157475666-f9127ad1-e7b9-473b-8a74-aea6e2dfa2f2.png)

## Instalar
Clonar el repositorio
```sh
git clone https://github.com/the-root-user/nmap-auto.git
```
luego, ejecuta el comando
``sh
sudo cp nmap-auto.sh /bin/nmapauto
```
o modifica un poco y añade la línea a tu `.bashrc`/`.zshrc` como una función.
### Uso
sudo nmapauto <objetivo>``
