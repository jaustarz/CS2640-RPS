#Placeholder
#Placeholder
#Placeholder
#Placeholder

.data
msg1: .asciiz "\nWelcome to Rock Paper Scissors. Here are the rules to the game."
msg2: .asciiz "\nThere are two players. You and the computer/other player."
msg3: .asciiz "\nInput a choice between Rock, Paper, and scissors."
msg4: .asciiz "\nRock beats paper, Paper beats rock, and Scissors beat Paper"
msg5: .asciiz "\nIf you win 3 times, then you win the game overall."
msg6: .asciiz "\nWould you like to play the game?(0 for yes and 1 for no)"
msg7: .asciiz "\nEnding the game and exiting the program."

.text
main:
	la $a0, msg1
	li $v0, 4
	syscall
	
	la $a0, msg2
	li $v0, 4
	syscall
	
	la $a0, msg3
	li $v0, 4
	syscall
	
	la $a0, msg4
	li $v0, 4
	syscall
	
	la $a0, msg5
	li $v0, 4
	syscall
	
	la $a0, msg6
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	beq $s1, 0, exit
		
	beq $s1, 1, exit #Temporary
	
	exit:
	la $a0, msg7
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	
		
