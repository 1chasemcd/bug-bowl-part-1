.data
	prompt: .asciz "Enter a string: "
	output: .asciz "The length of your string is: "
.text 0x00400000

main:
	#this section prompts the user to enter a string anf then calls the strlen function
	addi a7, zero, 4	# display prompt
	la a0, prompt
	ecall
	
	addi a1, zero, 40
	addi a7, zero, 8	# get a string  from user
	ecall
	add s0, a0, zero 	#store the number in s0
	
	addi a7, zero, 4	# display output
	la a0, output
	ecall
	add a0, s0, zero	# put number in a0
	 
	jal ra, strlen		#call strlen
	
	# Cleanly exit
	addi a7, zero, 10
	ecall

# Procedure to get next fibonacci iteration
# a3 - fibonacci number 1
# a4 - fibonacci number 2
# a4 -> a3, next_fib -> a4
iterate_fib:

# Procedure to check if a number is prime
# a2 - input number to check
# a0 - return value (1 for prime, 0 for not prime)
is_prime:
	# Counter = 2
	addi t0, zero, 2
	
	# t1 = a2 / 2
	srli t1, a2, 1
	
	loop1:
		# If a2 % t0 == 0, exit_composite
		rem t2, a2, t0
		beq t2, zero, exit_composite
		
		# If t0 > a2 / 2, exit_prime
		blt t1, t0, exit_prime
		addi t0, t0, 1
		
		# Repeat loop
		jal zero, loop1
		
	exit_prime:
	# Return 1
	addi a0, zero, 1
	jalr zero, 0(ra)
	
	exit_composite:
	# Return 0
	addi a0, zero, 0
	jalr zero, 0(ra)

# Procedure to check if a number n has an odd number of digits when converted to binary
# a2 - input number to check
# a0 - return value (1 for odd, 0 for even)
is_odd_binary_digits:
	# t0 = 100...000
	addi t0, zero, 1
	slli t0, t0, 31
	
	# t1 is num digit value - start with assumption that a2 is 32 digits
	addi t1, zero, 32
	
	loop2:
		# if leftmost digit of a2 is 1, then break
		bgeu a2, t0, exit2
	
		# Shift a2 left to check if next digit to the right is a 1
		slli a2, a2, 1
	
		# Decrease digit count - leftmost digit is still 0
		addi t1, t1, -1
		jal zero, loop2
	exit2:
	
	# a0 = 1 if digit count is odd, 0 otherwise
	andi a0, t1, 1
	
	# Return
	jalr zero, ra, 0
	
# Procedure to find the number of chars in a string that the user enters
# a0 - where the string is stored
# a0 - return value of the length of the string
strlen:
	add  t0, zero, zero   # i = 0
	Start: # Start of for loop 
		add  t1, t0, a0      # offset for str[i]
		lb   t1, 0(t1)       # dereference str[i]
    		beq  t1, zero, End    # if str[i] == 0, break for loop
    		addi t0, t0, 1       # incriment i
    		jal  zero, Start        # Jump back to the start of the for loop
    	End: # End of for loop
    	addi t0, t0, -1
    	addi a0, t0, 0       # Move t0 into a0 to return
    	li  a7, 1          # service 1 is print integer
    	ecall
	jalr zero, ra, 0
