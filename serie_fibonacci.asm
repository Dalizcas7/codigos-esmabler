.data
fib0:   .word 0     #primer término de la serie de Fibonacci
fib1:   .word 1     #segundo término de la serie de Fibonacci
fibn:   .word 0     #término n de la serie de Fibonacci
count:  .word 8     #número de términos de la serie de Fibonacci que queremos calcular (en este ejemplo, 8)

.text
.globl main
main:
    #inicializamos los registros
    la $t0, fib0    #cargamos la dirección de memoria de fib0 en el registro $t0
    lw $t1, ($t0)   #cargamos el valor de fib0 en el registro $t1
    la $t0, fib1    #cargamos la dirección de memoria de fib1 en el registro $t0
    lw $t2, ($t0)   #cargamos el valor de fib1 en el registro $t2
    la $t0, fibn    #cargamos la dirección de memoria de fibn en el registro $t0
    lw $t3, ($t0)   #cargamos el valor de fibn en el registro $t3
    la $t0, count   #cargamos la dirección de memoria de count en el registro $t0
    lw $t4, ($t0)   #cargamos el valor de count en el registro $t4

    #calculamos los términos de la serie de Fibonacci
    addi $t4, $t4, -2   #restamos 2 al número de términos, porque ya hemos calculado los dos primeros
    loop:
        add $t3, $t1, $t2   #sumamos los dos términos anteriores
        la $t0, fibn
        sw $t3, ($t0)       #almacenamos el valor en fibn
        move $t1, $t2       #movemos el valor de fib2 a fib1
        move $t2, $t3       #movemos el valor de fibn a fib2
        addi $t4, $t4, -1   #restamos 1 al contador
        bne $t4, $zero, loop    #si el contador no es cero, saltamos al inicio del bucle

    #mostramos los términos de la serie de Fibonacci
    la $a0, fib0
    li $v0, 4
    syscall
    lw $a0, ($a0)
    li $v0, 1
    syscall
    la $a0, fib1
    li $v0, 4
    syscall
    lw $a0, ($a0)
    li $v0, 1
    syscall
    la $t0, fibn
    lw $a0, ($t0)
    li $v0, 1
    syscall

    #
