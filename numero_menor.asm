.data
    num1: .byte 10   #primer número
    num2: .byte 20   #segundo número
    num3: .byte 15   #tercer número
    min: .byte 0     #variable para almacenar el número menor
    
.text
    main:
        #comparamos num1 con num2
        lb $t0, num1
        lb $t1, num2
        slt $t2, $t0, $t1    #si num1 < num2, t2 = 1 (true), sino t2 = 0 (false)
        beq $t2, $zero, compare_num1_num3    #si num1 >= num2, saltamos a comparar num1 con num3
        move $t3, $t0    #sino, almacenamos num1 en la variable min
        j compare_num3_min    #saltamos a comparar num3 con el valor almacenado en min

    compare_num1_num3:
        #comparamos num1 con num3
        lb $t0, num1
        lb $t1, num3
        slt $t2, $t0, $t1    #si num1 < num3, t2 = 1 (true), sino t2 = 0 (false)
        beq $t2, $zero, set_min_num3    #si num1 >= num3, almacenamos num3 en la variable min
        move $t3, $t0    #sino, almacenamos num1 en la variable min
        j end_compare    #terminamos la comparación

    compare_num3_min:
        #comparamos num3 con el valor almacenado en min
        lb $t0, min
        lb $t1, num3
        slt $t2, $t1, $t0    #si num3 < min, t2 = 1 (true), sino t2 = 0 (false)
        beq $t2, $zero, end_compare    #si num3 >= min, terminamos la comparación
        move $t3, $t1    #sino, almacenamos num3 en la variable min

    set_min_num3:
        #almacenamos num3 en la variable min
        lb $t0, num3
        move $t3, $t0

    end_compare:
        #terminamos el programa
        li $v0, 10
        syscall
