.MODEL SMALL
.RADIX 16
.STACK
.DATA

;; Variable num, que almacenara los datos numericos
numero           db   05 dup (30)

;; Nueva linea
new_linea       db 0a, "$"

;; Variables Iniciales
mensajeInicial  db "San Carlos de Guatemala", 0ah, "Facultad de Ingenieria", 0ah, "Escuela de Vacaciones", 0ah, "Arquitectura de Computadoras y Ensambladores 1", 0ah, 0ah, "Nombre: Anthony Samuel Zea Herrera", 0ah,"Carne:  202104782", 0ah, "$"
menuInicial     db 0ah, "Bienvenido al sistema", 0ah, "- (V)entas", 0ah, "- (P)roductos", 0ah, "- (H)erramientas", 0ah, "$"

;; Prompts para pedir al usuario
prompt               db "Elija una opcion: ", 0ah, "$"
prompt_code          db "Codigo: ", "$"
prompt_name          db "Nombre: ", "$"
prompt_price         db "Precio: ", "$"
prompt_units         db "Unidades: ", "$"

;; Variables para acceso a menus
titulo_venta        db 0ah, "MENU VENTAS", 0ah, "$"
titulo_producto     db 0ah, "MENU PRODUCTOS", 0ah, "$"
titulo_herramientas db 0ah, "MENU HERRAMIENTAS", 0ah, "$"
titulo_prod         db 0ah, "Producto", 0ah, "$"

;; Variable temporal para opcion de menu
temp db 00, "$"

;; Subrayados
sub_ven     db "===========", 0a, "$"
sub_pro     db "==============", 0a, "$"
sub_her     db "=================", 0a, "$"
sub2_prod   db "========", 0a, "$"

;; Buffer de entrada
buffer_entrada   db  20, 00
                 db  20 dup (0)

;; Variables para productos
mostrar_prod   db "(M)ostrar producto", 0a, "$"
ingresar_prod  db "(I)ngresar producto", 0a, "$"
editar_prod    db "(E)ditar producto", 0a, "$"
borrar_prod    db "(B)orrar producto", 0a, "$"

prods_registrados db "Productos registrados:",0a,"$"

;; "Estructura producto"
cod_prod    db    05 dup (0)
cod_name    db    21 dup (0)
cod_price   db    05 dup (0)
cod_units   db    05 dup (0)

;; numéricos
num_price   dw    0000
num_units   dw    0000

;; Archivo PRODUCTOS
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000

.CODE
.STARTUP
;; CODIGO
inicio:
                mov AX, 7e7
		        call numAcadena
                mov BX, 01
		        mov CX, 0005
                mov DX, offset numero
                mov AH, 40
                int 21

                mov DX, offset new_linea
                mov AH, 09
                int 21

                ;; ENCABEZADO INICIAL
                mov DX, offset mensajeInicial
                mov AH, 09                              
                int 21                                  

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

        ;; Leer opcion
        mov AH, 08
		int 21

        ;; OPCION
        mov DX, offset prompt
        mov AH, 09                              
        int 21

        ;; Comparamos el valor ingresado con B, para borrar un producto
        cmp AL, 62 ;;; -> 62 = B  

        ;; Comparamos el valor ingresado con E, para editar un producto
        cmp AL, 65 ;;; -> 65 = E

        ;; Comparamos el valor ingresado con I, para insertar un producto
        cmp AL, 69 ;;; -> 69 = I
        je ingresar_producto_archivo

        ;; Comparamos el valor ingresado con M, para mostrar un producto
        cmp AL, 6d ;;; -> 65 = E
        je mostrar_productos_archivo

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
        cmp AL, 06
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
        mov CX, 26
        mov DX, offset cod_prod

        ;; Guardar producto en estructura
        mov AH, 3f
        int 21

        ;; El puntero avanzo
        mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21

        ;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
        cmp AX, 00

        ;; Verificamos si el archivo ya esta vacio
        je fin_mostrar

        ;; Producto en estructura
        call imprimir_estructura
        jmp ciclo_mostrar

fin_mostrar:
        jmp menu_productos

;;; MENU VENTAS
menu_ventas:
    mov DX, offset titulo_venta
    mov AH, 09                              
    int 21
    mov DX, offset sub_ven
    mov AH, 09                              
    int 21
    jmp fin

;;; MENU HERRAMIENTAS
menu_herramientas:
    mov DX, offset titulo_herramientas
    mov AH, 09                              
    int 21
    mov DX, offset sub_her
    mov AH, 09                              
    int 21
    jmp fin
                                            ;;SUBRUTINAS;;    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;          Subrutina imprimir Estructura         ;;;;;;;;;;
;; ENTRADAS:
;; SALIDAS:
;;          o Impresion de estructura
imprimir_estructura:
    mov DI, offset cod_name
ciclo_poner_dolar_1:
        mov AL, [DI]
        cmp AL, 00
        je poner_dolar_1
        inc DI
        jmp ciclo_poner_dolar_1
poner_dolar_1:
            mov AL, 24          ; -> 24 = dolar ($)
            mov [DI], AL

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
		;;
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
;;        o DI -> Direccion a una cadena
;; SALIDAS
;;        o AX -> numero convertido
numAcadena:
		mov CX, 0005
		mov DI, offset numero
ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero
		add DI, 0004
		;;
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

fin:
.EXIT
END

