.MODEL SMALL
.RADIX 16
.STACK
.DATA
;; Variables | Memoria Ram
mensajeInicial db "Universidad de San Carlos de guatemala", 0ah, "Facultad de Ingenieria", 0ah, "Escuela de Vacaciones", 0ah, "Arquitectura de Computadoras y Ensambladores 1", 0ah, "$"

.CODE
.STARTUP
;; CODIGO
inicio:
        ;; Guardamos en DX el mensaje Inicial
        mov DX, offset mensajeInicial
        mov AH, 09                              ;; Imprimimos el valor
        int 21                                  ;; Llamamos a la interrupcion 21
fin:
.EXIT
END


