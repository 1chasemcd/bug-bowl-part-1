# There are 5 bugs in this code
.data
a:	.asciz "Enter a string: "
b:	.asciz "The length of your string is: "
c:	.asciz "\nThe length of your string is a prime number.\n"
d:	.asciz "\nThe length of your string is a composite number.\n"
e:	.asciz "The length of your string has an even number of binary digits."
f:	.asciz  "The length of your string has an odd number of binary digits."
g:	.space 100
.text 0x00400000
main:
addi a7, zero, 4
la a0, a
ecall
addi a1, zero, 100
addi a7, zero, 8
la a0, g
ecall
add s0, a0, zero
addi a7, zero, 4
la a0, b
ecall
add a0, s0, zero
jal ra, h
addi a7, zero, 1
ecall
add a2, zero, a0
jal ra, i
add s0, zero, a0
jal ra, j
add s1, zero, a0
addi a7, zero, 4
bne s0, zero, k
la a0, c
jal zero, l
k: la a0, d
l:
ecall
beq s1, zero, m
la a0, f
jal zero, n
m: la a0, e
n:
ecall
addi a7, zero, 10
ecall
i:
addi t0, zero, 1
srli t1, a2, 1
o:
rem t2, a2, t0
beq t2, zero, p
blt t1, t0, q
addi t0, t0, 1
jal zero, o
q:
addi a0, zero, 1
jalr zero, 0(ra)
p:
addi a0, zero, 0
jalr zero, 0(ra)
j:
addi t0, zero, 1
slli t0, t0, 30
addi t1, zero, 32
r:
bgeu a2, t0, s
slli a2, a2, 1
addi t1, t1, 1
jal zero, r
s:
andi a0, t1, 1
jalr zero, ra, 0
h:
add  t0, zero, zero
t:
add  t1, t0, a0
lb   t1, 0(t1)
beq  t1, zero, u
addi t0, t0, 1
jal  zero, t
u:
addi t0, t0, -1
addi a0, t0, 0
jalr ra, zero, 0
