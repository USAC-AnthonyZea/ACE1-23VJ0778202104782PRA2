.MODEL SMALL
.RADIX 16
.STACK
.DATA

;; Variable num, que almacenara los datos numericos
numero           db   05 dup (30)

;; Nueva linea
new_linea       db 0a, "$"

;; Variables Iniciales
mensajeInicial  db "Universidad de San Carlos de Guatemala", 0ah, "Facultad de Ingenieria", 0ah, "Escuela de Vacaciones", 0ah, "Arquitectura de Computadoras y Ensambladores 1", 0ah, 0ah, "Nombre: Anthony Samuel Zea Herrera", 0ah,"Carne:  202104782", 0ah, "$"
menuInicial     db 0ah, "Bienvenido al sistema", 0ah, "- (V)entas", 0ah, "- (P)roductos", 0ah, "- (H)erramientas", 0ah, "$"

;; Prompts para pedir al usuario
prompt               db "Elija una opcion: ", 0ah, "$"
prompt_code          db "Codigo: ", "$"
prompt_name          db "Descripcion: ", "$"
prompt_price         db "Precio: ", "$"
prompt_units         db "Unidades: ", "$"

;; Variables para acceso a menus
titulo_venta        db 0ah, "MENU VENTAS", 0ah, "$"
titulo_producto     db 0ah, "MENU PRODUCTOS", 0ah, "$"
titulo_herramientas db 0ah, "MENU HERRAMIENTAS", 0ah, "$"
titulo_prod         db 0ah, "Producto", 0ah, "$"
titulo_vent         db 0ah, "Venta", 0ah, "$"

;; Variable temporal para opcion de menu
temp db 00, "$"

;; Subrayados
sub_ven     db "===========", 0a, "$"
sub_pro     db "==============", 0a, "$"
sub_her     db "=================", 0a, "$"
sub2_prod   db "========", 0a, "$"
sub3_prod   db "=====", 0a, "$"
linea       db "---------------------------------", 0a, "$"

;; Buffer de entrada
buffer_entrada   db  20, 00
                 db  20 dup (0)

;; Buffer de ceros
ceros            db     2a dup (0)

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

;; Variables temporales
cod_prod_temp    db    05 dup (0)
puntero_temp     dw    0000

;; numéricos
num_price   dw    0000
num_units   dw    0000

;; Archivo PRODUCTOS
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000

; Estructura de venta
    diaVenta        db 01 dup (0)
    mesVenta        db 01 dup (0)
    anioVenta       dw 00
    horaVenta       db 01 dup (0)
    minutoVenta     db 01 dup (0)
    
    codigoVenta     db 05 dup (0)
    unidadesVenta   db 05 dup (0)

    numeroUnidadesVenta   dw 0000
    
    precioTotalVenta    dw 0000
    contadorItemsVenta  db 0

    separadorVentas     db "$"
    finalizarVenta      db "fin"

    archivoVentas       db "VENT.BIN", 00
    handleVentas        dw  0000h

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
        je eliminar_producto_archivo

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

        ;; ;; Limpiamos la variable
        ;; mov DI, offset cod_prod
		;; mov CX, 0005
		;; call memset

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

        ;; ;; Limpiamos la variable
        ;; mov DI, offset cod_name
		;; mov CX, 0005
		;; call memset

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
        mov CX, 26
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
        cmp AX, 00

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

        ;; ;; Limpiamos la variable
        ;; mov DI, offset cod_prod
		;; mov CX, 0005
		;; call memset

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
    cmp CX, 0000
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

;; SUBRUTINA DE REGISTRAR VENTAS
ventas_registrar:
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

    ; Reestablecer el contador de items en 1.
    mov DL, 0001
    mov [contadorItemsVenta], DL

    obtener_fecha:
        ; Obtener la fecha actual
        mov AH, 2a
        int 21

        ; Guardar la fecha
        mov [diaVenta], DL
        mov [mesVenta], DH
        mov [anioVenta], CX

    obtener_hora:
        ; Obtener la hora actual
        mov AH, 2c
        int 21

        ; Guardar la hora actual
        mov [horaVenta], CH
        mov [minutoVenta], CL

    abrir_archivo_ventas:
        ; Intentar abrir el archivo de productos
        mov AL, 02
        mov AH, 3d
        mov DX, offset archivoVentas
        int 21

        ; Si no existe, crearlo
        jc  crear_archivo_ventas

        ; Si existe, guardar el handle
        jmp guardar_handle_ventas

    crear_archivo_ventas:
        ; Crear el archivo de ventas
        mov CX, 0000
        mov DX, offset archivoVentas
        mov AH, 3c
        int 21
    
    guardar_handle_ventas:
        ; Guardar el handle del archivo
        mov [handleVentas], AX
        mov BX, [handleVentas]

        ; Mover el puntero del archivo al final
        mov CX, 0000
        mov DX, 0000
        mov AL, 02
        mov AH, 42
        int 21

    escribir_fecha_hora:
        ; Escribir la fecha y hora en el archivo
        mov CX, 06
        mov DX, offset diaVenta
        mov AH, 40
        int 21

        jmp leer_codigo_venta

    solicitar_item:
        leer_codigo_venta:
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            ;; Salto de linea
            mov DX, offset prompt_code
            mov AH, 09
            int 21

            mov DX, offset buffer_entrada
            mov AH, 0a
            int 21

            ; Verificar longitud del codigo (maximo 4 caracteres y minimo 1 caracter)
            mov DI, offset buffer_entrada
            inc DI
            mov AL, [DI]
            cmp AL, 00
            je leer_codigo_venta
            cmp AL, 04
            ja leer_codigo_venta

            ; Verificar si es 'fin'
            mov SI, offset finalizarVenta
            mov DI, offset buffer_entrada
            inc DI ; Saltar el primer byte
            mov CL, [DI]
            inc DI ; Saltar el segundo byte
            call cadenas_iguales
            cmp DL, 0ff
            je finalizar_venta

            ; Guardar el codigo del producto
            mov SI, offset codigoVenta
            mov DI, offset buffer_entrada
            inc DI ; Saltar el primer byte
            mov CH, 00
            mov CL, [DI] ; Cantidad de bytes leidos
            inc DI ; Saltar el segundo byte: Bytes leidos
            call copiar_variable

        leer_unidades_venta:
            ;; Salto de linea
            mov DX, offset new_linea
            mov AH, 09
            int 21
            ;; Salto de linea
            mov DX, offset prompt_units
            mov AH, 09
            int 21

            ; Leer las unidades del producto
            mov DX, offset buffer_entrada
            mov AH, 0a
            int 21

            ; Verificar longitud de las unidades (maximo 5 caracteres y minimo 1 caracter)
            mov DI, offset buffer_entrada
            inc DI
            mov AL, [DI]
            cmp AL, 00
            je leer_unidades_venta
            cmp AL, 05
            ja leer_unidades_venta

            ; Guardar las unidades del producto
            mov SI, offset unidadesVenta
            mov DI, offset buffer_entrada
            inc DI ; Saltar el primer byte
            mov CH, 00
            mov CL, [di] ; Cantidad de bytes leidos
            inc DI ; Saltar el segundo byte: Bytes leidos
            call copiar_variable

            ; Convertir el precio a numero
            mov DI, offset unidadesVenta
            call cadenaAnum
            mov [numeroUnidadesVenta], AX

            ; Limpiar la variable unidadesProducto
            mov DI, offset unidadesVenta
            mov CX, 0005
            call memset

            jmp escribir_nuevo_item

    escribir_nuevo_item:
        ; 1. Escribir el codigo del producto
        mov BX, [handleVentas]
        mov CX, 0005
        mov DX, offset codigoVenta
        mov AH, 40
        int 21

        ; 2. Escribir las unidades del producto (Es un numero)
        mov BX, [handleVentas]
        mov CX, 0002
        mov DX, offset numeroUnidadesVenta
        mov AH, 40
        int 21
        
        ; Limpiar la variable codigoVenta
        mov DI, offset codigoVenta
        mov CX, 0005
        call memset

        ; Limpiar la variable unidadesVenta
        mov DI, offset unidadesVenta
        mov CX, 0005
        call memset

        ; Limpiar la variable numeroUnidadesVenta
        mov DX, 0000
        mov [numeroUnidadesVenta], DX

        ; Incrementar y comparar el numero de items agregados actualmente
        ; Maximo de 10 items por venta
        
        mov DX, offset new_linea
        mov AH, 09
        int 21
        mov DX, offset new_linea
        mov AH, 09
        int 21
        
        mov DL, contadorItemsVenta
        cmp DL, 000a
        je finalizar_venta

        inc DL
        mov [contadorItemsVenta], DL
        jmp solicitar_item

    finalizar_venta:
        ; Escribir el separador de ventas
        mov BX, [handleVentas]
        mov CX, 0001
        mov DX, offset separadorVentas
        mov AH, 40
        int 21

        ; Cerrar el archivo
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
    jmp fin
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

fin:
.EXIT
END

