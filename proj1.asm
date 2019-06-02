# Piotr Milewski
# pmilewski
# 112291666

.data
# Command-line arguments
num_args: .word 0
addr_arg0: .word 0
addr_arg1: .word 0
addr_arg2: .word 0
addr_arg3: .word 0
addr_arg4: .word 0
no_args: .asciiz "You must provide at least one command-line argument.\n"

# Error messages
invalid_operation_error: .asciiz "INVALID_OPERATION\n"
invalid_args_error: .asciiz "INVALID_ARGS\n"

# Put your additional .data declarations here
negative: .asciiz "-"
positive: .asciiz "+"
a: .asciiz "a"
b: .asciiz "b"
c: .asciiz "c"
d: .asciiz "d"
e: .asciiz "e"
f: .asciiz "f"
g: .asciiz "g"
h: .asciiz "h"
i: .asciiz "i"
j: .asciiz "j"
k: .asciiz "k"
l: .asciiz "l"
m: .asciiz "m"
n: .asciiz "n"
o: .asciiz "o"
p: .asciiz "p"
q: .asciiz "q"
r: .asciiz "r"
s: .asciiz "s"
t: .asciiz "t"
u: .asciiz "u"
v: .asciiz "v"
w: .asciiz "w"
x: .asciiz "x"
y: .asciiz "y"
z: .asciiz "z"

# Main program starts here
.text
.globl main
main:
    # Do not modify any of the code before the label named "start_coding_here"
    # Begin: save command-line arguments to main memory
    sw $a0, num_args
    beq $a0, 0, zero_args
    beq $a0, 1, one_arg
    beq $a0, 2, two_args
    beq $a0, 3, three_args
    beq $a0, 4, four_args
five_args:
    lw $t0, 16($a1)
    sw $t0, addr_arg4
four_args:
    lw $t0, 12($a1)
    sw $t0, addr_arg3
three_args:
    lw $t0, 8($a1)
    sw $t0, addr_arg2
two_args:
    lw $t0, 4($a1)
    sw $t0, addr_arg1
one_arg:
    lw $t0, 0($a1)
    sw $t0, addr_arg0
    j start_coding_here

zero_args:
    la $a0, no_args
    li $v0, 4
    syscall
    j exit
    # End: save command-line arguments to main memory

# ------------------------------------------------------------------------------------------------
# Main Program

# ------------------------------------------------------------------------------------------------
# Part 1
start_coding_here:
    # Start the assignment by writing your code here
    lw $t0, addr_arg0
    lbu $t1, 0($t0)
    lbu $t2, 1($t0)
    bnez $t2, invalid_operation
    beq $t1, 50, valid_operation_2SLD # if arg0 is a 2
    beq $t1, 83, valid_operation_2SLD # if arg0 is an S
    beq $t1, 76, valid_operation_2SLD # if arg0 is an L
    beq $t1, 68, valid_operation_2SLD # if arg0 is an D
    beq $t1, 65, valid_operation_A # if arg0 is an A
    j invalid_operation

valid_operation_2SLD: # if arg0 is a 2, S, L, or D
	lw $t0, num_args
	bne $t0, 2, invalid_args
	beq $t1, 50, pt2
	beq $t1, 83, pt3
	beq $t1, 68, pt4
	beq $t1, 76, pt5
	j invalid_operation
	
valid_operation_A: # if arg0 is an A
	lw $t0, num_args
	bne $t0, 5, invalid_args
	beq $t1, 65, pt6
	j invalid_operation
	
# ------------------------------------------------------------------------------------------------
# Part 2

pt2: # assign values to registers and perform input validation
	# assign values to registers
	lw $s0, addr_arg1
	lbu $t7, 0($s0)
	lbu $t6, 1($s0)
	lbu $t5, 2($s0)
	lbu $t4, 3($s0)
	lbu $t3, 4($s0)
	lbu $t2, 5($s0)
	lbu $t1, 6($s0)
	lbu $t0, 7($s0)
	# input validation
pt2_invalid_t7:
	blt $t7, 48, invalid_args
	bgt $t7, 70, invalid_args
	blt $t7, 58, pt2_invalid_t6
	blt $t7, 65, invalid_args
pt2_invalid_t6:
	blt $t6, 48, invalid_args
	bgt $t6, 70, invalid_args
	blt $t6, 58, pt2_invalid_t5
	blt $t6, 65, invalid_args
pt2_invalid_t5:
	blt $t5, 48, invalid_args
	bgt $t5, 70, invalid_args
	blt $t5, 58, pt2_invalid_t4
	blt $t5, 65, invalid_args
pt2_invalid_t4:
	blt $t4, 48, invalid_args
	bgt $t4, 70, invalid_args
	blt $t4, 58, pt2_invalid_t3
	blt $t4, 65, invalid_args
pt2_invalid_t3:
	blt $t3, 48, invalid_args
	bgt $t3, 70, invalid_args
	blt $t3, 58, pt2_invalid_t2
	blt $t3, 65, invalid_args
pt2_invalid_t2:
	blt $t2, 48, invalid_args
	bgt $t2, 70, invalid_args
	blt $t2, 58, pt2_invalid_t1
	blt $t2, 65, invalid_args
pt2_invalid_t1:
	blt $t1, 48, invalid_args
	bgt $t1, 70, invalid_args
	blt $t1, 58, pt2_invalid_t0
	blt $t1, 65, invalid_args
pt2_invalid_t0:
	blt $t0, 48, invalid_args
	bgt $t0, 70, invalid_args
	blt $t0, 58, pt2_t7
	blt $t0, 65, invalid_args

# if hex ascii value is less than 65 ('A') then take it down 7 so it ranges from 10-15
pt2_t7:
	li $s7, 7 # offset for ascii values
	blt $t7, 65, pt2_t6
	sub $t7, $t7, $s7
pt2_t6:
	blt $t6, 65, pt2_t5
	sub $t6, $t6, $s7
pt2_t5:
	blt $t5, 65, pt2_t4
	sub $t5, $t5, $s7
pt2_t4:
	blt $t4, 65, pt2_t3
	sub $t4, $t4, $s7
pt2_t3:
	blt $t3, 65, pt2_t2
	sub $t3, $t3, $s7
pt2_t2:
	blt $t2, 65, pt2_t1
	sub $t2, $t2, $s7
pt2_t1:
	blt $t1, 65, pt2_t0
	sub $t1, $t1, $s7
pt2_t0:
	blt $t0, 65, pt2_cont
	sub $t0, $t0, $s7
	
pt2_cont: # convert to decimal, move value to proper position in binary then put them together
	#convert to decimal
	li $s7, 48
	sub $t7, $t7, $s7
	sub $t6, $t6, $s7
	sub $t5, $t5, $s7
	sub $t4, $t4, $s7
	sub $t3, $t3, $s7
	sub $t2, $t2, $s7
	sub $t1, $t1, $s7
	sub $t0, $t0, $s7
	# shift value to proper binary place
	sll $t7, $t7, 28
	sll $t6, $t6, 24
	sll $t5, $t5, 20
	sll $t4, $t4, 16
	sll $t3, $t3, 12
	sll $t2, $t2, 8
	sll $t1, $t1, 4
	sll $t0, $t0, 0
	# put them together
	or $t6, $t6, $t7
	or $t5, $t5, $t6
	or $t4, $t4, $t5
	or $t3, $t3, $t4
	or $t2, $t2, $t3
	or $t1, $t1, $t2
	or $t0, $t0, $t1
	# print the value
	li $a0, 0
	add $a0, $a0, $t0
	li $v0, 1
	syscall
	j exit

# ------------------------------------------------------------------------------------------------
# Part 3

pt3: # assign values to registers and perform input validation
	# assign values to registers
	lw $s0, addr_arg1
	lbu $t7, 0($s0)
	lbu $t6, 1($s0)
	lbu $t5, 2($s0)
	lbu $t4, 3($s0)
	lbu $t3, 4($s0)
	lbu $t2, 5($s0)
	lbu $t1, 6($s0)
	lbu $t0, 7($s0)
	# input validation
pt3_invalid_t7:
	blt $t7, 48, invalid_args
	bgt $t7, 70, invalid_args
	blt $t7, 58, pt3_invalid_t6
	blt $t7, 65, invalid_args
pt3_invalid_t6:
	blt $t6, 48, invalid_args
	bgt $t6, 70, invalid_args
	blt $t6, 58, pt3_invalid_t5
	blt $t6, 65, invalid_args
pt3_invalid_t5:
	blt $t5, 48, invalid_args
	bgt $t5, 70, invalid_args
	blt $t5, 58, pt3_invalid_t4
	blt $t5, 65, invalid_args
pt3_invalid_t4:
	blt $t4, 48, invalid_args
	bgt $t4, 70, invalid_args
	blt $t4, 58, pt3_invalid_t3
	blt $t4, 65, invalid_args
pt3_invalid_t3:
	blt $t3, 48, invalid_args
	bgt $t3, 70, invalid_args
	blt $t3, 58, pt3_invalid_t2
	blt $t3, 65, invalid_args
pt3_invalid_t2:
	blt $t2, 48, invalid_args
	bgt $t2, 70, invalid_args
	blt $t2, 58, pt3_invalid_t1
	blt $t2, 65, invalid_args
pt3_invalid_t1:
	blt $t1, 48, invalid_args
	bgt $t1, 70, invalid_args
	blt $t1, 58, pt3_invalid_t0
	blt $t1, 65, invalid_args
pt3_invalid_t0:
	blt $t0, 48, invalid_args
	bgt $t0, 70, invalid_args
	blt $t0, 58, pt3_t7
	blt $t0, 65, invalid_args
	
# if hex ascii value is less than 65 ('A') then take it down 7 so it ranges from 10-15
pt3_t7:
	li $s7, 7 # offset for ascii values
	blt $t7, 65, pt3_t6
	sub $t7, $t7, $s7
pt3_t6:
	blt $t6, 65, pt3_t5
	sub $t6, $t6, $s7
pt3_t5:
	blt $t5, 65, pt3_t4
	sub $t5, $t5, $s7
pt3_t4:
	blt $t4, 65, pt3_t3
	sub $t4, $t4, $s7
pt3_t3:
	blt $t3, 65, pt3_t2
	sub $t3, $t3, $s7
pt3_t2:
	blt $t2, 65, pt3_t1
	sub $t2, $t2, $s7
pt3_t1:
	blt $t1, 65, pt3_t0
	sub $t1, $t1, $s7
pt3_t0:
	blt $t0, 65, pt3_cont
	sub $t0, $t0, $s7
	
pt3_cont: # convert to decimal, move value to proper position in binary then put them together
	#convert to decimal
	li $s7, 48
	sub $t7, $t7, $s7
	sub $t6, $t6, $s7
	sub $t5, $t5, $s7
	sub $t4, $t4, $s7
	sub $t3, $t3, $s7
	sub $t2, $t2, $s7
	sub $t1, $t1, $s7
	sub $t0, $t0, $s7
	# shift value to proper binary place
	sll $t7, $t7, 28
	sll $t6, $t6, 24
	sll $t5, $t5, 20
	sll $t4, $t4, 16
	sll $t3, $t3, 12
	sll $t2, $t2, 8
	sll $t1, $t1, 4
	sll $t0, $t0, 0
	# put them together
	or $t6, $t6, $t7
	or $t5, $t5, $t6
	or $t4, $t4, $t5
	or $t3, $t3, $t4
	or $t2, $t2, $t3
	or $t1, $t1, $t2
	or $t0, $t0, $t1
	# check if negative
	li $s7, 0x80000000
	bne $t0, $s7, not_neg_zero
	la $a0, negative
	li $v0, 4
	syscall
not_neg_zero:
	li $s7, 0x00000000
	bne $t0, $s7, not_pos_zero
	la $a0, positive
	li $v0, 4
	syscall
not_pos_zero:
	andi $s6, $t0, 0x80000000
	li $s7, 0x80000000
	beq $s6, $s7, pt3_two_complement
	j pt3_cont_2
	
pt3_two_complement:
	xori $t0, $t0, 0x7FFFFFFF # complement every bit except for the 1st one, since the sign is still negative
	li $s7, 1
	addu $t0, $t0, $s7 # add 1 as per twos complement
	
pt3_cont_2:	
	# print the value
	li $a0, 0
	add $a0, $a0, $t0
	li $v0, 1
	syscall
	j exit
	
# ------------------------------------------------------------------------------------------------
# Part 4

pt4:
	# assign values to registers
	lw $s0, addr_arg1
	lbu $t7, 0($s0)
	lbu $t6, 1($s0)
	lbu $t5, 2($s0)
	lbu $t4, 3($s0)
	lbu $t3, 4($s0)
	lbu $t2, 5($s0)
	lbu $t1, 6($s0)
	lbu $t0, 7($s0)
	# input validation
pt4_invalid_t7:
	beq $t7, 48, pt4_invalid_t6
	blt $t7, 97, invalid_args
	bgt $t7, 122, invalid_args
pt4_invalid_t6:
	beq $t6, 48, pt4_invalid_t5
	blt $t6, 97, invalid_args
	bgt $t6, 122, invalid_args
pt4_invalid_t5:
	beq $t5, 48, pt4_invalid_t4
	blt $t5, 97, invalid_args
	bgt $t5, 122, invalid_args
pt4_invalid_t4:
	beq $t4, 48, pt4_invalid_t3
	blt $t4, 97, invalid_args
	bgt $t4, 122, invalid_args
pt4_invalid_t3:
	beq $t3, 48, pt4_invalid_t2
	blt $t3, 97, invalid_args
	bgt $t3, 122, invalid_args
pt4_invalid_t2:
	beq $t2, 48, pt4_invalid_t1
	blt $t2, 97, invalid_args
	bgt $t2, 122, invalid_args
pt4_invalid_t1:
	beq $t1, 48, pt4_invalid_t0
	blt $t1, 97, invalid_args
	bgt $t1, 122, invalid_args
pt4_invalid_t0:
	beq $t0, 48, pt4_t7
	blt $t0, 97, invalid_args
	bgt $t0, 122, invalid_args
	
# if hex ascii value is not 0 then take it down 97 so it ranges from 0-25
pt4_t7:
	li $s7, 97 # offset for ascii values
	beq $t7, 48, pt4_t6
	sub $t7, $t7, $s7
pt4_t6:
	beq $t6, 48, pt4_t5
	sub $t6, $t6, $s7
pt4_t5:
	beq $t5, 48, pt4_t4
	sub $t5, $t5, $s7
pt4_t4:
	beq $t4, 48, pt4_t3
	sub $t4, $t4, $s7
pt4_t3:
	beq $t3, 48, pt4_t2
	sub $t3, $t3, $s7
pt4_t2:
	beq $t2, 48, pt4_t1
	sub $t2, $t2, $s7
pt4_t1:
	beq $t1, 48, pt4_t0
	sub $t1, $t1, $s7
pt4_t0:
	beq $t0, 48, pt4_exp_t7
	sub $t0, $t0, $s7

# turn s registers into values that need to be added together
pt4_exp_t7:
	li $t9, 1 # subtraction constant
	li $s7, 0
	beq $t7, 48, pt4_exp_t6
	li $s7, 1 # initial addition
pt4_for_t7:
	beqz $t7, pt4_exp_t6
	sll $s7, $s7, 1
	sub $t7, $t7, $t9
	j pt4_for_t7
	
pt4_exp_t6:
	li $s6, 0
	beq $t6, 48, pt4_exp_t5
	li $s6, 1 # initial addition
pt4_for_t6:
	beqz $t6, pt4_exp_t5
	sll $s6, $s6, 1
	sub $t6, $t6, $t9
	j pt4_for_t6
	
pt4_exp_t5:
	li $s5, 0
	beq $t5, 48, pt4_exp_t4
	li $s5, 1 # initial addition
pt4_for_t5:
	beqz $t5, pt4_exp_t4
	sll $s5, $s5, 1
	sub $t5, $t5, $t9
	j pt4_for_t5
	
pt4_exp_t4:
	li $s4, 0
	beq $t4, 48, pt4_exp_t3
	li $s4, 1 # initial addition
pt4_for_t4:
	beqz $t4, pt4_exp_t3
	sll $s4, $s4, 1
	sub $t4, $t4, $t9
	j pt4_for_t4
	
pt4_exp_t3:
	li $s3, 0
	beq $t3, 48, pt4_exp_t2
	li $s3, 1 # initial addition
pt4_for_t3:
	beqz $t3, pt4_exp_t2
	sll $s3, $s3, 1
	sub $t3, $t3, $t9
	j pt4_for_t3
	
pt4_exp_t2:
	li $s2, 0
	beq $t2, 48, pt4_exp_t1
	li $s2, 1 # initial addition
pt4_for_t2:
	beqz $t2, pt4_exp_t1
	sll $s2, $s2, 1
	sub $t2, $t2, $t9
	j pt4_for_t2

pt4_exp_t1:
	li $s1, 0
	beq $t1, 48, pt4_exp_t0
	li $s1, 1 # initial addition
pt4_for_t1:
	beqz $t1, pt4_exp_t0
	sll $s1, $s1, 1
	sub $t1, $t1, $t9
	j pt4_for_t1
	
pt4_exp_t0:
	li $s0, 0
	beq $t0, 48, pt4_add_totals
	li $s0, 1 # initial addition
pt4_for_t0:
	beqz $t0, pt4_add_totals
	sll $s0, $s0, 1
	sub $t0, $t0, $t9
	j pt4_for_t0
	
pt4_add_totals:
	add $s6, $s6, $s7
	add $s5, $s5, $s6
	add $s4, $s4, $s5
	add $s3, $s3, $s4
	add $s2, $s2, $s3
	add $s1, $s1, $s2
	add $s0, $s0, $s1
	# print the value
	li $a0, 0
	add $a0, $a0, $s0
	li $v0, 1
	syscall
	j exit
	
# ------------------------------------------------------------------------------------------------
# Part 5

pt5:
	# assign values to registers
	lw $s0, addr_arg1
	lbu $t7, 0($s0)
	lbu $t6, 1($s0)
	lbu $t5, 2($s0)
	lbu $t4, 3($s0)
	lbu $t3, 4($s0)
	lbu $t2, 5($s0)
	lbu $t1, 6($s0)
	lbu $t0, 7($s0)
	# input validation
pt5_invalid_t7:
	blt $t7, 48, invalid_args
	bgt $t7, 57, invalid_args
pt5_invalid_t6:
	blt $t6, 48, invalid_args
	bgt $t6, 57, invalid_args
pt5_invalid_t5:
	blt $t5, 48, invalid_args
	bgt $t5, 57, invalid_args
pt5_invalid_t4:
	blt $t4, 48, invalid_args
	bgt $t4, 57, invalid_args
pt5_invalid_t3:
	blt $t3, 48, invalid_args
	bgt $t3, 57, invalid_args
pt5_invalid_t2:
	blt $t2, 48, invalid_args
	bgt $t2, 57, invalid_args
pt5_invalid_t1:
	blt $t1, 48, invalid_args
	bgt $t1, 57, invalid_args
pt5_invalid_t0:
	blt $t0, 48, invalid_args
	bgt $t0, 57, invalid_args
	
pt5_cont:
	# take down hex value by 48 so it ranges from 0-9
	li $s7, 48 # offset for ascii values
	sub $t7, $t7, $s7
	sub $t6, $t6, $s7
	sub $t5, $t5, $s7
	sub $t4, $t4, $s7
	sub $t3, $t3, $s7
	sub $t2, $t2, $s7
	sub $t1, $t1, $s7
	sub $t0, $t0, $s7
	
# convert individual input to a combined integer
pt5_convert_t7:
	li $t9, 10 # multiplication constant 
	li $t8, 0 # register that will hold combined int
	addu $t8, $t8, $t7
pt5_convert_t6:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t6
pt5_convert_t5:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t5
pt5_convert_t4:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t4
pt5_convert_t3:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t3
pt5_convert_t2:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t2
pt5_convert_t1:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t1
pt5_convert_t0:
	mul $t8, $t8, $t9
	addu $t8, $t8, $t0

pt5_check:
	li $t9, 0x00000000 # 32 bit storage for whether or not certain alphabet exists
	li $t0, 0x00000020
	li $t1, 1 # changing exponent
	li $t2, 26 # setting exponent
	li $t3, 1 # subtraction constant
	li $t5, 2 # divisor
	li $t6, 1 # branch constant to break out
	li $s0, 1 # another branch out constant
	
pt5_check_z:
	sub $t2, $t2, $t3 # $t2 = 25
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1 # shift for next letter
	blt $t8, $t4, pt5_check_y # check if this letter exists
	or $t9, $t9, $t0 # add this letter since it exists
	sub $t8, $t8, $t4
pt5_check_y:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_x
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_x:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_w
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_w:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_v
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_v:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_u
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_u:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_t
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_t:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_s
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_s:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_r
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_r:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_q
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_q:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_p
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_p:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_o
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_o:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_n
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_n:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_m
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_m:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_l
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_l:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_k
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_k:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_j
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_j:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_i
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_i:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_h
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_h:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_g
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_g:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_f
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_f:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_e
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_e:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_d
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_d:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_c
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_c:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_b
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_b:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_check_a
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
pt5_check_a:
	sub $t2, $t2, $t3 # $t2 = 24
	sllv $t4, $t1, $t2
	sll $t0, $t0, 1
	blt $t8, $t4, pt5_assemble
	or $t9, $t9, $t0
	sub $t8, $t8, $t4
	
pt5_assemble:
	li $t0, 0x80000000
pt5_ass_a:
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_b
	la $a0, a
	li $v0, 4
	syscall
pt5_ass_b:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_c
	la $a0, b
	li $v0, 4
	syscall
pt5_ass_c:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_d
	la $a0, c
	li $v0, 4
	syscall
pt5_ass_d:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_e
	la $a0, d
	li $v0, 4
	syscall
pt5_ass_e:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_f
	la $a0, e
	li $v0, 4
	syscall
pt5_ass_f:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_g
	la $a0, f
	li $v0, 4
	syscall
pt5_ass_g:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_h
	la $a0, g
	li $v0, 4
	syscall
pt5_ass_h:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_i
	la $a0, h
	li $v0, 4
	syscall
pt5_ass_i:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_j
	la $a0, i
	li $v0, 4
	syscall
pt5_ass_j:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_k
	la $a0, j
	li $v0, 4
	syscall
pt5_ass_k:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_l
	la $a0, k
	li $v0, 4
	syscall
pt5_ass_l:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_m
	la $a0, l
	li $v0, 4
	syscall
pt5_ass_m:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_n
	la $a0, m
	li $v0, 4
	syscall
pt5_ass_n:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_o
	la $a0, n
	li $v0, 4
	syscall
pt5_ass_o:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_p
	la $a0, o
	li $v0, 4
	syscall
pt5_ass_p:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_q
	la $a0, p
	li $v0, 4
	syscall
pt5_ass_q:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_r
	la $a0, q
	li $v0, 4
	syscall
pt5_ass_r:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_s
	la $a0, r
	li $v0, 4
	syscall
pt5_ass_s:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_t
	la $a0, s
	li $v0, 4
	syscall
pt5_ass_t:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_u
	la $a0, t
	li $v0, 4
	syscall
pt5_ass_u:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_v
	la $a0, u
	li $v0, 4
	syscall
pt5_ass_v:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_w
	la $a0, v
	li $v0, 4
	syscall
pt5_ass_w:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_x
	la $a0, w
	li $v0, 4
	syscall
pt5_ass_x:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_y
	la $a0, x
	li $v0, 4
	syscall
pt5_ass_y:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, pt5_ass_z
	la $a0, y
	li $v0, 4
	syscall
pt5_ass_z:
	srl $t0, $t0, 1
	and $t1, $t0, $t9
	bne $t1, $t0, exit
	la $a0, z
	li $v0, 4
	syscall
	j exit

# ------------------------------------------------------------------------------------------------
# Part 6

pt6:
	# assign values to registers
	lw $s0, addr_arg1
	lbu $t7, 0($s0)
	lbu $t6, 1($s0)
	lbu $t5, 2($s0)
	lbu $t4, 3($s0)
	lbu $t3, 4($s0)
	lbu $t2, 5($s0)
	lbu $t1, 6($s0)
	lbu $t0, 7($s0)

pt6_upper:
	# determine whether or not to count uppercase
	lw $s0, addr_arg2
	lbu $s0, 0($s0)
	beq $s0, 78, pt6_no_upper
	li $s0, 0
pt6_upper_t7:
	blt $t7, 65, pt6_upper_t6
	bgt $t7, 90, pt6_upper_t6
	addi $s0, $s0, 1
pt6_upper_t6:
	blt $t6, 65, pt6_upper_t5
	bgt $t6, 90, pt6_upper_t5
	addi $s0, $s0, 1
pt6_upper_t5:
	blt $t5, 65, pt6_upper_t4
	bgt $t5, 90, pt6_upper_t4
	addi $s0, $s0, 1
pt6_upper_t4:
	blt $t4, 65, pt6_upper_t3
	bgt $t4, 90, pt6_upper_t3
	addi $s0, $s0, 1
pt6_upper_t3:
	blt $t3, 65, pt6_upper_t2
	bgt $t3, 90, pt6_upper_t2
	addi $s0, $s0, 1
pt6_upper_t2:
	blt $t2, 65, pt6_upper_t1
	bgt $t2, 90, pt6_upper_t1
	addi $s0, $s0, 1
pt6_upper_t1:
	blt $t1, 65, pt6_upper_t0
	bgt $t1, 90, pt6_upper_t0
	addi $s0, $s0, 1
pt6_upper_t0:
	blt $t0, 65, pt6_upper_cont
	bgt $t0, 90, pt6_upper_cont
	addi $s0, $s0, 1
pt6_upper_cont:
	sll $s0, $s0, 8
	j pt6_lower
pt6_no_upper:
	li $s0, 0
	
pt6_lower:
	# determine whether or not to count lowercase
	lw $s1, addr_arg3
	lbu $s1, 0($s1)
	beq $s1, 78, pt6_no_lower
	li $s1, 0
pt6_lower_t7:
	blt $t7, 97, pt6_lower_t6
	bgt $t7, 122, pt6_lower_t6
	addi $s1, $s1, 1
pt6_lower_t6:
	blt $t6, 97, pt6_lower_t5
	bgt $t6, 122, pt6_lower_t5
	addi $s1, $s1, 1
pt6_lower_t5:
	blt $t5, 97, pt6_lower_t4
	bgt $t5, 122, pt6_lower_t4
	addi $s1, $s1, 1
pt6_lower_t4:
	blt $t4, 97, pt6_lower_t3
	bgt $t4, 122, pt6_lower_t3
	addi $s1, $s1, 1
pt6_lower_t3:
	blt $t3, 97, pt6_lower_t2
	bgt $t3, 122, pt6_lower_t2
	addi $s1, $s1, 1
pt6_lower_t2:
	blt $t2, 97, pt6_lower_t1
	bgt $t2, 122, pt6_lower_t1
	addi $s1, $s1, 1
pt6_lower_t1:
	blt $t1, 97, pt6_lower_t0
	bgt $t1, 122, pt6_lower_t0
	addi $s1, $s1, 1
pt6_lower_t0:
	blt $t0, 97, pt6_lower_cont
	bgt $t0, 122, pt6_lower_cont
	addi $s1, $s1, 1
pt6_lower_cont:
	sll $s1, $s1, 4
	j pt6_count
pt6_no_lower:
	li $s1, 0
	
pt6_count:
	# determine whether or not to count lowercase
	lw $s2, addr_arg4
	lbu $s2, 0($s2)
	beq $s2, 78, pt6_no_count
	li $s2, 0
pt6_count_t7:
	blt $t7, 48, pt6_count_t6
	bgt $t7, 57, pt6_count_t6
	addi $s2, $s2, 1
pt6_count_t6:
	blt $t6, 48, pt6_count_t5
	bgt $t6, 57, pt6_count_t5
	addi $s2, $s2, 1
pt6_count_t5:
	blt $t5, 48, pt6_count_t4
	bgt $t5, 57, pt6_count_t4
	addi $s2, $s2, 1
pt6_count_t4:
	blt $t4, 48, pt6_count_t3
	bgt $t4, 57, pt6_count_t3
	addi $s2, $s2, 1
pt6_count_t3:
	blt $t3, 48, pt6_count_t2
	bgt $t3, 57, pt6_count_t2
	addi $s2, $s2, 1
pt6_count_t2:
	blt $t2, 48, pt6_count_t1
	bgt $t2, 57, pt6_count_t1
	addi $s2, $s2, 1
pt6_count_t1:
	blt $t1, 48, pt6_count_t0
	bgt $t1, 57, pt6_count_t0
	addi $s2, $s2, 1
pt6_count_t0:
	blt $t0, 48, pt6_count_cont
	bgt $t0, 57, pt6_count_cont
	addi $s2, $s2, 1
pt6_count_cont:
	j pt6_cont
pt6_no_count:
	li $s2, 0

pt6_cont:
	or $s1, $s1, $s2
	or $s0, $s0, $s1
	# print the value
	li $a0, 0
	add $a0, $a0, $s0
	li $v0, 35
	syscall
	j exit

# ------------------------------------------------------------------------------------------------
# Error Handling
invalid_operation:
	la $a0, invalid_operation_error
	li $v0, 4
	syscall
	j exit
	
invalid_args:
	la $a0, invalid_args_error
	li $v0, 4
	syscall
	j exit
    
# ------------------------------------------------------------------------------------------------
# Exit Call
exit:
    li $a0, '\n'
    li $v0, 11
    syscall
    li $v0, 10
    syscall
