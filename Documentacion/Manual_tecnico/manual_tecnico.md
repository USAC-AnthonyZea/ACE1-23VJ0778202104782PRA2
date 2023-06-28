# **MANUAL TÉCNICO**

## **Descripción general**

Se le solicitará para esta actividad la implementación de un sistema para punto de venta en ensamblador. Este sistema tendrá la capacidad de gestionar el inventario de productos, control de ventas y clientes. Además, se tendrá un módulo de reportería que trabajará sobre los datos almacenados por el sistema y un módulo para carga masiva de datos.

## **Requisitos minimos del sistema**
---

1. **Sistema operativo:** El proyecto está diseñado para ejecutarse en DOSBox, un emulador que permite ejecutar aplicaciones DOS en sistemas operativos modernos como Windows, macOS o Linux. Asegúrate de tener instalado DOSBox en tu sistema antes de continuar.

2. **Versión de DOSBox:** Se recomienda utilizar la versión X.X.X de DOSBox para garantizar la compatibilidad y el rendimiento óptimo con el proyecto. Puedes descargar la versión recomendada desde el sitio oficial de DOSBox (www.dosbox.com) o cualquier otro repositorio confiable.

3. **Especificaciones de hardware:**

    - Procesador: Se recomienda un procesador de al menos X MHz para garantizar un rendimiento fluido del proyecto.
    - Memoria RAM: Se requieren al menos Y MB de memoria RAM para ejecutar el proyecto sin problemas.
    - Espacio en disco: Asegúrate de tener Z MB de espacio libre en disco para la instalación y funcionamiento del proyecto.

4. **Configuraciones adicionales:** Antes de ejecutar el proyecto, asegúrate de ajustar las siguientes configuraciones en DOSBox para un funcionamiento óptimo:

    - Asignación de memoria: Si el proyecto requiere una cantidad específica de memoria, asegúrate de configurar DOSBox para asignar la cantidad adecuada de memoria al inicio.
    - Velocidad de emulación: Si el proyecto tiene requisitos de velocidad específicos, ajusta la velocidad de emulación en DOSBox para que coincida con los requisitos del proyecto.

## **Tecnologías Utilizadas**
---

En el desarrollo de este proyecto en ensamblador utilizando DOSBox, se utilizaron diversas tecnologías y herramientas. A continuación, se detallan las principales tecnologías utilizadas:

* Ensamblador: El ensamblador es un lenguaje de programación de bajo nivel que se utiliza para escribir código directamente ejecutable por el procesador de la computadora. A diferencia de los lenguajes de programación de alto nivel, el ensamblador proporciona un control preciso sobre el hardware y las instrucciones del procesador. Permite escribir programas eficientes y optimizados para tareas específicas. En este proyecto, el ensamblador se utilizó para aprovechar al máximo las capacidades del hardware y desarrollar un programa de alto rendimiento.

* DOSBox: DOSBox es un emulador diseñado para ejecutar aplicaciones diseñadas para el sistema operativo DOS en sistemas operativos modernos. Proporciona una plataforma virtual que emula el entorno de ejecución de DOS. DOSBox emula componentes clave de la arquitectura de hardware, como la CPU, el sistema de archivos y el entorno de memoria, lo que permite ejecutar programas antiguos sin tener que usar un sistema operativo DOS físico. En este proyecto, DOSBox se utilizó para crear un entorno DOS virtual en el que se pudiera ejecutar y probar el programa desarrollado en ensamblador.

* Editor de texto: Para escribir y editar el código fuente en ensamblador, se utilizó un editor de texto compatible con el formato de archivos de código ensamblador, como NASM (Netwide Assembler) o TASM (Turbo Assembler). Estos editores de texto están diseñados específicamente para trabajar con lenguajes de bajo nivel y proporcionan características que facilitan la escritura y edición del código, como el resaltado de sintaxis, la numeración de líneas, la indentación automática y la verificación de errores. Además, ofrecen funciones de búsqueda y reemplazo que ayudan a trabajar de manera eficiente y organizada con el código fuente del proyecto.

* El sistema operativo DOS (Disk Operating System) es un sistema operativo de línea de comandos que fue ampliamente utilizado en las primeras computadoras personales. Proporciona una interfaz de usuario basada en comandos a través de la cual los programas pueden acceder a los recursos del sistema, como el sistema de archivos, la memoria y los dispositivos de entrada y salida. En este proyecto, el código fuente del programa se desarrolló teniendo en cuenta las limitaciones y características específicas del sistema operativo DOS. Se utilizaron llamadas al sistema operativo DOS y funciones de interrupción para interactuar con el entorno y los servicios proporcionados por el sistema operativo.

Cada una de estas tecnologías desempeña un papel crucial en el desarrollo y la ejecución del proyecto en ensamblador. El ensamblador permite un control detallado sobre el hardware y las instrucciones del procesador, DOSBox proporciona un entorno virtual para ejecutar el programa en un sistema DOS simulado, el editor de texto facilita la escritura y edición del código fuente de manera eficiente, y el sistema operativo DOS es el entorno objetivo en el que se ejecuta el programa y se interactúa con los recursos del sistema.

## **Instalación**
---
Para poder ejecutar el proyecto en ensamblador utilizando DOSBox, es necesario seguir los siguientes pasos de instalación:

1. **Requisitos del Sistema:** Asegúrate de que tu sistema cumpla con los requisitos mínimos para ejecutar DOSBox correctamente. Estos requisitos pueden incluir un sistema operativo compatible (como Windows, macOS o Linux), una cantidad mínima de memoria RAM y una velocidad de CPU adecuada.

2. **Descarga de DOSBox:** Visita el sitio web oficial de DOSBox en www.dosbox.com y busca la sección de descargas. Allí encontrarás las versiones más recientes de DOSBox disponibles para diferentes sistemas operativos. Descarga la versión adecuada para tu sistema y guárdala en una ubicación conveniente.

3. **Instalación de DOSBox:** Ejecuta el archivo de instalación de DOSBox que descargaste y sigue las instrucciones del asistente de instalación. Durante el proceso de instalación, se te pedirá que elijas una ubicación de instalación y que aceptes los términos y condiciones de uso.

4. **Configuración de DOSBox:** Después de la instalación, abre DOSBox. Se te presentará una ventana de línea de comandos similar a la de un sistema MS-DOS. Antes de ejecutar tu proyecto en ensamblador, es necesario configurar algunos parámetros.

    - **Montar unidades virtuales:** Utiliza el comando mount para asignar una unidad virtual en DOSBox. Por ejemplo, si tu proyecto utiliza un archivo de imagen de disco llamado "project.img", puedes usar el comando mount c path/to/project.img -t floppy para asignarla como unidad C en DOSBox.

    - **Configuración de teclado:** Si necesitas ajustar la configuración del teclado, puedes usar el comando keyb seguido del código del idioma correspondiente. Por ejemplo, keyb us para el idioma inglés.

    - **Otros ajustes:** Puedes explorar las opciones de configuración adicionales de DOSBox, como la velocidad de emulación, el tamaño de la ventana y el mapeo de teclas, mediante el archivo de configuración "dosbox.conf" ubicado en la carpeta de instalación de DOSBox.

5. **Carga y ejecución del proyecto:** Una vez que DOSBox esté configurado, puedes cargar y ejecutar tu proyecto en ensamblador utilizando los comandos y procedimientos específicos del ensamblador que estés utilizando. Esto puede implicar compilar tu código fuente y crear un archivo ejecutable que luego se pueda ejecutar dentro de DOSBox.

6. **Pruebas y verificación:** Una vez que el proyecto esté en ejecución, realiza pruebas exhaustivas para asegurarte de que funcione correctamente dentro del entorno DOSBox. Verifica que las funcionalidades del proyecto se comporten según lo esperado y soluciona cualquier problema o error que encuentres.

## **Resumen - Subrutinas**
---

| Nombre | Descripción |
|--------------|--------------|
|   imprimir_estructura    |   Se encarga de la asignacion de un simbolo "$" a ciertas cadenas dentro de la ejecucion del programa, para pdoer imprimir una estructura almacenada en algun registro    |
|   cadenaAnum   |   Se encarga de hacer el parseo de una cadena numerica a un numero como tal y asi poder ser manipulada    |
|  numAcadena |  Es el procedimiento contrario a cadenaAnum, ya que esta subrutina se encarga de convertir un numero a una cadena y de esta manera poder ser escrita en algun archivo |
| memset | Esta subrutina funciona como una limpieza de la memoria, ya que su funcionamiento es limpiar alguna variable en algun registro |
| cadenas_iguales | Esta subrutina se encarga unicamente de realizar la comparacion si dos cadenas son exactamente iguales y devolver un valor si fuese verdadero o falso |
| copiar_variable | Esta subrutina se encarga de poder copiar byte por byte, para que una etiqueta o variable almacene el contenido que se desee |
| validar_acceso | Esta subrutina se encarga de poder hacer las manipulaciones de registros y memoria para identificar y validar el acceso al sistema |
| reiniciar_variables_ventas | Esta subrutina almacena en su interior varias subrutinas "memset", la cual funciona como una limpieza de las etiquetas usadas en la seccion de ventas |

## **Diccionario de Subrutinas**
---

- ### **Subrutina imprimir_estructura**

```js
;;;;;;;;;;          Subrutina imprimir Estructura         ;;;;;;;;;;
;; ENTRADAS:
;; SALIDAS:
;;          o Impresion de estructura
imprimir_estructura:
    mov DI, offset cod_prod

    ciclo_poner_dolar_1:

        mov AL, [DI]
        cmp AL, 00
        je poner_dolar_1
        inc DI
        jmp ciclo_poner_dolar_1

        poner_dolar_1:
                    mov AL, 24                      ; -> 24 = dolar ($)
                    mov [DI], AL

                    ;; Imprimimos normal
                    mov DX, offset prompt_code
                    mov AH, 09
                    int 21

                    mov DX, offset cod_prod
                    mov AH, 09
                    int 21

                    ;; Salto de linea
                    mov DX, offset new_linea
                    mov AH, 09
                    int 21
    
    mov DI, offset cod_name

    ciclo_poner_dolar_2:

        mov AL, [DI]
        cmp AL, 00
        je poner_dolar_2
        inc DI
        jmp ciclo_poner_dolar_2

        poner_dolar_2:
                    mov AL, 24                      ; -> 24 = dolar ($)
                    mov [DI], AL

                    mov DX, offset prompt_name
                    mov AH, 09
                    int 21

                    ;; Imprimimos normal
                    mov DX, offset cod_name
                    mov AH, 09
                    int 21

                    ;; Salto de linea
                    mov DX, offset new_linea
                    mov AH, 09
                    int 21

    ret
```

- ### **Subrutina cadenaAnum**

```js
;;;;;;;;;;          Subrutina cadenaAnum          ;;;;;;;;;;
;; ENTRADAS
;;        o AX -> numero a convertir
;; SALIDAS
;;        o [numero] -> numero convertido en cadena
cadenaAnum:
    mov AX, 0000    ; inicializar la salida
    mov CX, 0005    ; inicializar contador
		
    seguir_convirtiendo:
        mov BL, [DI]
        cmp BL, 00
        je retorno_cadenaAnum
        sub BL, 30      ; BL es el valor numérico del caracter
        mov DX, 000a
        mul DX          ; AX * DX -> DX:AX
        mov BH, 00
        add AX, BX 
        inc DI          ; puntero en la cadena
        loop seguir_convirtiendo
        retorno_cadenaAnum:
            ret
```

- ### **Subrutina numAcadena**

```js
;;;;;;;;;;          Subrutina cadenaAnum          ;;;;;;;;;;
;; ENTRADAS
;;        o AX -> número a convertir
;; SALIDAS
;;        o [numero] -> numero convertido en cadena
numAcadena:
    
    mov CX, 0005
    mov DI, offset numero

    ciclo_poner30s:
        mov BL, 30
        mov [DI], BL
        inc DI
        loop ciclo_poner30s
        ;; tenemos '0' en toda la cadena

        mov CX, AX                              ; inicializar contador
        mov DI, offset numero
        add DI, 0004
		
        ciclo_convertirAcadena:
            mov BL, [DI]
            inc BL
            mov [DI], BL
            cmp BL, 3a
            je aumentar_siguiente_digito_primera_vez
            loop ciclo_convertirAcadena
            jmp retorno_convertirAcadena

            aumentar_siguiente_digito_primera_vez:
                push DI

                aumentar_siguiente_digito:
                    mov BL, 30     ; poner en '0' el actual
                    mov [DI], BL
                    dec DI         ; puntero a la cadena
                    mov BL, [DI]
                    inc BL
                    mov [DI], BL
                    cmp BL, 3a
                    je aumentar_siguiente_digito
                    pop DI         ; se recupera DI
                    loop ciclo_convertirAcadena

    retorno_convertirAcadena:
    ret
```

- ### **Subrutina memset**

```js
;;;;;;;;;;          Subrutina memset          ;;;;;;;;;;
;; ENTRADAS
;;        o DI -> Direccion de la cadena
;;        o CX -> Tamaño de la cadena
memset:
    ciclo_memset:
        mov AL, 00
        mov [DI], AL
        inc DI
        loop ciclo_memset
        ret
```

- ### **Subrutina cadenas_iguales**

```js
;;;;;;;;;;          Subrutina cadenas_iguales         ;;;;;;;;;;
;; ENTRADAS
;;        o SI -> direccion a cadena 1
;;        o DI -> direccion a cadena 2
;;        o CX -> tamaño maximo
;; SALIDAS
;;        o DL -> 00 si no son iguales 
;;               0ff si si son iguales
cadenas_iguales:
    ciclo_cadenas_iguales:
        mov AL, [SI]
        cmp [DI], AL
        jne no_son_iguales
        inc DI
        inc SI
        loop ciclo_cadenas_iguales
        mov DL, 0ff
    ret

no_son_iguales:
    mov DL, 00
    ret
```

- ### **Subrutina copiar_variable**

```js
;;;;;;;;;;          Subrutina copiar_variable         ;;;;;;;;;;
;; ENTRADAS
;;          o 
copiar_variable:
    mov AL, [DI]
    mov [SI], AL
    inc SI
    inc DI
    loop copiar_variable
    ret
```

- ### **Subrutina validar_acceso**

```js
;;;;;;;;;;          Subrutina validar_acceso         ;;;;;;;;;;
;; SALIDAS
;;          o Regresa en las variables, usuario_capturado y clave_capturada, los valores del archivo leido
validar_acceso:

    ;; Abrimos el archivo de configuracion con las credenciales
    mov AH, 3d
    mov AL, 00
    mov DX, offset nombre_conf
    int 21
    mov [handle_conf], AX
    
    ;; Analizamos el archivo linea por linea
    ciclo_lineaXlinea:
            mov DI, offset buffer_linea
            mov AL, 00
            mov [tam_linea_leida], AL

    ciclo_obtener_linea:
            mov AH, 3f
            mov BX, [handle_conf]
            mov CX, 0001
            mov DX, DI
            int 21
            cmp CX, 0000
            je fin_leer_linea
            mov AL, [DI]
            cmp AL, 0a
            je fin_leer_linea
            mov AL, [tam_linea_leida]
            inc AL
            mov [tam_linea_leida], AL
            inc DI
            jmp ciclo_obtener_linea

        fin_leer_linea:
                mov AL, [tam_linea_leida]
                mov AL, 00
                cmp [estado], AL   ;; verificar la cadena credenciales
                je verificar_cadena_credenciales
                mov AL, 01
                cmp [estado], AL   ;; obtener campo
                je obtener_campo_conf
                mov AL, 02
                cmp [estado], AL   ;; obtener campo
                je obtener_campo_conf
                jmp retorno_exitoso

        verificar_cadena_credenciales:
                cmp CX, 0000
                je retorno_fallido
                mov CH, 00
                mov CL, [tk_creds]
                mov SI, offset tk_creds
                inc SI
                mov DI, offset buffer_linea
                call cadenas_iguales
                cmp DL, 0ff
                je si_hay_creds
                jmp retorno_fallido

        si_hay_creds:
                mov AL, [estado]
                inc AL
                mov [estado], AL
                jmp ciclo_lineaXlinea

        obtener_campo_conf:
                ;; Se lee el campo usuario, para obtener la cadena usuario
                cmp CX, 0000
                je retorno_fallido
                mov CH, 00
                mov CL, [tk_usuario]
                mov SI, offset tk_usuario
                inc SI
                mov DI, offset buffer_linea
                call cadenas_iguales
                cmp DL, 0ff
                je obtener_valor_usuario

                ;; Se lee el campo clave, para obtener la cadena clave
                mov CH, 00
                mov CL, [tk_clave]
                mov SI, offset tk_clave
                inc SI
                mov DI, offset buffer_linea
                call cadenas_iguales
                cmp DL, 0ff
                je obtener_valor_clave
                jmp retorno_fallido

        obtener_valor_usuario:
            ciclo_espacios1:
                    inc DI
                    mov AL, [DI]
                    cmp AL, 20    ;; ver si es espacio
                    jne ver_si_es_igual
                    inc DI
                    jmp ciclo_espacios1
            ver_si_es_igual:
                    mov CH, 00
                    mov CL, [tk_igual]
                    mov SI, offset tk_igual
                    inc SI
                    call cadenas_iguales
                    cmp DL, 0ff
                    je obtener_valor_cadena_usuario
                    jmp retorno_fallido
            obtener_valor_cadena_usuario:
                ciclo_espacios2:
                        inc DI
                        mov AL, [DI]
                        cmp AL, 20    ;; ver si es espacio
                        jne capturar_usuario
                        inc DI
                        jmp ciclo_espacios2
                capturar_usuario:
                        mov CX, 0008    ;; TAMAÑO DEL USUARIO: 8 caracteres
                        mov SI, offset usuario_capturado
                ciclo_cap_usuario:
                        inc DI
                        inc SI
                        mov AL, [DI]
                        mov [SI], AL
                        loop ciclo_cap_usuario
                        mov AL, [estado]
                        inc AL
                        mov [estado], AL
                        jmp ciclo_lineaXlinea

        obtener_valor_clave:
            ciclo_espacios3:
                    inc DI
                    mov AL, [DI]
                    cmp AL, 20    ;; ver si es espacio
                    jne ver_si_es_igual2
                    inc DI
                    jmp ciclo_espacios3
            ver_si_es_igual2:
                    mov CH, 00
                    mov CL, [tk_igual]
                    mov SI, offset tk_igual
                    inc SI
                    call cadenas_iguales
                    cmp DL, 0ff
                    je obtener_valor_cadena_clave
                    jmp retorno_fallido
            obtener_valor_cadena_clave:
                ciclo_espacios4:
                        inc DI
                        mov AL, [DI]
                        cmp AL, 20    ;; ver si es espacio
                        jne capturar_clave
                        inc DI
                        jmp ciclo_espacios4
                capturar_clave:
                        mov CX, 0009    ;; TAMAÑO DE LA CLAVE: 9 caracteres
                        mov SI, offset clave_capturada
                ciclo_cap_clave:
                        inc DI
                        inc SI
                        mov AL, [DI]
                        mov [SI], AL
                        loop ciclo_cap_clave
                        mov AL, [estado]
                        inc AL
                        mov [estado], AL
                        jmp ciclo_lineaXlinea

    retorno_fallido:
            mov DL, 00
            ret
    retorno_exitoso:
            mov DL, 0ff
            ret
```

- ### **Subrutina reiniciar_variables_ventas**

```js
;;;;;;;;;;          Subrutina escribir_fecha_txt         ;;;;;;;;;;
;; ENTRADAS
;; SALIDAS
reiniciar_variables_ventas:
    ;; Limpiar las variables de fechas (Registro y Reporte)
    mov DI, offset dia_venta
    mov CX, 0006
    call memset

    mov DI, offset fecha_mayor
    mov CX, 0006
    call memset

    mov DI, offset fecha_menor
    mov CX, 0006
    call memset

    mov DI, offset codigo_venta_temp
    mov CX, 0005h
    call memset

    ;; Limpiamos la variable unidades_venta
    mov DI, offset unidades_venta
    mov CX, 0005
    call memset
    
    ;; Limpiamos la variable codigo_venta y descripcion_venta
    mov DI, offset codigo_venta
    mov CX, 0026h
    call memset

    ;; Limpiamos la variable num_unidadesVenta
    mov DX, 0000
    mov [num_unidadesVenta], DX

    ;; Limpiamos la variable num_monto
    mov DX, 0000
    mov [num_monto], DX

    ;; Limpiamos la variables de montos (Reporte)
    mov di, offset num_monto_mayor
    mov cx, 0002
    call memset

    mov di, offset num_monto_menor
    mov cx, 0002
    call memset

    ; Limpiar la variable cantidadVentas
    mov di, offset cantidadVentas
    mov cx, 0002
    call memset

    ret
```

## **Resumen - Variables**
---

- ### **Variables para la validación de credenciales**
    
    ```js
    ;; Variables para la validacion de las credenciales
    credenciales_incorrectas    db "    Credenciales Incorrectar", "$"
    credenciales_correctar      db "Sus Credenciales Son Correctar, Bienvenido", "$"
    usuario                     db "aherrera", "$"
    clave                       db "202104782", "$"
    usuario_capturado           db 08   dup (0)
    clave_capturada             db 09   dup (0)
    ```

- ### **Tokens para la lectura de credenciales**

    ```js
    ;; Tokens para la lectura de las credenciales
    tk_creds                    db  0e, "[credenciales]"
    tk_usuario                  db  07, "usuario"
    tk_clave                    db  05, "clave"
    tk_igual                    db  01, "="
    tk_comillas                 db  01, '"'
    ```

- ### **Variables para manipulacion y creacion de archivos**

    ```js
    nombre_conf                 db "PRA2.CNF", 00
    handle_conf                 dw  0000

    ;; Archivo PRODUCTOS
    archivo_prods               db   "PROD.BIN",00
    handle_prods                dw   0000

    ;; Archivo de ventas
    archivo_ventas              db "VENT.BIN", 00
    handle_ventas               dw  0000

    archivo_reporte             db  "REP.TXT", 00
    handle_reporte              dw 0000

    archivo_alfabetico          db "ABC.HTM", 00
    handle_alfabetico           dw 0000

    archivo_catalogo            db "CATALG.HTM", 00
    handle_catalogo             dw 0000

    archivo_existencias         db   "FALTA.HTM", 00
    handle_existencias          dw   0000
    ```
- ### **Variables para la estructura de productos**

    ```js
    ;; "Estructura producto"
    cod_prod                    db    05 dup (0)
    cod_name                    db    21 dup (0)
    cod_price                   db    05 dup (0)
    cod_units                   db    05 dup (0)

    ;; Variables temporales
    cod_prod_temp               db    05 dup (0)
    puntero_temp                dw    0000

    ;; numéricos
    num_price                   dw    0000
    num_units                   dw    0000

    ;; Archivo PRODUCTOS
    archivo_prods               db   "PROD.BIN",00
    handle_prods                dw   0000
    ```

- ### **Variables para la estructura de ventas**

    ```js
    ;; "Estructura de venta"
    dia_venta                   db 01 dup (0)
    mes_venta                   db 01 dup (0)
    anio_venta                  dw 00
    hora_venta                  db 01 dup (0)
    minuto_venta                db 01 dup (0)

    codigo_venta_temp           db 05 dup (0)
    unidades_venta              db 05 dup (0)

    bytes_items                 db  46 dup (0)
    direccion_item              dw  0000

    codigo_venta                db 05 dup (0)
    descripcion_venta           db 21 dup (0)

    ;; Variables numericas para las ventas
    num_precioVenta             dw  0000
    num_unidadesVenta           dw  0000
    num_cantidad    	        dw  0000
    num_monto   	            dw  0000
    num_monto_total             dw  0000

    ;; Contador para los items de ventas
    cont_items_venta            db 0

    ;; Separaciones y cadena fin
    simbolo_fin_ventas          db "$"
    terminar_venta              db "fin", "$"
    ```


- ### **Variables para manipulacion de fecha y hora dentro de los archivos**

    ```js
    espacioBlanco               db  " "
    hora_actual                 db "00:00:00"
        horaActualSize          equ $-hora_actual
        dia_actual              db 01 dup (0)
        mes_actual              db 01 dup (0)
        anio_actual             dw 00
        separadorFecha          db "/", 00
        separadorHora           db ":", 00

    txtFecha                    db "Fecha: "
        txtFechaSize            equ $-txtFecha

        fecha_mayor             db 06h dup (0)
        fecha_menor             db 06h dup (0)
    ```

- ### **Variables para la estructura de los archivos .HTM**

    ```js
    tam_encabezado_html		      db 1b 
    tam_tit_Catalogo_html	      db 17 
    tam_style_Table_html	      db 4B 
    tam_style_Th_html		      db 41 
    tam_cierre_style		      db 8  
    tam_cierre_head			      db 7  
    tam_body_Cataologo_html	      db 67
    tam_fecha_html			      db 22
    tam_hora_html			      db 10
    tam_cierre_p			      db 4  
    tam_apertura_table		      db 3C
    tam_cierre_table		      db 8  
    tam_apertura_tr			      db 4  
    tam_titulos_html		      db 9a
    tam_titulos_existencias_html  db 5a
    tam_cierre_tr			      db 5	
    tam_apertura_td			      db 33
    tam_cierre_td			      db 5	
    tam_cierre_body			      db 7  
    tam_cierre_html			      db 7
    tam_titulos_alfa_html	      db 83
    tam_body_Rep_alfa_html        db 8E
    tam_body_exist_html           db 6c

    encabezado_html        	    db	"<!DOCTYPE html><html><head>" 
    tit_Catalogo_html 		    db	"<title>Reporte</title>"	
    style_Table_html		    db	"<style>table { width: 100%; border-collapse: collapse; }" 
    style_Th_html			    db  "th, td {border: 1px solid black; padding: 8px; text-align: left;}"
    cierre_style           	    db  "</style>"
    cierre_head            	    db  "</head>"
    body_Cataologo_html         db  '<body><h1  style="color:red; font-family: Goudy Stout, sans-serif;">Catalogo Completo de Productos</h1>'
    body_Rep_alfa_html		    db	'<body><h1  style="color:red; font-family: Goudy Stout, sans-serif">Reporte de Productos Alfabeticamente</h1>'
    body_exist_html             db  '<body><h1  style="color:red; font-family: Goudy Stout, sans-serif">Reporte de Productos Sin Existencias</h1>'
    fecha_html				    db	"<p> Reporte generado en -> fecha: "
    hora_html 				    db	"<p> En horario: "
    cierre_p				    db	"</p>"
    apertura_table			    db 	'<table style="text-align: center; border: 1px solid black;">'
    cierre_table			    db	"</table>"
    apertura_tr				    db	"<tr>"
    titulos_alfa_html		    db	'<th style="background-color: blue; color: white;">Letra</th><th style="background-color: blue; color: white;">Cantidad de Productos'
    titulos_html			    db	'<th style="background-color: cyan; color: black;">Código</th><th>Descripción</th><th style="background-color: cyan; color: black;">Precio</th><th>Unidades'
    titulos_existencias_html	db	'<th>Codigo</th><th style="background-color: blue; color: white;">Descripcion</th><th>Precio'
    cierre_tr				    db	"</tr>"
    apertura_td				    db	'<td style="border: 1px solid black; padding: 8px;">'
    cierre_td				    db	"</td>"
    cierre_body				    db	"</body>"
    cierre_html				    db	"</html>"
    cierre_th				    db  "</th>"
    ```

## **Limitaciones y mejores futuras**
---

En esta sección, se describen las limitaciones conocidas del proyecto en ensamblador, así como las posibles mejoras y funcionalidades adicionales que podrían implementarse en versiones futuras.

- Limitaciones Actuales:

    * Rendimiento limitado en ciertos escenarios de carga de datos masivos.
    Requiere una configuración específica de hardware y sistema operativo.
    * No es compatible con sistemas operativos modernos.
    Ausencia de manejo de errores y recuperación en casos de fallos inesperados.
    * La interfaz de usuario actual puede resultar poco intuitiva para usuarios no familiarizados con ensamblador.

- Mejoras Futuras:

    * Optimización de algoritmos y estructuras de datos para mejorar el rendimiento en situaciones de carga de datos masivos.
    * Implementación de soporte para sistemas operativos más recientes y ampliación de la compatibilidad de hardware.
    * Incorporación de un sistema de manejo de errores robusto y mecanismos de recuperación ante fallos.
    * Mejora de la interfaz de usuario, incluyendo elementos gráficos y una experiencia más intuitiva.
    * Adición de funcionalidades adicionales, como la capacidad de exportar resultados a formatos comunes, integración con herramientas de depuración y optimización del código ensamblador generado.

- Prioridades y Planificación:

   * Se priorizará la optimización del rendimiento y la compatibilidad con sistemas operativos modernos en las próximas versiones.
    * Las mejoras en la interfaz de usuario y el manejo de errores se abordarán en etapas posteriores del desarrollo.
    * Se establecerá una hoja de ruta con fechas estimadas para cada mejora y se asignarán los recursos necesarios para su implementación.
    * Consideraciones de Retrocompatibilidad:

    *   Se trabajará para garantizar la compatibilidad con proyectos y código existente en futuras actualizaciones.
    * Se proporcionarán instrucciones claras sobre cómo migrar a nuevas versiones y se mantendrá la retrocompatibilidad en la medida de lo posible.

- Solicitudes de Retroalimentación:

    * Se alienta a los usuarios y colaboradores a proporcionar comentarios, informar de problemas y enviar sugerencias de mejora.
    * Se facilitará un canal de comunicación, como un correo electrónico o un foro en línea, para que los usuarios puedan compartir su retroalimentación y contribuir al desarrollo continuo del proyecto.