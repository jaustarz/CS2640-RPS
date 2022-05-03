# Jeremiah Garcia, Joel Joshy, Ryan Phan,
# Jibriel Ustarz, Hailee Wheat - Rock, Paper, Scissors Game
#
# This program is a basic Rock, Paper, Scissors (RPS) game. 
# It allows a user to play RPS with a CPU or with a second player.


.data
welcome: .asciiz "\nWelcome to Rock Paper Scissors. Here are the rules to the game."
twoPlayers: .asciiz "\nThere are two players. You and the computer/other player."
select: .asciiz "\nSelect a choice between Rock, Paper, and scissors."
outcomes: .asciiz "\nRock beats paper, Paper beats rock, and Scissors beat Paper"
winConditions: .asciiz "\nIf you win 3 times, then you win the game overall."
wantToPlay: .asciiz "\nWould you like to play the game?(0 for yes and 1 for no)"
ending: .asciiz "\nEnding the game and exiting the program."

enterChoice: .asciiz "Please enter the number of choice: "
rock: .asciiz " 1. Rock"
paper: .asciiz " 2. Paper"
scissor: .asciiz "3. Scissor"
userChoice: .asciiz "What is your choice? "

.text
main:
	la $a0, welcome
	li $v0, 4
	syscall
	
	la $a0, twoPlayers
	li $v0, 4
	syscall
	
	la $a0, select
	li $v0, 4
	syscall
	
	la $a0, outcomes
	li $v0, 4
	syscall
	
	la $a0, winConditions
	li $v0, 4
	syscall
	
	la $a0, wantToPlay
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	beq $s1, 1, exit
	
game:
	#Telling the user what the choices are, should they accept to play the game
	la $a0, enterChoice
	li $v0, 4
	syscall

	la $a0, rock
	li $v0, 4
	syscall

	la $a0, paper
	li $v0, 4
	syscall

	la $a0, scissor
	li $v0, 4
	syscall

	la $a0, userChoice
	li $v0, 4
	syscall

	#User input choice
	li $v0, 5
	syscall
	move $s0, $v0 				# user choice is in $s0
	
	#Computer Choice
	li $a1, 3					# this is to set the upper limit (in this case the limit is at 3
	li $v0, 42					# syscall to create the random number
	syscall						# returns the random number at $a0
	addi $s1, $a0, 1			# computer choice is in $s1
		
	# Compare them and return result
	# Ask to play again

exit:
	la $a0, ending
	li $v0, 4
	syscall

	li $v0, 10
	syscall

	
		
