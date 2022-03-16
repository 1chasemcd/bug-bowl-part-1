.text

main:
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