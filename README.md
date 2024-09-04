# Nmapauto
Un script Bash para fascilitar tu viaje de Hacking

## Características
- El script hará primero un escaneo de puertos verboso, permitiéndole **saber instantáneamente** si un puerto está abierto
- Mientras comprueba algún puerto abierto `ex:80`, el script realizará escaneos de versiones y scripts sólo en puertos abiertos **ahorrándole bastante tiempo**
- Los resultados del escaneo se guardarán automáticamente en un archivo **fácil de localizar

### Escaneo de demostración

Escaneo en un equipo DockerLabs

![1](https://github.com/user-attachments/assets/5b03a4a5-15d6-4e69-afdc-61ffa6995451)
![2](https://github.com/user-attachments/assets/6db55595-2471-40c5-94fa-0340d7f7d90b)
![3](https://github.com/user-attachments/assets/2617bf41-cbdb-42eb-ae76-fc23a6464ee8)
![5](https://github.com/user-attachments/assets/c72f2dfd-7d28-4123-88cd-e36fc9feab49)

## Instalar
Clonar el repositorio
```sh
git clone https://github.com/Hackavis/nmapA.git
```
Luego, ejecuta el comando
``sh
sudo cp nmap-auto.sh /bin/nmapA
``
O modifica un poco y añade la línea a tu `.bashrc`/`.zshrc` como una función.

### Uso
``sh
sudo nmapauto <objetivo>``
``
