# TP-Final
Trabajo Práctico Final Entorno de Programación 
Alumna: Abril Rodriguez
Comisión 1
Legajo: R-4582/9

INSTRUCCIONES DE USO:

1. Clone el repositorio con el siguiente comando:

git clone https://github.com/abrilr1604/TP-Final.git

2. Diríjase a la carpeta creada bajo el nombre de "TP-Final". Allí se encontraran los scripts realizados y el archivo de texto que utilicé como prueba para comprobar el funcionamiento de mi programa.

cd TP-Final/

(puede corroborar ésto último con el comando "ls -l")

3. Reemplace el archivo de texto  "textoprueba.txt" por el que usted desea analizar. Procure que lleve el mismo nombre que el anterior.

4. Cree una imagen a partir del Dockerfile que se encuentra en la carpeta.

sudo docker build -t abril:1.0 .    (El punto del final indica que el Dockerfile se encuentra en esa misma carpeta)

5. Corra el contenedor con el comando:

sudo docker run -it abril:1.0

6. El programa ya está listo para ser utilizado. Deberá correr el contenedor cada vez que quiera recorrer el menú.
