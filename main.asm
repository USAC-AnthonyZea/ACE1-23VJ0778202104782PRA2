.MODEL SMALL
.RADIX 16
.STACK
.DATA

;; Variables para la validacion de las credenciales
credenciales_incorrectas    db "    Credenciales Incorrectar", "$"
credenciales_correctar      db "Sus Credenciales Son Correctar, Bienvenido", "$"
usuario                     db "aherrera", "$"
clave                       db "202104782", "$"
usuario_capturado           db 08   dup (0)
clave_capturada             db 09   dup (0)

;; Tokens para la lectura de las credenciales
tk_creds                    db  0e, "[credenciales]"
tk_usuario                  db  07, "usuario"
tk_clave                    db  05, "clave"
tk_igual                    db  01, "="
tk_comillas                 db  01, '"'

;; Archivo de configuracion (credenciales)
nombre_conf                 db "PRA2.CNF", 00
handle_conf                 dw  0000

;; Variables para analisis de archivo de credenciales
buffer_linea                db  0ff dup (0)
estado                      db  00
espacio_leido               db  00
tam_linea_leida             db  00

;; Variable num, que almacenara los| datos numericos
numero                      db   05 dup (30)

;; Nueva linea
new_linea                   db 0a, "$"
nuevaLinea                  db 0a, "$"

;; Variables Iniciales y Finales
mensajeInicial              db "Universidad de San Carlos de Guatemala", 0ah, "Facultad de Ingenieria", 0ah, "Escuela de Vacaciones", 0ah, "Arquitectura de Computadoras y Ensambladores 1", 0ah, 0ah, "Nombre: Anthony Samuel Zea Herrera", 0ah,"Carne:  202104782", 0ah, "$"
menuInicial                 db 0ah, "Bienvenido al sistema", 0ah, "- (V)entas", 0ah, "- (P)roductos", 0ah, "- (H)erramientas", 0ah, "$"
mensajeFinal                db "Vuelva pronto", 0ah, "$"

;; Prompts para pedir al usuario
prompt                      db "Elija una opcion: ", 0ah, "$"
prompt_code                 db "Codigo: ", "$"
prompt_name                 db "Descripcion: ", "$"
prompt_price                db "Precio: ", "$"
prompt_units                db "Unidades: ", "$"

;; Variables para acceso a menus
titulo_venta                db 0ah, "MENU VENTAS", 0ah, "$"
titulo_producto             db 0ah, "MENU PRODUCTOS", 0ah, "$"
titulo_herramientas         db 0ah, "MENU HERRAMIENTAS", 0ah, "$"
titulo_prod                 db 0ah, "Producto", 0ah, "$"
titulo_vent                 db 0ah, "Venta", 0ah, "$"
sub_vent                    db      "=====", 0a, "$"

;; Variable temporal para opcion de menu
temp                        db 00, "$"

;; Subrayados
sub_ven                     db "===========", 0a, "$"
sub_pro                     db "==============", 0a, "$"
sub_her                     db "=================", 0a, "$"
sub2_prod                   db "========", 0a, "$"
sub3_prod                   db "=====", 0a, "$"
linea                       db "---------------------------------", 0a, "$"

;; Buffer de entrada
buffer_entrada              db  20, 00
                            db  20 dup (0)

;; Buffer de ceros
ceros                       db     2a dup (0)

;; Variables para productos
mostrar_prod                db "- (M)ostrar producto", 0a, "$"
ingresar_prod               db "- (I)ngresar producto", 0a, "$"
editar_prod                 db "- (E)ditar producto", 0a, "$"
borrar_prod                 db "- (B)orrar producto", 0a, "$"

prods_registrados           db "Productos registrados:",0a,"$"
no_existencias              db "Sin existencias", 0a, "$"

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

; Estructura de venta
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

;; Archivo de ventas
archivo_ventas              db "VENT.BIN", 00
handle_ventas               dw  0000h

;; Variables para ventas
vent_ingresar               db  "- (I)ngresar Venta", 0a, "$"
vent_regresar               db  "- (R)egresar al menu principal", 0a, "$"

prompt_cantidad             db  "Cantidad: ","$"
prompt_monto                db  "Monto: ","$"
prompt_monto_total          db  "Monto total: ","$"

;; VARIABLES PARA EL REPORTE DE VENTAS ;;
puntero_items               dw  0000h

pgReporteVentas             db  "REP.TXT", 00
handle_reporte              dw 0000

separador                   db  "|=================================================|", 0dh, 0ah, "$"
    separadorSize           equ  $-separador
separadorSimple             db   "|-------------------------------------------------|", 0dh, 0ah, "$"
    separadorSimpleSize     equ  $-separadorSimple

;; Variables para fecha y hora en reportes
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

txtMonto                    db "Monto: "
    txtMontoSize            equ $-txtMonto

txtUltimasVentas            db  "Ultimas ventas: ", 0ah
    txtUltimasVentasSize    equ $-txtUltimasVentas

txtMayorMonto              db "Venta con mayor monto: ", 0ah
    txtMayorMontoSize       equ $-txtMayorMonto

txtMenorMonto              db "Venta con menor monto: ", 0ah
    txtMenorMontoSize       equ $-txtMenorMonto

    fecha_mayor             db 06h dup (0)
    fecha_menor             db 06h dup (0)

    num_monto_mayor         dw 0000
    num_monto_menor         dw 0000

    cantidadVentas          dw 0000

    offsetReporteVentas     dw 0000

;;; MENU HERRAMIENTAS
mensaje_reportes            db "REPORTE GENERADO EXISTOSAMENTE", 0a, "$"

;; OPciones del menu
reporte_ventas              db "- Reporte de ventas -> (v)", 0a, "$"
reporte_catalogo            db "- Catalogo completo -> (c)", 0a, "$"
reporte_alfabetico          db "- Reporte alfabetico de productos -> (a)", 0a, "$"
reporte_sin_existencias     db "- Reporte de productos sin existencias -> (p)", 0a, "$"

;; Variables para la estructura del HTML
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

;; REPORTE DE PRODUCTOS ALFABETICO
archivo_alfabetico          db "ABC.HTM", 00
handle_alfabetico           dw 0000
dia3                        db 01 dup (0)
mes3                        db 01 dup (0)
anio3                       dw 0000
hora3                       db 01 dup (0)
minutos3                    db 01 dup (0)
dos_puntos                  db ":", 0a, "$"
diagonal                    db "/", 0a, "$"
contador                    db 00
letra_actual                db 61
primeraLetra                db 00

;; REPORTE DE PRODUCTOS, CATALOGO COMPLETO
archivo_catalogo            db "CATALG.HTM", 00
handle_catalogo             dw 0000
dia2                        db 01 dup (0)
mes2                        db 01 dup (0)
anio2                       dw 0000
hora2                       db 01 dup (0)
minutos2                    db 01 dup (0)

;; REPORTE DE PRODUCTOS, SIN EXISTENCIAS
nombre_rep_existencias      db   "FALTA.HTM", 00
handle_existencias          dw   0000

.CODE
.STARTUP
;; CODIGO
inicio:

    ;; Salto de linea
    mov DX, offset new_linea
    mov AH, 09
    int 21

    ;; ENCABEZADO INICIAL
    mov DX, offset mensajeInicial
    mov AH, 09                              
    int 21

    ;; Validacion de usuario y clave
    call validar_acceso

    int 03

    ;; Verificamos si el nombre de usuario es correcto
    mov SI, offset usuario
    mov DI, offset usuario_capturado
    inc DI
    mov CX, 08
    call cadenas_iguales
    cmp DL, 0ff
    je clave_usuario_correctos

    ;; Si es incorrecto simplemente la ejecucion termina
    jmp datos_incorrectos

        clave_usuario_correctos:
            ;; Verificamos si la clave es correcta
            mov SI, offset clave
            mov DI, offset clave_capturada
            inc DI
            mov CX, 09
            call cadenas_iguales
            cmp DL, 0ff

            je menu_principal

            ;; Si son incorrectas
            jmp datos_incorrectos
        
        datos_incorrectos:
            mov DX, offset linea
            mov AH, 09                              
            int 21
            mov DX, offset mensajeFinal
            mov AH, 09                              
            int 21
            call terminar



menu_principal:
    ;; MENU INICIAL
    mov DX, offset menuInicial
    mov AH, 09                              
    int 21                                  

    ;; OPCION
    mov DX, offset prompt
    mov AH, 09                              
    int 21

    ;; Leer opcion
    mov AH, 08
    int 21                  ; El caracter se guarda en AL

    ;; Comparamos el valor ingresado con P, para menu de productos
    cmp AL, 70 ;;; -> 70 = P
    je menu_productos

    ;; Comparamos el valor ingresado con V, para menu de ventas
    cmp AL, 76 ;;; -> 76 = V
    je menu_ventas

    ;; Comparamos el valor ingresado con H, para menu de herramientas
    cmp AL, 68 ;;; -> 68 = H
    je menu_herramientas

    ;; Si no es niguna de las opciones
    jmp menu_principal

;;;;;;;;;;;;;;;;;;;;; MENUS PRINCIPALES ;;;;;;;;;;;;;;;;;;;

;;; MENU PRODUCTOS
menu_productos:
    ;; Encabezado del menu de productos --> MENU PRODUCTOS
    mov DX, offset titulo_producto
    mov AH, 09                              
    int 21
    mov DX, offset new_linea
    mov AH, 09                              
    int 21

    ;; Opciones de menu de productos
    mov DX, offset mostrar_prod
    mov AH, 09                              
    int 21
    mov DX, offset ingresar_prod
    mov AH, 09                              
    int 21
    mov DX, offset editar_prod
    mov AH, 09                              
    int 21
    mov DX, offset borrar_prod
    mov AH, 09                              
    int 21
    mov DX, offset vent_regresar
    mov AH, 09                              
    int 21

    ;; Leer opcion
    mov AH, 08
    int 21

    mov DX, offset new_linea
    mov AH, 09                              
    int 21

    ;; OPCION
    mov DX, offset prompt
    mov AH, 09                              
    int 21

    ;; Comparamos el valor ingresado con B, para borrar un producto
    cmp AL, 62 ;;; -> 62 = B  
    je eliminar_producto_archivo

    ;; Comparamos el valor ingresado con I, para insertar un producto
    cmp AL, 69 ;;; -> 69 = I
    je ingresar_producto_archivo

    ;; Comparamos el valor ingresado con M, para mostrar un producto
    cmp AL, 6d ;;; -> 65 = E
    je mostrar_productos_archivo

    ;; Si se presiona la R, se regresa al menu principal
    cmp AL, 72  ;;; -> 72 = R
    je menu_principal

    ;; Si no es niguna de las opciones
    jmp menu_productos

    ;; PEDIR CODIGO DEL PRODUCTO
    ingresar_producto_archivo:
        ;; Imprimir encabeza de ingreso de producto
        mov DX, offset titulo_prod
        mov AH, 09
        int 21
        mov DX, offset sub2_prod
        mov AH, 09
        int 21
        mov DX, offset new_linea
        mov AH, 09
        int 21

    pedir_de_nuevo_codigo:
        ;;; PEDIMOS EL CODIGO
        mov DX, offset prompt_code
        mov AH, 09
        int 21
        
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21

        ;; Verificar que el tamaño del codigo no sea mayor a 5
        mov DI, offset buffer_entrada
        inc DI
        mov AL, [DI]
        cmp AL, 00
        je pedir_de_nuevo_codigo
        cmp AL, 05
        jb aceptar_tam_cod

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        jmp pedir_de_nuevo_codigo

        ;; mover al campo codigo en la estructura
    aceptar_tam_cod:
        mov SI, offset cod_prod
        mov DI, offset buffer_entrada
        inc DI
        mov CH, 00
        mov CL, [DI]
        inc DI                                      ; me posiciono en el contenido del buffer

    copiar_codigo:  
        mov AL, [DI]
        mov [SI], AL
        inc SI
        inc DI
        loop copiar_codigo

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

    ;; PEDIR NOMBRE DEL PRODUCTO
    pedir_de_nuevo_name:
        mov DX, offset prompt_name
        mov AH, 09
        int 21
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21

        ;; Verificar que el tamaño del codigo no sea mayor a 16
        mov DI, offset buffer_entrada
        inc DI
        mov AL, [DI]
        cmp AL, 00
        je pedir_de_nuevo_name
        cmp AL, 20
        jb aceptar_tam_name

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        jmp pedir_de_nuevo_name

        ;; mover al campo codigo en la estructura
    aceptar_tam_name:
        mov SI, offset cod_name
        mov DI, offset buffer_entrada
        inc DI
        mov CH, 00
        mov CL, [DI]
        inc DI                                      ; me posiciono en el contenido del buffer

    copiar_nombre:  
        mov AL, [DI]
        mov [SI], AL
        inc SI
        inc DI
        loop copiar_nombre

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

    ;; PEDIR PRECIO DEL PRODUCTO
    pedir_de_nuevo_precio:
        mov DX, offset prompt_price
        mov AH, 09
        int 21
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21

        ;; Verificar que el tamaño del codigo no sea mayor a 5
        mov DI, offset buffer_entrada
        inc DI
        mov AL, [DI]
        cmp AL, 00
        je pedir_de_nuevo_precio
        cmp AL, 06
        jb aceptar_tam_price

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        jmp pedir_de_nuevo_precio

        ;; mover al campo codigo en la estructura
    aceptar_tam_price:
        mov SI, offset cod_price
        mov DI, offset buffer_entrada
        inc DI
        mov CH, 00
        mov CL, [DI]
        inc DI                                      ; me posiciono en el contenido del buffer

    copiar_price:  
        mov AL, [DI]
        mov [SI], AL
        inc SI
        inc DI
        loop copiar_price

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

        ;; Convertir el precio a numero
        mov DI, offset cod_price
        call cadenaAnum

        ;; En AX, se encuentra el numero convertido
        mov [num_price], AX

        ;; Limpiamos la variable
        mov DI, offset cod_price
        mov CX, 0005
        call memset

    ;; PEDIR PRECIO DEL PRODUCTO
    pedir_de_nuevo_units:
        mov DX, offset prompt_units
        mov AH, 09
        int 21
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21

        ;; Verificar que el tamaño del codigo no sea mayor a 5
        mov DI, offset buffer_entrada
        inc DI
        mov AL, [DI]
        cmp AL, 00
        je pedir_de_nuevo_units
        cmp AL, 06
        jb aceptar_tam_units

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        jmp pedir_de_nuevo_units

        ;; mover al campo codigo en la estructura
    aceptar_tam_units:
        mov SI, offset cod_units
        mov DI, offset buffer_entrada
        inc DI
        mov CH, 00
        mov CL, [DI]
        inc DI                                      ; me posiciono en el contenido del buffer

    copiar_units:  
        mov AL, [DI]
        mov [SI], AL
        inc SI
        inc DI
        loop copiar_units

        ;; Convertir las unidades a numero
        mov DI, offset cod_units
        call cadenaAnum

        ;; En AX, se encuentra el numero convertido
        mov [num_units], AX

        ;; Limpiamos la variable
        mov DI, offset cod_units
        mov CX, 0005
        call memset

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        ; Finaliza la peticion de datos de producto ;

                ;;;; GUARDAR EN ARCHIVO PROD.BIN ;;;;
                ;; -> Probar abrir archivo normal
                mov AL, 02
                mov AH, 3d
                mov DX, offset archivo_prods
                int 21

                ;; --> Si no, lo creamos
                jc crear_archivo_prod
                
                ;; --> Si abre se escribe sobre el
                jmp guardar_handle_prod


                    ;; -> Creamos el archivo
    crear_archivo_prod:
        mov CX, 0000
        mov DX, offset archivo_prods
        mov AH, 3c
        int 21

                    ;; -> Archivo abierto
    guardar_handle_prod:
                    
        ;; -> Se guarda el handle 
        mov [handle_prods], AX

        ;; -> Obtenemos el handle
        mov BX, [handle_prods]

        ;; -> Nos posicionamos en el final del archivo
        mov CX, 00
        mov DX, 00
        mov AL, 02
        mov AH, 42
        int 21
        
        ;; -> ESCRIBIR EL PRODUCTO EN EL ARCHIVO
        ;; -> Escribimos codigo y nombre del producto en el archivo
        mov CX, 26
        mov DX, offset cod_prod
        mov AH, 40
        int 21

        ;; Escribimos precio y unidades del producto
        mov CX, 0004
        mov DX, offset num_price
        mov AH, 40
        int 21

        ;; Limpiamos la variable de el codigo y descripcion
        mov DI, offset cod_prod
        mov CX, 0005
        call memset

        ;; Limpiamos la variable de el codigo y descripcion
        mov DI, offset cod_name
        mov CX, 0005
        call memset

        ;; Limpiamos la variable de el codigo y descripcion
        mov DI, offset cod_price
        mov CX, 0005
        call memset

        ;; Limpiamos la variable de el codigo y descripcion
        mov DI, offset cod_units
        mov CX, 0005
        call memset

        ;; -> Cerramos el archivo
        mov AH, 3e
        int 21

        jmp menu_productos

    ;;; OPCION MOSTRAR PRODUCTOS
    mostrar_productos_archivo:

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

        ;; Salto de linea
        mov DX, offset prods_registrados
        mov AH, 09
        int 21

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

        ;; Abrimos el archivo
        mov AL, 02
        mov AH, 3d
        mov DX, offset archivo_prods
        int 21

        ;; Guardamos el handle
        mov [handle_prods], AX

            ;; Leemos el archivo
    ciclo_mostrar:

        ;; Colocamos el puntero en cierta posicion
        mov BX, [handle_prods]
        mov CX, 0026
        mov DX, offset cod_prod

        ;; Guardamos el producto a mostrar
        mov AH, 3f
        int 21

        ;; El puntero avanzo
        mov BX, [handle_prods]
        mov CX, 0004
        mov DX, offset num_price
        
        ;; Guardamos el producto a mostrar
        mov AH, 3f
        int 21

        ;; ¿cuántos bytes leímos?
        ;; si se leyeron 0 bytes entonces se terminó el archivo...
        cmp AX, 0000

        ;; Verificamos si el archivo ya esta vacio
        je fin_mostrar

        ;; Verificamos si es un producto valido para mostrar
        mov AL, 00
        cmp [cod_prod], AL
        je ciclo_mostrar

        ;; Producto en estructura
        call imprimir_estructura
        jmp ciclo_mostrar

    fin_mostrar:
        jmp menu_productos

    ;; MENU PARA ELIMINAR UN PRODUCTO
    eliminar_producto_archivo:

        mov DX, 0000
        mov [puntero_temp], DX
        
        pedir_de_nuevo_codigo2:
            ;;; PEDIMOS EL CODIGO
            mov DX, offset prompt_code
            mov AH, 09
            int 21
            
            mov DX, offset buffer_entrada
            mov AH, 0a
            int 21

            ;; Verificar que el tamaño del codigo no sea mayor a 5
            mov DI, offset buffer_entrada
            inc DI
            mov AL, [DI]
            cmp AL, 00
            je pedir_de_nuevo_codigo2
            cmp AL, 06
            jb aceptar_tam_cod2

            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            jmp pedir_de_nuevo_codigo2

        ;; mover al campo codigo en la estructura
    aceptar_tam_cod2:
        mov SI, offset cod_prod_temp
        mov DI, offset buffer_entrada
        inc DI
        mov CH, 00
        mov CL, [DI]
        inc DI                                      ; me posiciono en el contenido del buffer

    copiar_codigo2:  
        mov AL, [DI]
        mov [SI], AL
        inc SI
        inc DI
        loop copiar_codigo2

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

        ;; Abrimos el archivo
        mov AL, 02                  ; lectura/escritura
        mov DX, offset archivo_prods
        mov AH, 3d
        int 21
        mov [handle_prods], AX

            ;; Revisar si existe el producto
    ciclo_encontrar:

        ;; Leemos los primeros bytes ---> Codigo, name
        mov BX, [handle_prods]
        mov CX, 26
        mov DX, offset cod_prod
        mov AH, 3f
        int 21

        ;; Leemos los segundos bytes ---> preio, unidades
        mov BX, [handle_prods]
        mov CX, 4
        mov DX, offset num_price
        mov AH, 3f
        int 21

        ;; Verificamos si ya se leyo todo el archivo
        cmp AX, 0000
        je finalizar_borrar

        ;; Avanzamos con el puntero temporal
        mov DX, [puntero_temp]
        add DX, 2a
        mov [puntero_temp], DX

        ;; Verificamos si es un producto valido
        mov AL, 00
        cmp [cod_prod], AL
        je ciclo_encontrar

        ;; Verificamos la cadena (codigo)
        mov SI, offset cod_prod_temp
        mov DI, offset cod_prod
        mov CX, 0005
        call cadenas_iguales

        ;; Si el valor es 0FF
        cmp DL, 0ff
        je borrar_encontrado
        jmp ciclo_encontrar

    borrar_encontrado:

        ;; Nos posicionamos sobre el producto que queremos borrar
        mov DX, [puntero_temp]
        sub DX, 2a
        mov CX, 0000
        mov BX, [handle_prods]
        mov AL, 00
        mov AH, 42
        int 21

        ;; Puntero posicionado
        ;; Eliminamos y asignamos 00
        mov CX, 2a
        mov DX, offset ceros
        mov AH, 40
        int 21

    finalizar_borrar:
        ;; Cerramos el archivo
        mov BX, [handle_prods]
        mov AH, 3e
        int 21

        jmp menu_productos

;;; MENU VENTAS
menu_ventas:
    mov DX, offset titulo_venta
    mov AH, 09                              
    int 21
    mov DX, offset sub_ven
    mov AH, 09                              
    int 21

    ;; Opciones del menu de ventas
    mov DX, offset vent_ingresar
    mov AH, 09                              
    int 21
    mov DX, offset vent_regresar
    mov AH, 09                              
    int 21
    ;; Salto de linea
    mov DX, offset new_linea
    mov AH, 09
    int 21
    mov DX, offset prompt
    mov AH, 09
    int 21

    ;; Leer opcion
    mov AH, 08
    int 21

    ;; Si se presiona la I, se accede al menu registrar_venta
    cmp AL, 69 
    je registrar_ventas	

    ;; Si se presiona la R, se regresa al menu principal
    cmp AL, 72 
    je menu_principal	

    ;; Si no es ninguna de las opciones regresamos al menu de ventas
    jmp menu_ventas


    registrar_ventas:
        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21          

        mov DX, offset linea
        mov AH, 09
        int 21
        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21

        ;; Limpiamos el contador de itemas a 0
        mov DL, 0000
        mov [cont_items_venta], DL

        ;; Valor del monto total en 0.
        mov DX, 0000
        mov [num_monto_total], DX
        
        ;; Reestablecer el puntero de items
        mov DX, 0000
        mov [puntero_items], DX

        obtener_fecha:
            ;; Obtenemos la fcha actual - dia/mes/año
            mov AH, 2ah
            int 21

            ;; Guardamos la fcha en cada uno de los registros
            mov [dia_venta], DL
            mov [mes_venta], DH
            mov [anio_venta], CX

        obtener_hora:
            ;; Obtenemos la hora actual - HH/mm
            mov AH, 2ch
            int 21

            ;; Guardamos la fcha en cada uno de los registros
            mov [hora_venta], CH
            mov [minuto_venta], CL

        abrir_archivo_ventas:
            ;; Abrimos el archivo de ventas
            mov AL, 02
            mov AH, 3d
            mov DX, offset archivo_ventas
            int 21

            ;; Si no existe el archivo lo creamos
            jc  crear_archivo_ventas

            ;; Si existe el archivo guardamos el handle
            jmp guardar_handle_ventas

        crear_archivo_ventas:
            ;; Creamos el archivo de ventas
            mov CX, 0000
            mov DX, offset archivo_ventas
            mov ah, 3ch
            int 21
        
        guardar_handle_ventas:
            ;; Guardamos el handle del archivo de ventas
            mov [handle_ventas], AX
            mov BX, [handle_ventas]

            ;; Movemos el puntero en el archivo al final de este
            mov CX, 0000
            mov DX, 0000
            mov AL, 02h
            mov AH, 42h
            int 21

        solicitar_item:
            ;; Reiniciamos el puntero temporal
            mov DX, 0000
            mov [puntero_temp], DX

            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21 
            
            ;; Solicitamos el ingreso del codigo
            leer_codigo_venta:
                ;; Salto de linea
                mov DX, offset new_linea
                mov AH, 09
                int 21 
                mov DX, offset prompt_code
                mov AH, 09
                int 21 

                mov DX, offset buffer_entrada
                mov AH, 0ah
                int 21

                ;; Verificamos que la longitud del codigo este entre 1 y 4
                mov DI, offset buffer_entrada
                inc DI
                mov AL, [DI]
                cmp AL, 00
                je leer_codigo_venta
                cmp AL, 04h
                ja leer_codigo_venta

                ;; Verificamos si el codigo es la clave "fin"
                mov SI, offset terminar_venta
                mov DI, offset buffer_entrada
                inc DI                                              ; Saltar el primer byte
                mov CL, [DI]
                inc DI                                              ; Saltar el segundo byte
                call cadenas_iguales

                cmp DL, 0ff
                je finalizar_venta

                ;; Guardamos el codigo del producto en la estructura
                mov SI, offset codigo_venta_temp
                mov DI, offset buffer_entrada
                inc DI                                              ; Saltar el primer byte
                mov CH, 00
                mov CL, [DI]                                        ; Cantidad de bytes leidos
                inc DI                                              ; Saltar el segundo byte: Bytes leidos
                call copiar_variable

                ;; Abrimos el archivo de productos
                mov AL, 02              
                mov DX, offset archivo_prods
                mov AH, 3d
                int 21

                ;; Si no existe el archivo de productos no se puede realizar una venta por ende regresamos al menu ventas
                jc menu_ventas

                ;; Guardamos el handle del archivo de productos
                mov [handle_prods], AX

            ciclo_encontrar_producto_venta:
                ;; Posicionamos el puntero en el codigo de productos
                mov BX, [handle_prods]
                mov CX, 26h
                mov DX, offset codigo_venta
                mov AH, 3f
                int 21

                ;; Posicionamos el puntero en el precio de productos
                mov bx, [handle_prods]
                mov cx, 04h
                mov dx, offset num_precioVenta
                mov ah, 3f
                int 21h

                ;; Verificamos si ya se termino de leer el archivo
                cmp AX, 0000
                je finalizar_venta

                ;; Verificamos si el producto, es un producto valido
                mov AL, 00
                cmp [codigo_venta], AL
                je ciclo_encontrar_producto_venta

                ;; Verificamos el codigo temporal con el codigo ingresado

                mov DX, offset new_linea
                mov AH, 09
                int 21

                ; mov DX, offset codigo_venta_temp
                ; mov AH, 09
                ; int 21

                mov DX, offset codigo_venta
                mov AH, 09
                int 21

                mov SI, offset codigo_venta_temp
                mov DI, offset codigo_venta
                mov CX, 0005
                call cadenas_iguales
                
                cmp DL, 0ff

                ;; SI los codigos son iguales, ingresamos
                je verificar_stock

                ;; SI no son iguales, avanzamos al siguiente codigo
                jmp ciclo_encontrar_producto_venta

            verificar_stock:
                mov AX, [num_unidadesVenta]
                cmp AX, 0000
                jne leer_unidades_venta                 ; Ingresamos aqui, en caso AX no es igual a 0
                
                ;; Salto de linea
                mov DX, offset new_linea
                mov AH, 09
                int 21
                ;; Salto de linea
                mov DX, offset linea
                mov AH, 09
                int 21
                mov DX, offset no_existencias
                mov AH, 09
                int 21
                ;; Salto de linea
                mov DX, offset new_linea
                mov AH, 09
                int 21
                jmp solicitar_item

            ;; Pedimos las unidades
            leer_unidades_venta:
                ;; Salto de linea
                mov DX, offset new_linea
                mov AH, 09
                int 21
                mov DX, offset prompt_units
                mov AH, 09
                int 21

                ;; Leemos las unidades del producto
                mov DX, offset buffer_entrada
                mov AH, 0a
                int 21

                ;; verificamos la longitud de las unidades, entre 1 y 5
                mov DI, offset buffer_entrada
                inc DI
                mov AL, [DI]
                cmp AL, 00
                je leer_unidades_venta
                cmp AL, 05
                ja leer_unidades_venta

                ;; Guardamos las unidades del producto ingresado
                mov SI, offset unidades_venta
                mov DI, offset buffer_entrada
                inc DI                                                  ; Saltar el primer byte
                mov CH, 00
                mov CL, [DI]                                            ; Cantidad de bytes leidos
                inc DI                                                  ; Saltar el segundo byte: Bytes leidos
                call copiar_variable

                ;; Convertimos las unidades a numero
                mov DI, offset num_cantidad
                call cadenaAnum
                mov [num_unidadesVenta], AX

                ;; Limpiamos la variable de las unidades
                mov DI, offset num_cantidad
                mov CX, 0005
                call memset

        verificar_existencias_disponibles:
            mov AX, [num_cantidad]
            cmp AX, [num_unidadesVenta]
            jl sin_existencias_disponibles
            jmp ubicar_producto
        
        sin_existencias_disponibles:
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            mov DX, offset no_existencias
            mov AH, 09
            int 21
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            jmp solicitar_item

        ubicar_producto:
            mov AL, 02
            mov DX, offset archivo_prods
            mov AH, 3d
            int 21
            mov [handle_prods], AX

            ciclo_ubicar_producto:
                mov BX, [handle_prods]
                mov CX, 26
                mov DX, offset codigo_venta
                mov AH, 3f
                int 21

                ;; Posicionamos el puntero en el precio del producto
                mov BX, [handle_prods]
                mov CX, 04
                mov DX, offset num_precioVenta
                mov AH, 3f
                int 21

                ;; Determinar si se termino de leer el archivo
                cmp AX, 0000
                je finalizar_venta

                ;; Operaciones con el puntero temporal
                mov DX, [puntero_temp]
                add DX, 2a
                mov [puntero_temp], DX

                ;; Verificamos si el producto es un producto valido
                mov AL, 00
                cmp [codigo_venta], AL
                je ciclo_ubicar_producto

                ;; Verificamos los codigos, con el codigo ingresado
                mov SI, offset codigo_venta_temp
                mov DI, offset codigo_venta
                mov CX, 0005
                call cadenas_iguales
                cmp DL, 0ff

                je restar_existencias_producto
                jmp ciclo_ubicar_producto
        
        restar_existencias_producto:
            ;; Posicionamos puntero para la interrupcion
            mov DX, [puntero_temp]
            sub DX, 2a
            mov CX, 0000
            
            ;; Avanzamos con el puntero
            mov BX, [handle_prods]
            mov AL, 00
            mov AH, 42
            int 21

            ;; Restar la cantidad de unidades vendidas ingresadas
            mov AX, [num_unidadesVenta]
            sub AX, [num_cantidad]
            mov [num_unidadesVenta], AX

            ;; Escribimos el nuevo contenido con las unidades restadas
            mov CX, 2a
            mov DX, offset codigo_venta
            mov AH, 40h
            int 21

            ;; Cerramos el archivo
            mov BX, [handle_prods]
            mov AH, 3e
            int 21

        calcular_nuevo_monto:
            ;; Multiplicamos los precios por las unidades para obtener el monto
            mov AX, [num_precioVenta]
            mul num_unidadesVenta                                        ; ax = ax * numeroUnidadesVenta
            mov [num_monto], AX

            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21

            ;; Hacemos la suma al monto total
            mov DI, [num_monto]
            add [num_monto_total], DI

            mov AX, [num_monto_total]
            call numAcadena
            
            ;; Imprimimos en consola el monto total actuak
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21

            mov BX, 0001
            mov CX, 0005
            mov DX, offset numero
            mov AH, 40
            int 21

            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21

            jmp escribir_nuevo_item

        escribir_nuevo_item:

            ;; Guardar el item en memoria y obtenemos la cantidad de bytes por cada item
            ;; BytesPorItem * contadorItemsVenta
            mov AH, 0000h
            mov AL, 7h
            mov BH, 0000
            mov BL, [cont_items_venta]
            mul BX
            mov [puntero_items], AX
            
            ;; 1. Obtenemos la direccion para escribir el item
            mov CX, offset bytes_items                              ; direccionItem = offset bytesItems + punteroItems
            mov BX, [puntero_items]
            add CX, BX
            mov [direccion_item], CX

            ;; 2. Copiamos el codigo del item
            mov SI, [direccion_item]
            mov DI, offset codigo_venta_temp
            mov CH, 00
            mov CL, 0005
            copiar_codigo_item:
                mov AL, [DI]
                mov [SI], AL
                inc SI
                inc DI
                loop copiar_codigo_item
            
            ;; 3. Copiamos las unidades del item
            mov DI, offset num_cantidad
            mov CH, 00
            mov CL, 0004
            copiar_unidades_item:
                mov AL, [DI]
                mov [si], AL
                inc SI
                inc DI
                loop copiar_unidades_item

            ;; Limpiamos las variables de la descripcion y codigo
            mov DI, offset codigo_venta
            mov CX, 0026
            call memset

            ;; Limpiar la variable unidadesVenta
            mov DI, offset unidades_venta
            mov CX, 0005
            call memset

            ;; Limpiamos la variable de las unidades de la venta (num_unidadesVenta
            mov DX, 0000
            mov [num_unidadesVenta], DX

            ;; Limpiamos la variable del monto
            mov DX, 0000
            mov [num_monto], DX      

            ;; Incrementamos y comparamos el numero de items agregados actualmente (10 es el maximo)
            
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            
            mov DL, cont_items_venta
            cmp DL, 0009
            je finalizar_venta

            inc DL
            mov [cont_items_venta], DL
            jmp solicitar_item

        finalizar_venta:
            ;; Cerramos el archivo de productos
            mov BX, [handle_prods]
            mov AH, 3eh
            int 21

            ;; Escribimos la fecha y la hora en el archivo de ventas 
            mov BX, [handle_ventas]
            mov CX, 06h
            mov DX, offset dia_venta
            mov AH, 40
            int 21

            ;; Escribimos los items
            mov BX, [handle_ventas]
            mov CX, 46
            mov DX, offset bytes_items
            mov AH, 40
            int 21

            ;; Escribimos el monto total de la venta
            mov BX, [handle_ventas]
            mov CX, 0002
            mov DX, offset num_monto_total
            mov AH, 40
            int 21

            ;; Limpiamos la variable de la direccion del item
            mov DX, 0000
            mov [direccion_item], DX

            ;; Limpiamos la variable de los bytes_items
            mov DI, offset bytes_items
            mov CX, 0046
            call memset

            ;; Cerramos el archivo de ventas
            mov BX, [handle_ventas]
            mov AH, 3e
            int 21

        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        mov DX, offset linea
        mov AH, 09
        int 21
        ;; Salto de linea
        mov DX, offset new_linea
        mov AH, 09
        int 21
        jmp menu_ventas

;;; MENU HERRAMIENTAS
menu_herramientas:
    mov DX, offset titulo_herramientas
    mov AH, 09                              
    int 21
    mov DX, offset sub_her
    mov AH, 09                              
    int 21

    ;; OPciones del menu
    mov DX, offset reporte_ventas
    mov AH, 09                              
    int 21
    mov DX, offset reporte_catalogo
    mov AH, 09                              
    int 21
    mov DX, offset reporte_alfabetico
    mov AH, 09                              
    int 21
    mov DX, offset reporte_sin_existencias
    mov AH, 09                              
    int 21
    mov DX, offset vent_regresar
    mov AH, 09                              
    int 21

    ;; Leer opcion
    mov AH, 08
    int 21

    mov DX, offset new_linea
    mov AH, 09                              
    int 21

    ;; OPCION
    mov DX, offset prompt
    mov AH, 09                              
    int 21

    ;; Comparamos el valor ingresado con V, para generar el reporte de ventas
    cmp AL, 76 ;;; -> 76 = v  
    je reporte_de_ventas
    
    ;; Comparamos el valor ingresado con p, para generar el reporte de productos sin existencias 
    cmp AL, 70 ;;; -> 70 = P
    je reporte_productos_sin_existencias
    
    ;; Comparamos el valor ingresado con C, para generar el reporte del catalogo completo
    cmp AL, 63 ;;; -> 63 = c  
    je reporte_productos_catalogo_completo
    
    ;; Comparamos el valor ingresado con a, para generar el reporte de productos alfabetico
    cmp AL, 61 ;;; -> 62 = a
    je reporte_productos_alfabetico

    ;; Comparamos el valor ingresado con R, para regresar al menu principal
    cmp AL, 72 ;;; -> 72 = M  
    je menu_principal
    
    reporte_de_ventas:
        call generar_reporte_ventas
    
    reporte_productos_sin_existencias:
        call generar_reporte_sin_existencias

    reporte_productos_catalogo_completo:
        call generar_catalogo_completo

    reporte_productos_alfabetico:
        call generar_reporte_alfabetico
                                            ;;SUBRUTINAS;;    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;;;;;;;;;;          Subrutina numAcadena          ;;;;;;;;;;
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

;;;;;;;;;;          generar_reporte_ventas         ;;;;;;;;;;
;; ENTRADAS
;; SALIDAS
generar_reporte_ventas:
    ;; Salto de linea
    mov DX, offset new_linea
    mov AH, 09
    int 21
    mov DX, offset linea
    mov AH, 09
    int 21
    ;; Salto de linea
    mov DX, offset new_linea
    mov AH, 09
    int 21

    ;; Creamos el archivo para el registro de ventas
    mov CX, 0000
    mov DX, offset pgReporteVentas
    mov AH, 3c
    int 21

    ;; Guardar el handle del archivo reporte
    mov [handle_reporte], AX
    mov BX, [handle_reporte]

    ;; Escribimos la fecha y hora en el reporte
    call escribir_fecha_hora_reporte_txt

    ;; Escribimos el separador de las secciones
    mov CX, separadorSize
    dec CX
    mov DX, offset separador
    mov AH, 40
    int 21

    ;; Seccion 1: Ultimas 5 ventas
    mov CX, txtUltimasVentasSize
    mov DX, offset txtUltimasVentas
    mov AH, 40
    int 21

    ;; Escribir nueva linea divisoria
    mov CX, 2h
    mov DX, offset nuevaLinea
    mov AH, 40
    int 21

    ;; Abrimos el archivo de ventas y extraer datos de ahi
    mov CX, 0000
    mov DX, offset archivo_ventas
    mov AL, 02
    mov AH, 3d
    int 21

    ;; Guardamos el handle del archivo ventas
    mov [handle_ventas], AX
    mov BX, [handle_ventas]

    ;; Reiniciamos el contador de ventas
    mov AX, 0000
    mov [cantidadVentas], AX

    ;; Leemos el archivo de ventas
    ;; 1. Guardamos los datos de la venta con mayor costo y menor costo
    ciclo_1_ventas:
        ;; Posicionamos el puntero en la fecha de la venta	
        mov BX, [handle_ventas]
        mov CX, 6h
        mov DX, offset dia_venta
        mov AH, 3f
        int 21

        ;; Posicionamos el puntero en los bytes de los items
        mov BX, [handle_ventas]
        mov CX, 46
        mov DX, offset bytes_items
        mov AH, 3f
        int 21

        ;; Puntero en el total de la venta
        mov BX, [handle_ventas]
        mov CX, 2h
        mov DX, offset num_monto_total
        mov AH, 3f
        int 21

        ;; Verificamos si se termino de leer el archivo
        cmp AX, 0000
        je ciclo_1_ventas_fin

        ;; Aumentar el contador de las ventas
        mov AX, [cantidadVentas]
        inc AX
        mov [cantidadVentas], AX

        ;; Determinamos si se esta en la primera venta
        cmp AX, 0001
        je primera_venta_obtenida

        ;; Se verifica si es la venta con mayor monto
        comparacion_venta_mayor:
            mov AX, [num_monto_total]
            cmp AX, [num_monto_mayor]
            jg venta_mayor_obtenida

        ;; Se determina si es la venta con el menor monto
        comparacion_venta_menor:
            mov AX, [num_monto_total]
            cmp AX, [num_monto_menor]
            jl venta_menor_obtenida
        
        ;; Avanzamos
        jmp ciclo_1_ventas_continuar

        primera_venta_obtenida:
            mov AX, [num_monto_total]
            mov [num_monto_mayor], AX
            
            mov SI, offset fecha_mayor
            mov DI, offset dia_venta
            mov CX, 6h
            call copiar_variable

            mov SI, offset fecha_menor
            mov DI, offset dia_venta
            mov CX, 6h
            call copiar_variable

            mov AX, [num_monto_total]
            mov [num_monto_menor], AX
            jmp ciclo_1_ventas_continuar
        
        ;; Si es la venta mayor, guardamos los datos
        venta_mayor_obtenida:
            mov SI, offset fecha_mayor
            mov DI, offset dia_venta
            mov CX, 6h
            call copiar_variable

            mov AX, [num_monto_total]
            mov [num_monto_mayor], AX

            jmp comparacion_venta_menor

        ;; Si es la venta menor, guardamos los datos
        venta_menor_obtenida:
            mov SI, offset fecha_menor
            mov DI, offset dia_venta
            mov CX, 6h
            call copiar_variable

            mov AX, [num_monto_total]
            mov [num_monto_menor], AX

            jmp ciclo_1_ventas_continuar
        
        ;; Leer el siguiente registro
        ciclo_1_ventas_continuar:
            jmp ciclo_1_ventas
        
    ciclo_1_ventas_fin:

    ;; Determinamos la cantidad de ventas a mostrar en el reporte
    
    ;; 1. Si hay de 1 a 5 ventas se muestran todas
    mov AX, [cantidadVentas]
    cmp AX, 0005
    jle offset_todas_las_ventas

    ;; 2. Si hay mas de 5 ventas solo mostramos las ultimas 5
    jmp offset_ultimas_ventas

    offset_todas_las_ventas:
        mov AX, 0000h
        mov [offsetReporteVentas], AX
        jmp mostrar_ventas

    offset_ultimas_ventas:
        ;; Calculamos el offset para mostrar las ultimas 5 ventas       CantidadDeVentas - 5
        mov AX, [cantidadVentas]
        sub AX, 0005
        mov [offsetReporteVentas], AX
        
        ;; 2. Multiplicamos por el tamaño de cada venta
        mov AX, [offsetReporteVentas]
        mov BX, 4Eh
        mul BX
        mov [offsetReporteVentas], AX

        jmp mostrar_ventas

    mostrar_ventas:
        ;; Movemos el puntero del archivo con la posicion calculada
        mov AL, 00h
        mov BX, [handle_ventas]
        mov CX, [offsetReporteVentas]
        mov DX, 0000
        mov AH, 42
        int 21

        ciclo_mostrar_ventas:
            ;; Posicionamos el puntero en la fecha de la venta	
            mov BX, [handle_ventas]
            mov CX, 6h
            mov DX, offset dia_venta
            mov AH, 3f
            int 21

            ;; Posicionamos el puntero en los bytes de las ventas
            mov BX, [handle_ventas]
            mov CX, 46h
            mov DX, offset bytes_items
            mov AH, 3f
            int 21

            ;; Posicionamos el Puntero en el total de la venta
            mov BX, [handle_ventas]
            mov CX, 2h
            mov DX, offset num_monto_total
            mov AH, 3f
            int 21

            ;; Determinamos si ya se finalizo de leer el archivo
            cmp AX, 0000
            je ciclo_mostrar_ventas_fin

            ;; Escribimos la VENTA en el archivo .TXT ;;
            ;; Escribimos el separador
            mov BX, [handle_reporte]
            mov CX, separadorSimpleSize
            mov DX, offset separadorSimple
            dec CX
            mov AH, 40
            int 21

            ;; 1. Escribimos la fecha de la venta
            reporte_ventas_escribir_fecha:
                call escribir_fecha_txt
            
            ;; 2. Escribimos el monto de la venta
            reporte_ventas_escribir_monto:
                mov CX, txtMontoSize
                mov DX, offset txtMonto
                mov AH, 40
                int 21

                ;; Convertimos el monto a numero
                mov AH, 00h
                mov AX, [num_monto_total]
                call numAcadena

                ;; Escribir el monto
                mov BX, [handle_reporte]
                mov CX, 05
                mov DX, offset numero
                mov AH, 40
                int 21

                ;; Escribir nueva linea
                mov CX, 2h
                mov DX, offset nuevaLinea
                mov AH, 40
                int 21
            
            ; Continuar con la siguiente venta
            jmp ciclo_mostrar_ventas

        ciclo_mostrar_ventas_fin:
            ;; Escribimos el separador
            mov BX, [handle_reporte]
            mov CX, separadorSize
            mov DX, offset separador
            dec CX
            mov AH, 40
            int 21

    escribir_venta_mayor:
        ;; Escribir la venta con el mayor monto
        mov BX, [handle_reporte]
        mov CX, txtMayorMontoSize
        mov DX, offset txtMayorMonto
        mov AH, 40
        int 21

        ;; Escribimos el monto
        mov CX, txtMontoSize
        mov DX, offset txtMonto
        mov AH, 40
        int 21

        ;; Convertir el monto a cadena
        mov AH, 00h
        mov AX, [num_monto_mayor]
        call numAcadena

        ;; Escribir el monto
        mov BX, [handle_reporte]
        mov CX, 05
        mov DX, offset numero
        mov AH, 40
        int 21

        ;; Escribimos nueva linea
        mov CX, 2h
        mov DX, offset nuevaLinea
        mov AH, 40
        int 21

        mov SI, offset dia_venta
        mov DI, offset fecha_mayor
        mov CX, 06
        call copiar_variable
        
        call escribir_fecha_txt
        
        ;; Escribir nueva linea
        mov CX, 2h
        mov DX, offset nuevaLinea
        mov AH, 40
        int 21

        ;; Escribimos el separador
        mov BX, [handle_reporte]
        mov CX, separadorSize
        mov DX, offset separador
        dec CX
        mov AH, 40
        int 21

    escribir_venta_menor:
        ;; Escribimos la venta con el mayor
        mov BX, [handle_reporte]
        mov CX, txtMenorMontoSize
        mov DX, offset txtMenorMonto
        mov AH, 40
        int 21

        ;; Escribimos el apartado del monto
        mov CX, txtMontoSize
        mov DX, offset txtMonto
        mov AH, 40
        int 21

        ;; Convertir el monto a cadena
        mov AH, 00h
        mov AX, [num_monto_menor]
        call numAcadena

        ;; Escribimos el monto
        mov BX, [handle_reporte]
        mov CX, 05h
        mov DX, offset numero
        mov AH, 40
        int 21

        ;; Escribir nueva linea
        mov CX, 2h
        mov DX, offset nuevaLinea
        mov AH, 40
        int 21

        mov SI, offset dia_venta
        mov DI, offset fecha_menor
        mov CX, 06h
        call copiar_variable
        
        call escribir_fecha_txt
        
        ;; Escribir nueva linea
        mov CX, 2h
        mov DX, offset nuevaLinea
        mov AH, 40
        int 21

        ;; EscribiMOS el separador
        mov BX, [handle_reporte]
        mov CX, separadorSize
        mov DX, offset separador
        dec CX
        mov AH, 40
        int 21

    call reiniciar_variables_ventas

    ;; Cerramos el archivo de reporte
    mov BX, [handle_reporte]
    mov AH, 3e
    int 21

    ;; Cerramos el archivo de ventas
    mov BX, [handle_ventas]
    mov AH, 3e
    int 21

    mov DX, offset mensaje_reportes
    mov AH, 09
    int 21

    jmp menu_herramientas

;;;;;;;;;;          generar_reporte_alfabetico         ;;;;;;;;;;
;; ENTRADAS
;; SALIDAS
generar_reporte_alfabetico:
    ;; Creamos el archivo
    mov AH, 3c
    mov CX, 0000
    mov DX, offset archivo_alfabetico
    int 21

    ;; Almacenamos el handle del reporte
    mov [handle_alfabetico], AX

    ;; Sintaxis y estructura de archivo HTML -> <!DOCTYPE html><html><head>" 
    mov BX, AX 
    mov AH, 40
    mov CH, 00  
    mov CL, [tam_encabezado_html]
    mov DX, offset encabezado_html
    int 21

    ;; Se escribe <title> Reporte </title>"
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_tit_Catalogo_html]
    mov DX, offset tit_Catalogo_html
    int 21

    ;; Se escribe <style>table { width: 100%; border-collapse: collapse; }" 
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_style_Table_html]
    mov DX, offset style_Table_html
    int 21

    ;; Se escribe "th, td {border: 1px solid black; padding: 8px; text-align: left;} </style>"
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_style_Th_html]
    mov DX, offset style_Th_html
    int 21

    ;; Se escribe el cierre_style
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_cierre_style]
    mov DX, offset cierre_style
    int 21

    ;; Se escribe "</head>"
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_cierre_head]
    mov DX, offset cierre_head
    int 21

    ;; Se escribe <h1>Reporte Alfabetico de Productos </h1>
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_body_Rep_alfa_html]
    mov DX, offset body_Rep_alfa_html
    int 21

    ;; Se apretura <table>
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_apertura_table]
    mov DX, offset apertura_table
    int 21

    ;; Se escribe una fila <tr> 
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_apertura_tr]
    mov DX, offset apertura_tr
    int 21

    ;; Se escribe una columna <th>Letra</th><th>Cantidad de Productos
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_titulos_alfa_html]
    mov DX, offset titulos_alfa_html
    int 21

    ;; Columna </th>
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, 05
    mov DX, offset cierre_th
    int 21

    ;; Fila </tr> 
    mov BX, [handle_alfabetico]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_cierre_tr]
    mov DX, offset cierre_tr
    int 21

    ;; Abrimos el archivo de productos
    mov AH, 3d
    mov AL, 02
    mov DX, offset archivo_prods
    int 21

    ;; Almacenamos el file handle
    mov [handle_prods], AX

    ciclo_mostrar_rep_alfabetico:
        ;; 1. Leer 26h bytes del archivo de productos
        mov BX, [handle_prods]
        mov CX, 26                                              ;; leer 26h bytes
        mov DX, offset cod_prod
        mov AH, 3f
        int 21

        ;; 2. Leer 4h bytes del archivo de productos
        mov BX, [handle_prods]
        mov CX, 0004
        mov DX, offset num_price
        mov AH, 3f
        int 21

        ;; 3. Verificar que no sea nulo, si es termina
        cmp AX, 00
        je escribir_letra_cantidad

        ;; 4. Ver si es producto válido
        mov AL, 00
        cmp [cod_prod], AL
        je ciclo_mostrar_rep_alfabetico

        ;; 5. Comparar el primer caracter del nombre con la letra actual
        mov SI, offset cod_name
        mov DI, offset letra_actual
        mov CX, 01h
        call cadenas_iguales
        cmp DL, 0ffh
        je incrementar_contador

        ;; 6. Si no es igual, repetimos el ciclo
        jmp ciclo_mostrar_rep_alfabetico

        ;; 7. Si es igual, incrementamos el contador
        incrementar_contador:
            mov AL, [contador]
            inc AL
            mov [contador], AL
            jmp ciclo_mostrar_rep_alfabetico

        jmp ciclo_mostrar_rep_alfabetico

    fin_rep_alfabetico:
        ;; Se escribe </table>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_table]
        mov DX, offset cierre_table
        int 21

        ;; Obtener la fecha 
        mov ah, 2a
        int 21
        mov [dia3], dl
        mov [mes3], dh
        mov [anio3], cx

        ;; Obtener la hora 
        mov ah, 2ch
        int 21h
        mov [hora3], ch
        mov [minutos3], cl

        ;; <p>Fecha</p>:
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_fecha_html]
        mov DX, offset fecha_html
        int 21

        ;; Escribimos el dia	
        mov AL, [dia3]
        mov AH, 00 
        call numAcadena 
        mov BX, [handle_alfabetico]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos el caracter "/"
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        ;; Escribimos el mes	
        mov AL, [mes3]
        mov AH, 00 
        call numAcadena
        mov BX, [handle_alfabetico]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos el caracter "/"
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        ;; Escribimos el anio	
        mov AX, [anio3]
        call numAcadena
        mov BX, [handle_alfabetico]
        mov CX, 04
        mov DX, offset numero
        inc dx
        mov AH, 40
        int 21

        ;; Etiqueta </p>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_p]
        mov DX, offset cierre_p
        int 21

        ;; Escribimos etiqueta <p>Hora:
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_hora_html]
        mov DX, offset hora_html
        int 21
        
        ;; Escribimos la hora	
        mov AL, [hora3]
        mov AH, 00 
        call numAcadena 
        mov BX, [handle_alfabetico]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos el caracter ":" 
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset dos_puntos
        int 21

        ;; Escribimos los minutos 	
        mov AL, [minutos3]
        mov AH, 00 
        call numAcadena 
        mov BX, [handle_alfabetico]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Etiqueta </body>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_body]
        mov DX, offset cierre_body
        int 21

        ;; Etiqueta </html>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_html]
        mov DX, offset cierre_html
        int 21

        ;; Cerramos el archivo
        mov AH, 3e
        int 21

        jmp menu_herramientas

    escribir_letra_cantidad:
        ;; Fila <tr> 
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_tr]
        mov DX, offset apertura_tr
        int 21
        
        ;; Columna <td> 
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_td]
        mov DX, offset apertura_td
        int 21

        ;; Escribimos la letra del alfabeto
        mov DX, offset letra_actual
        mov CX, 0001
        mov BX, [handle_alfabetico]
        mov AH, 40
        int 21

        ;; Columna </td>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_td]
        mov DX, offset cierre_td
        int 21

        ;; Columna <td> 
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_td]
        mov DX, offset apertura_td
        int 21

        ;; Escribimos la cantidad
        mov AL, [contador]
        cmp AL, 0000
        je escribir_variable_cero
        jmp convertir_variable

        escribir_variable_cero:
            mov al, 30h
            mov [numero], al
            mov al, 30h
            mov [numero + 1], al
            mov al, 30h
            mov [numero + 2], al
            mov al, 30h
            mov [numero + 3], al
            mov al, 30h
            mov [numero + 4], al
            jmp escribir_variable

        convertir_variable:
            ;; Convertimos el precio a cadena
            mov AL, [contador]
            mov AH, 00
            call numAcadena

        escribir_variable:
            ;; Escribimos el precio
            mov BX, [handle_alfabetico]
            mov CX, 02
            mov DX, offset numero
            inc DX
            inc DX 
            inc DX
            mov AH, 40
            int 21

        ;; Columna </td>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_td]
        mov DX, offset cierre_td
        int 21

        ;; Fila </tr>
        mov BX, [handle_alfabetico]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_tr]
        mov DX, offset cierre_tr
        int 21

        ;; Comparamos que la letra actual sea menor o igual a Z 
        cmp letra_actual, 7A                                                ;7A = Z  
        jb menor_igual 

        jmp fin_rep_alfabetico

    menor_igual:
        inc letra_actual  
                                                        ; incrementa la letra actual en 1 A,B... 
        ;; Inicializamos el contador en 0
        mov contador, 00 
        
        ;; Reiniciamos el puntero de productos
        mov al, 00h
        mov bx, [handle_prods]
        mov cx, 00h
        mov dx, 00h
        mov ah, 42h
        int 21h

        ;; Ciclo para cambiar la letra e ir avanzando
        jmp ciclo_mostrar_rep_alfabetico

        ret

;;;;;;;;;;          Subrutina generar_reporte_catalogo         ;;;;;;;;;;
;; ENTRADAS
;; SALIDAS
generar_catalogo_completo: 
	mov AH, 3c
	mov CX, 0000
	mov DX, offset archivo_catalogo
	int 21

	;; Guardamos el handle   
	mov [handle_catalogo], AX

	;; Escribimos <!DOCTYPE html><html><head>" 
	mov BX, AX 
	mov AH, 40
	mov CH, 00 
	mov CL, [tam_encabezado_html]
	mov DX, offset encabezado_html
	int 21

	;; Escribimos <title>Catalogo</title>"
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_tit_Catalogo_html]
	mov DX, offset tit_Catalogo_html
	int 21

	;;Escribimos <style>table { width: 100%; border-collapse: collapse; }" 
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_style_Table_html]
	mov DX, offset style_Table_html
	int 21

	;;Escribimos "th, td {border: 1px solid black; padding: 8px; text-align: left;} </style>"
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_style_Th_html]
	mov DX, offset style_Th_html
	int 21

	;; Escribimos el cierre del style
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_cierre_style]
	mov DX, offset cierre_style
	int 21

	;; Escribimos "</head>"
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_cierre_head]
	mov DX, offset cierre_head
	int 21

	;; Escribimos "<body><h1>Catalogo Completo de Productos</h1>"
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_body_Cataologo_html]
	mov DX, offset body_Cataologo_html
	int 21

	;; Escribimos y abrimos <table>
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_apertura_table]
	mov DX, offset apertura_table
	int 21

	;; Escribimos fila <tr>
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_apertura_tr]
	mov DX, offset apertura_tr
	int 21

	;; Escribimos encabezados "<th>Descripción</th> <th>Código</th> <th>Precio</th> <th>Unidades"
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_titulos_html]
	mov DX, offset titulos_html
	int 21

	;; Escribimos columna </th>
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, 05
	mov DX, offset cierre_th
	int 21

	;; fila </tr> 
	mov BX, [handle_catalogo]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_cierre_tr]
	mov DX, offset cierre_tr
	int 21
	
	;; Abrimos el archivo de productos 
	mov AH, 3d
	mov AL, 02
	mov DX, offset archivo_prods
	int 21

	mov [handle_prods], AX

    ciclo_mostrar_catologo:

        ;; Leemos el archivo
        mov BX, [handle_prods]
        mov CX, 26
        mov DX, offset cod_prod
        mov AH, 3f
        int 21

        ;; puntero avanzó
        mov BX, [handle_prods]
        mov CX, 0004
        mov DX, offset num_price
        mov AH, 3f
        int 21

        ;; verificar que no sea nulo, si es termina 
        cmp AX, 00
        je fin_mostrar_catologo

        ;; Verificamos que el producto sea un produto valido
        mov AL, 00
        cmp [cod_prod], AL
        je ciclo_mostrar_catologo

        call imprimir_estructura_html

        jmp ciclo_mostrar_catologo
        

    fin_mostrar_catologo:

        ;; Ecribimos </table>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_table]
        mov DX, offset cierre_table
        int 21

        ;; Obtener la fecha 
        mov AH, 2a
        int 21
        mov [dia2], DL
        mov [mes2], DH
        mov [anio2], CX

        ;; Obtener la hora 
        mov AH, 2ch
        int 21
        mov [hora2], CH
        mov [minutos2], CL

        ;; <p>Fecha</p>:
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_fecha_html]
        mov DX, offset fecha_html
        int 21

        ;; Escribimos el dia	
        mov AL, [dia2]
        mov AH, 00 
        call numAcadena 
        mov BX, [handle_catalogo]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos el caracter "/"
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        ;; Escribimos el mes	
        mov AL, [mes2]
        mov AH, 00 
        call numAcadena
        mov BX, [handle_catalogo]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos el caracter "/"
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        ;; Escribimos el anio	
        mov AX, [anio2]
        call numAcadena
        mov BX, [handle_catalogo]
        mov CX, 04
        mov DX, offset numero
        inc dx
        mov AH, 40
        int 21

        ;; Etiqueta </p>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_p]
        mov DX, offset cierre_p
        int 21

        ;; Escribimos etiqueta <p>Hora:
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_hora_html]
        mov DX, offset hora_html
        int 21
        
        ;; Escribimos la hora	
        mov AL, [hora2]
        mov AH, 00 
        call numAcadena 
        mov BX, [handle_catalogo]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos el caracter ":" 
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset dos_puntos
        int 21

        ;; Escribimos los minutos 	
        mov AL, [minutos2]
        mov AH, 00 
        call numAcadena 
        mov BX, [handle_catalogo]
        mov CX, 02
        mov DX, offset numero
        inc dx
        inc dx 
        inc dx
        mov AH, 40
        int 21

        ;; Escribimos </body>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_body]
        mov DX, offset cierre_body
        int 21

        ;; Escribimos </html>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_html]
        mov DX, offset cierre_html
        int 21

        ;; Cerramos el archivo
        mov AH, 3e
        int 21

        jmp menu_herramientas

    imprimir_estructura_html:
        ;; Escribimos fila <tr> 
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_tr]
        mov DX, offset apertura_tr
        int 21

        ;; Escribimos <td> 
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_td]
        mov DX, offset apertura_td
        int 21

        mov DX, offset cod_prod

        ;; Inicializamos el contador en 0 
        mov SI, 0000

    ciclo_escribir_codigo:
        mov DI, DX
        mov AL, [DI]

        ;; Si es nulo, accede a escribir la descripcion 
        cmp AL, 00
        je escribir_descripcion

        ;;v Si no es nuelo, y esta en el ragno accede a escribir descripcion
        cmp SI, 0006
        je escribir_descripcion

        mov CX, 0001
        mov BX, [handle_catalogo]
        mov AH, 40
        int 21

        inc DX 
        inc SI 

        jmp ciclo_escribir_codigo

    escribir_descripcion:
        ;; Escribimos columna </td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_td]
        mov DX, offset cierre_td
        int 21

        ;; Columna <td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_td]
        mov DX, offset apertura_td
        int 21
    
        mov DX, offset cod_name
        mov SI, 0000

    ciclo_escribir_descripcion:

        mov DI, DX
        mov AL, [DI]

        ;; Si es nulo 
        cmp AL, 00
        je escribir_precio

        ;; Si esta lleno
        cmp SI, 0021
        je escribir_precio
    
        mov CX, 0001
        mov BX, [handle_catalogo]
        mov AH, 40
        int 21

        inc DX  
        inc SI 
        jmp ciclo_escribir_descripcion

    escribir_precio:
        ;; Columna </td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_td]
        mov DX, offset cierre_td
        int 21

        ;; Columna <td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_td]
        mov DX, offset apertura_td
        int 21

        mov AX, [num_price]
        call numAcadena

        mov DX, offset numero
        mov SI, 0000

    ciclo_escribir_precio: 

        mov DI, DX
        mov AL, [DI]

        ;; Si es nulo
        cmp AL, 00
        je escribir_unidades

        ;; Si no es nulo 
        cmp SI, 0006
        je escribir_unidades
    
        mov CX, 0001
        mov BX, [handle_catalogo]
        mov AH, 40
        int 21

        inc DX 
        inc SI 
        jmp ciclo_escribir_precio

    escribir_unidades:
        ;; Columna </td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_td]
        mov DX, offset cierre_td
        int 21

        ;; Columna <td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_apertura_td]
        mov DX, offset apertura_td
        int 21

        mov AX, [num_units]
        call numAcadena

        mov DX, offset numero
        mov SI, 0000

    ciclo_escribir_unidades:
        mov DI, DX
        mov AL, [DI]

        ;; Si es nulo 
        cmp AL, 00
        je cerrar_table

        ;; Si no es nulo
        cmp SI, 0006
        je cerrar_table
    
        mov CX, 0001
        mov BX, [handle_catalogo]
        mov AH, 40
        int 21

        inc DX 
        inc SI 
        jmp ciclo_escribir_unidades

    cerrar_table:
        ;; Columna </td>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_td]
        mov DX, offset cierre_td
        int 21

        ;; Fila </tr>
        mov BX, [handle_catalogo]
        mov AH, 40
        mov CH, 00
        mov CL, [tam_cierre_tr]
        mov DX, offset cierre_tr
        int 21

        ret

;;;;;;;;;;          Subrutina generar_reporte_sin_existencias         ;;;;;;;;;;
;; ENTRADAS
;; SALIDAS
generar_reporte_sin_existencias:

    mov AH, 3c
    mov CX, 0000
    mov DX, offset nombre_rep_existencias
    int 21
    ;; el file handle se almacena en Ax 
    mov [handle_existencias], AX

    ;; Escribimos <!DOCTYPE html><html><head>" 
    mov BX, AX  
    mov AH, 40
    mov CH, 00  
    mov CL, [tam_encabezado_html]
    mov DX, offset encabezado_html
    int 21

    ;; Escribimos <title>Catalogo</title>"
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_tit_Catalogo_html]
    mov DX, offset tit_Catalogo_html
    int 21

    ;; Escribimos <style>table { width: 100%; border-collapse: collapse; }" 
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_style_Table_html]
    mov DX, offset style_Table_html
    int 21

    ;; Escribimos "th, td {border: 1px solid black; padding: 8px; text-align: left;} </style>"
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_style_Th_html]
    mov DX, offset style_Th_html
    int 21

    ;; Escribimos y cerramos cierre_style
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_cierre_style]
    mov DX, offset cierre_style
    int 21

    ;; Escribimos"</head>"
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_cierre_head]
    mov DX, offset cierre_head
    int 21

    ;; Escribimos "<body><h1>Catalogo Completo de Productos</h1>"
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_body_exist_html]
    mov DX, offset body_exist_html
    int 21

    ;; Escribimos y generamos <table>
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_apertura_table]
    mov DX, offset apertura_table
    int 21

    ;; Fila <tr> 
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_apertura_tr]
    mov DX, offset apertura_tr
    int 21

    ;; Escribimos "<th>Descripción</th> <th>Código</th> <th>Precio</th> <th>Unidades"
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_titulos_html]
    mov DX, offset titulos_existencias_html
    int 21

    ;; Columna</th>
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, 05
    mov DX, offset cierre_th
    int 21

    ;; Fila </tr> 
    mov BX, [handle_existencias]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_cierre_tr]
    mov DX, offset cierre_tr
    int 21
     
    mov AH, 3d
    mov AL, 02
    mov DX, offset archivo_prods
    int 21

    mov [handle_prods], AX

        ciclo_mostrar_existentes:
            ;; Leeos el archivo
            mov BX, [handle_prods]
            mov CX, 26
            mov DX, offset cod_prod
            mov AH, 3f
            int 21

            ;; puntero avanzó
            mov BX, [handle_prods]
            mov CX, 0004
            mov DX, offset num_price
            mov AH, 3f
            int 21

            ;; Si es nulo 
            cmp AX, 0000
            je fin_mostrar_existentes

            ;; Si no es nulo
            mov AL, 00
            cmp [cod_prod], AL

            je ciclo_mostrar_existentes						

            ;; Nos posicionamos en la descripcion		
            mov DI, offset cod_name
            mov AX, [num_units]
            cmp AX, 0000

            je ir_a_imprimir_esctructura_html			

            jmp ciclo_mostrar_existentes

        ir_a_imprimir_esctructura_html:
            
            call imprimir_estructura_html_existencias
            
        fin_mostrar_existentes:
            ;; Escribimos </table>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_table]
            mov DX, offset cierre_table
            int 21

            ;; Escribimos </body>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_body]
            mov DX, offset cierre_body
            int 21

            ;; </html>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_html]
            mov DX, offset cierre_html
            int 21

            ;; CLOSE A FILE WITH HANDLE
            mov AH, 3e
            int 21

            jmp menu_herramientas

        imprimir_estructura_html_existencias:
            ;; Fila <tr> 
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_apertura_tr]
            mov DX, offset apertura_tr
            int 21

            ;; Columna <td> 
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_apertura_td]
            mov DX, offset apertura_td
            int 21

            ;;dx toma el valor del codigo 
            mov DX, offset cod_prod

            ;;Inicializamos el contador
            mov SI, 0000

        ciclo_escribir_codigo_existencias:
            mov DI, DX
            mov AL, [DI]

            ;; Si es nulo
            cmp AL, 00
            je escribir_descripcion_existencias
            
            ;; Si no es nulo 
            cmp SI, 0006
            je escribir_descripcion_existencias
 
            mov CX, 0001
            mov BX, [handle_existencias]
            mov AH, 40
            int 21

            inc DX 
            inc SI 

            jmp ciclo_escribir_codigo_existencias

        escribir_descripcion_existencias:
            ;; Columna </td>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_td]
            mov DX, offset cierre_td
            int 21

            ;; Columna <td>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_apertura_td]
            mov DX, offset apertura_td
            int 21

            mov DX, offset cod_name
            mov SI, 0000

        ciclo_escribir_descripcion_existencias:
            mov DI, DX
            mov AL, [DI]

            ;; Si es nulo 
            cmp AL, 00
            je escribir_precio_existencias

            ;; Si no es nulo 
            cmp SI, 0021
            je escribir_precio_existencias

            ;; Escribimos 
            mov CX, 0001
            mov BX, [handle_existencias]
            mov AH, 40
            int 21

            inc DX   
            inc SI   
            jmp ciclo_escribir_descripcion_existencias

        escribir_precio_existencias:
            ;; Columna </td>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_td]
            mov DX, offset cierre_td
            int 21

            ;; Columna <td>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_apertura_td]
            mov DX, offset apertura_td
            int 21

            mov AX, [num_price]
            call numAcadena

            mov DX, offset numero
            mov SI, 0000

        ciclo_escribir_precio_existencias:: 
            mov DI, DX
            mov AL, [DI]

            ;; Si es nulo 
            cmp AL, 00
            je cerrar_table

            ;; Si no es nulo 
            cmp SI, 0006
            je cerrar_table

            ;; Escribimos en el archivio 
            mov CX, 0001
            mov BX, [handle_existencias]
            mov AH, 40
            int 21

            inc DX   
            inc SI   
            jmp ciclo_escribir_precio_existencias

        cerrar_table_existencias:
            ;; Columna </td>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_td]
            mov DX, offset cierre_td
            int 21

            ;; Fila </tr>
            mov BX, [handle_existencias]
            mov AH, 40
            mov CH, 00
            mov CL, [tam_cierre_tr]
            mov DX, offset cierre_tr
            int 21

            ret


;;;;;;;;;;          Subrutina escribir_fecha_hora_reporte_txt         ;;;;;;;;;;
;; ENTRADAS
;;          o [handle_reporte]: es el handle del archivo de reportes
;; SALIDAS
;;          o Escribe la hora y la fecha
escribir_fecha_hora_reporte_txt:
    ;; Escribimos la fecha
    escribir_fecha_reporte_txt:
        ;; Escribimos el campo de la fecha
        mov BX, [handle_reporte]
        mov CX, txtFechaSize
        mov DX, offset txtFecha
        mov AH, 40
        int 21

        ;; Obtenemos la fecha
        mov AH, 2ah
        int 21

        ;; Guardamos la fecha en memoria
        mov [dia_actual], DL
        mov [mes_actual], DH
        mov [anio_actual], CX

        ;; Convertimos el dia a cadena
        mov AH, 00h
        mov AL, [dia_actual]
        call numAcadena
        
        ;; Escribimos el dia
        mov BX, [handle_reporte]
        mov CX, 02h
        mov DX, offset numero
        inc DX
        inc DX
        inc DX
        mov AH, 40
        int 21

        ;; Escribimos el separador
        mov BX, [handle_reporte]
        mov CX, 01h
        mov DX, offset separadorFecha
        mov AH, 40
        int 21

        ;; Convertimos el mes a cadena
        mov AH, 00h
        mov AL, [mes_actual]
        call numAcadena

        ;; Escribimos el mes
        mov BX, [handle_reporte]
        mov CX, 02h
        mov DX, offset numero
        inc DX
        inc DX
        inc DX
        mov AH, 40
        int 21

        ;; Escribimos el separador
        mov BX, [handle_reporte]
        mov CX, 01h
        mov DX, offset separadorFecha
        mov AH, 40
        int 21

        ;; Convertimos el año
        mov AH, 00h
        mov AX, [anio_actual]
        call numAcadena

        ;; Escribimos el año
        mov BX, [handle_reporte]
        mov CX, 04h
        mov DX, offset numero
        inc DX
        mov AH, 40
        int 21

        ;; Escribir espacio en blanco
        mov BX, [handle_reporte]
        mov CX, 01h
        mov DX, offset espacioBlanco
        mov AH, 40
        int 21

    ;; EscribiMOS la hora actual
    escribir_hora_reporte_txt:
        call convertir_hora_ascii
        
        ; Escribir la hora
        mov BX, [handle_reporte]
        mov CX, 8
        mov DX, offset hora_actual
        mov AH, 40
        int 21

        ;; Escribimos nueva linea
        mov BX, [handle_reporte]
        mov CX, 02h
        mov DX, offset nuevaLinea
        mov AH, 40
        int 21

    ret


;;;;;;;;;;          Subrutina convertir_hora_ascii         ;;;;;;;;;;
;; ENTRADAS
;; SALIDAS
convertir_hora_ascii:
    mov AH, 2ch
    int 21
    mov AL, CH

    mov BH, 0
    mov BL, 0
    decenas_1:
        cmp AL, 0ah
        jl unidades_1
        sub AL, 0ah
        inc BH
        jmp decenas_1
    unidades_1:
        mov BL, AL
    add BH, 30h
    add BL, 30h

    mov [hora_actual], BH
    mov [hora_actual + 1], BL

    mov [hora_actual + 2], 3a                                       ; Dos puntos

    ;; Convertimos los minutos
    mov AL, CL
    mov BH, 0
    mov BL, 0
    decenas_2:
        cmp AL, 0ah
        jl unidades_2
        sub AL, 0ah
        inc BH
        jmp decenas_2
    unidades_2:
        mov BL, AL
    add BH, 30h
    add BL, 30h
    mov [hora_actual + 3], BH
    mov [hora_actual + 4], BL

    mov [hora_actual + 5], 3a                                       ; Dos puntos

    ;; Convertimos los segundos
    mov AL, DH
    mov BH, 0
    mov BL, 0
    decenas_3:
        cmp AL, 0ah
        jl unidades_3
        sub AL, 0ah
        inc BH
        jmp decenas_3
    unidades_3:
        mov BL, AL
    add BH, 30h
    add BL, 30h
    mov [hora_actual + 6], BH
    mov [hora_actual + 7], BL

    ret

;;;;;;;;;;          Subrutina escribir_fecha_txt         ;;;;;;;;;;
;; ENTRADAS
;;      o [dia_venta - minuto_venta]: es la informacion de fecha y hora
;; SALIDAS
;;      o escribe los caracteres de fecha con formato de fecha y hora
escribir_fecha_txt:
    ;; Escribimos apartado de fecha
    mov BX, [handle_reporte]
    mov CX, txtFechaSize
    mov DX, offset txtFecha
    mov AH, 40
    int 21

    ;; Convertimos el dia a cadena
    mov AH, 00h
    mov AL, [dia_venta]
    call numAcadena
    
    ;; Escribimos el dia
    mov BX, [handle_reporte]
    mov CX, 02h
    mov DX, offset numero
    inc DX
    inc DX
    inc DX
    mov AH, 40
    int 21

    ;; Escribimos el separador
    mov BX, [handle_reporte]
    mov CX, 01h
    mov DX, offset separadorFecha
    mov AH, 40
    int 21

    ;; Convertimos el mes
    mov AH, 00h
    mov AL, [mes_venta]
    call numAcadena

    ;; Escribir el mes
    mov BX, [handle_reporte]
    mov CX, 02h
    mov DX, offset numero
    inc DX
    inc DX
    inc DX
    mov AH, 40
    int 21

    ;; Escribimos el separador
    mov BX, [handle_reporte]
    mov CX, 01h
    mov DX, offset separadorFecha
    mov AH, 40
    int 21

    ;; Convertimos el año
    mov AH, 00h
    mov AX, [anio_venta]
    call numAcadena

    ;; Escribimos el año
    mov BX, [handle_reporte]
    mov CX, 04h
    mov DX, offset numero
    inc DX
    mov AH, 40
    int 21

    ;; Escribimos el espacio
    mov BX, [handle_reporte]
    mov CX, 01h
    mov DX, offset espacioBlanco
    mov AH, 40
    int 21

    ;; Convertimos la hora
    mov AH, 00h
    mov AL, [hora_venta]
    call numAcadena

    ;; Escribimos la hora
    mov BX, [handle_reporte]
    mov CX, 02h
    mov DX, offset numero
    inc DX
    inc DX
    inc DX
    mov AH, 40
    int 21

    ;; Escribimos la cadena ":"
    mov BX, [handle_reporte]
    mov CX, 01h
    mov DX, offset separadorHora
    mov AH, 40
    int 21

    ;; Convertimos el minuto
    mov AH, 00h
    mov AL, [minuto_venta]
    call numAcadena

    ; Escribir el minuto
    mov BX, [handle_reporte]
    mov CX, 02h
    mov DX, offset numero
    inc DX
    inc DX
    inc DX
    mov AH, 40
    int 21
    
    ;; Escribir nueva linea
    mov CX, 2h
    mov DX, offset nuevaLinea
    mov AH, 40
    int 21

    ret

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
    
terminar:
    mov AL, 0
    mov AH, 4c
    int 21

fin:
.EXIT
END

