.MODEL SMALL
.RADIX 16
.STACK
.DATA

;; Nueva linea
new_linea       db 0a, "$"

;; Variables Iniciales
mensajeInicial  db "Universidad de San Carlos de Guatemala", 0ah, "Facultad de Ingenieria", 0ah, "Escuela de Vacaciones", 0ah, "Arquitectura de Computadoras y Ensambladores 1", 0ah, 0ah, "Nombre: Anthony Samuel Zea Herrera", 0ah,"Carne:  202104782", 0ah, "$"
menuInicial     db 0ah, "Bienvenido al sistema", 0ah, "- (V)entas", 0ah, "- (P)roductos", 0ah, "- (H)erramientas", 0ah, "$"

;; Prompts para pedir al usuarii
prompt               db 0ah, "Elija una opcion: ", 0ah, "$"
prompt_name          db "Nombre: ", "$"
prompt_price         db "Precio: ", "$"
prompt_units         db "Unidades: ", "$"
prompt_code          db "Codigo: ", "$"

;; Variable temporal para opcion de menu
temp db 00, "$"

;; Variables para acceso a menus
titulo_venta        db 0ah, "MENU VENTAS", 0ah, "$"
titulo_producto     db 0ah, "MENU PRODUCTOS", 0ah, "$"
titulo_herramientas db 0ah, "MENU HERRAMIENTAS", 0ah, "$"

;; Subrayados
sub_ven db "===========", 0a, "$"
sub_pro db "==============", 0a, "$"
sub_her db "=================", 0a, "$"

;; Buffer de entrada
buffer_entrada db 20, 00 
               db 20 dup (0)

;; "Estructura producto"
cod_prod  db 05 dup (0)
cod_name  db 14 dup (0)
cod_price db 05 dup (0)
cod_units db 05 dup (0)

.CODE
.STARTUP
;; CODIGO
inicio:
                ;; ENCABEZADO INICIAL
                mov DX, offset mensajeInicial
                mov AH, 09                              
                int 21                                  

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
                cmp AL, 70
                je menu_productos

                ;; Comparamos el valor ingresado con V, para menu de ventas
                cmp AL, 76
                je menu_ventas

                ;; Comparamos el valor ingresado con H, para menu de herramientas
                cmp AL, 68
                je menu_herramientas

;;;;;;;;;;;;;;;;;;;;; MENUS PRINCIPALES ;;;;;;;;;;;;;;;;;;;

;;; MENU PRODUCTOS
menu_productos:
                ;; Imprimimos encabezado
                mov DX, offset titulo_producto
                mov AH, 09                              
                int 21
                mov DX, offset sub_pro
                mov AH, 09                              
                int 21

;; PEDIR CODIGO DEL PRODUCTO
pedir_de_nuevo_codigo:
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
                mov CX, [DI]
                inc DI                                      ; me posiciono en el contenido del buffer

copiar_codigo:  mov AL, [DI]
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

                ;; Verificar que el tamaño del codigo no sea mayor a 5
                mov DI, offset buffer_entrada
                inc DI
                mov AL, [DI]
                cmp AL, 00
                je pedir_de_nuevo_name
                cmp AL, 15
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
                mov CX, [DI]
                inc DI                                      ; me posiciono en el contenido del buffer

copiar_nombre:  mov AL, [DI]
                mov [SI], AL
                inc SI
                inc DI
                loop copiar_nombre


    ;; ;; Imprimir cadena ingresada
    ;; mov BX, 01
    ;; mov DI, offset buffer_entrada
    ;; inc DI                                  ; se posiciona en el segundo byte del buffer
    ;; mov CH, 00                              ; 
    ;; mov CL, [DI]                            ; obtenemos la el tamaño de la cadena
    ;; inc DI                                  ; se posiciona en el tercer byte del buffer
    ;; mov DX, DI
    ;; mov AH, 40
    ;; int 21

    jmp fin

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

fin:
.EXIT
END

