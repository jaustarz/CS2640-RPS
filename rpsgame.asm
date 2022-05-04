# Jeremiah Garcia, Joel Joshy, Ryan Phan,
# Jibriel Ustarz, Hailee Wheat - Rock, Paper, Scissors Game
#
# This program is a basic Rock, Paper, Scissors (RPS) game. 
# It allows a user to play RPS with a CPU or with a second player.


.data
welcome: 	.asciiz "\nWelcome to Rock Paper Scissors. Here are the rules to the game."
twoPlayers: 	.asciiz "\nThere are two players. You and the computer/other player."
select: 	.asciiz "\nSelect a choice between Rock, Paper, or Scissors."
outcomes: 	.asciiz "\nRock beats Paper, Paper beats Rock, and Scissors beat Paper"
winConditions: 	.asciiz "\nIf you win 3 times, then you win the game overall.\n"
wantToPlay: 	.asciiz "\nWould you like to play the game? (0 for yes and 1 for no) "
ending: 	.asciiz "\nEnding the game and exiting the program."

enterChoice: 	.asciiz "\nPlease enter the number of your choice."
rock: 		.asciiz "\n1. Rock"
paper: 		.asciiz "\n2. Paper"
scissor: 	.asciiz "\n3. Scissors"
userChoice: 	.asciiz "\nWhat is your choice? "
playAgain:      .asciiz "\nDo you want to play again? (Enter 0 for yes and 1 for no)"

.text
main:

	#Displaying the welcome message
	la $a0, welcome
	li $v0, 4
	syscall
	
	#Message 2-5 displays the rules of the game
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
	
	#Asking the player if they want to play the game or not
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
	li $a1, 3				# this is to set the upper limit (in this case the limit is at 3
	li $v0, 42				# syscall to create the random number
	syscall					# returns the random number at $a0
	addi $s1, $a0, 1			# computer choice is in $s1

	# Compare them and return result
	
	# Ask to play again
	la $a0, playAgain
	li $v0, 4
	syscall
	
	#saving user choice in register $s1
	li $v0, 5                              
	syscall
	move $s1, $v0 
	
	#if the value in register $s1 equals 0 then the program will go to label game but if the value is 1 then the program will end
	beq $s1, $zero, game			#
	
	
	

exit:
	#Ending the program, displaying an exit message
	la $a0, ending
	li $v0, 4
	syscall

	li $v0, 10
	syscall

	
		
