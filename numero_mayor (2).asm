.data
    num1: .byte 99  #primer número
    num2: .byte 20  #segundo número
    num3: .byte 15  #tercer número
    max: .byte 0    #variable para almacenar el número mayor
    
.text
    main:
        #comparamos num1 con num2
        lb $t0, num1
        lb $t1, num2
        slt $t2, $t0, $t1   #si num1 < num2, t2 = 1 (true), sino t2 = 0 (false)
        beq $t2, $zero, compare_num1_num3   #si num1 >= num2, saltamos a comparar num1 con num3
        move $t3, $t1   #sino, almacenamos num2 en la variable max
        j compare_num3_max   #saltamos a comparar num3 con el valor almacenado en max

    compare_num1_num3:
        #comparamos num1 con num3
        lb $t0, num1
        lb $t1, num3
        slt $t2, $t0, $t1   #si num1 < num3, t2 = 1 (true), sino t2 = 0 (false)
        beq $t2, $zero, set_max_num1   #si num1 >= num3, almacenamos num1 en la variable max
        move $t3, $t1   #sino, almacenamos num3 en la variable max
        j end_compare   #terminamos la comparación

    compare_num3_max:
        #comparamos num3 con el valor almacenado en max
        lb $t0, max
        lb $t1, num3
        slt $t2, $t0, $t1   #si max < num3, t2 = 1 (true), sino t2 = 0 (false)
        beq $t2, $zero, end_compare   #si max >= num3, terminamos la comparación
        move $t3, $t1   #sino, almacenamos num3 en la variable max

    set_max_num1:
        #almacenamos num1 en la variable max
        lb $t0, num1
        move $t3, $t0

    end_compare:
        #terminamos el programa
        li $v0, 10
        syscall
