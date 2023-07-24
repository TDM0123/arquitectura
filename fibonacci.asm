        .data
array:  .word   0 : 12         # array de 12 para contener valores de Fibonacci
lenght: .word  12              # Longitud del array
        .text
        
finonacci: la   $t0, array        # Cargando de la dirección del array
           la   $t5, lenght       # Cargando de la dirección de la longitud
      	   lw   $t5, 0($t5)       # Cargando de la longitud del array
      	   li   $t2, 1            # 1 es el primer y segundo número de Fibonacci
      	   add.d $f0, $f2, $f4
      	   sw   $t2, 0($t0)       # F[0] = 1
      	   sw   $t2, 4($t0)       # F[1] = F[0] = 1
      	   addi $t1, $t5, -2      # Contador para el loop, se ejecutará (lenght-2) veces
      	   j loop

loop: lw   $t3, 0($t0)         # Obteniendo el valor del array F[n] 
      lw   $t4, 4($t0)         # Obteniendo el valor del array F[n+1]
      add  $t2, $t3, $t4       # $t2 = F[n] + F[n+1]
      sw   $t2, 8($t0)         # Guardando F[n+2] = F[n] + F[n+1] en el array
      addi $t0, $t0, 4         # Incrementando la dirección inicial del número de Fibonacci
      addi $t1, $t1, -1        # Decrementando el contador del loop
      bgtz $t1, loop           # Repetir si no ha terminado aún
 
      li   $v0, 10             # llamada al sistema para salir
      syscall                  
	
