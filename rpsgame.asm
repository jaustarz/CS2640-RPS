# Jeremiah Garcia, Joel Joshy, Ryan Phan,
# Jibriel Ustarz, Hailee Wheat - Rock, Paper, Scissors Game
#
# This program is a basic Rock, Paper, Scissors (RPS) game. 
# It allows a user to play RPS with a CPU or with a second player.


.data
welcome: 	.asciiz "\nWelcome to Rock Paper Scissors. Here are the rules to the game.\n"
twoPlayers: 	.asciiz "\nThere are two players. You and the computer/other player."
select: 	.asciiz "\nSelect a choice between Rock, Paper, or Scissors.\n"
outcomes: 	.asciiz "\nRock beats Paper, Paper beats Rock, and Scissors beat Paper"
winConditions: 	.asciiz "\nIf you win 3 times, then you win the game overall.\n"
wantToPlay: 	.asciiz "\nWould you like to play the game? (y or n) "
playerCount:	.asciiz "\nAre you playing with a friend or with the computer? (f or c) "
ending: 	.asciiz "\nEnding the game and exiting the program."

enterChoice: 	.asciiz "\nPlease enter the number of your choice."
rock: 		.asciiz "\n1. Rock"
paper: 		.asciiz "\n2. Paper"
scissor: 	.asciiz "\n3. Scissors"
askUserChoice: 	.asciiz "\nWhat is your choice? "
askUser2Choice: .asciiz "\nPlayer 2: What is your choice? "
playAgain:      .asciiz "\nDo you want to play again? (0 for yes and 1 for no) "
userChoice:	.asciiz "\nYou chose: "
user2Choice:	.asciiz " and player 2 chose: "
computerChoice: .asciiz " and the computer chose: "
youWin: 	.asciiz " so...\nYou won! :)"
youLose: 	.asciiz " so...\nYou lost. :("
youTied:	.asciiz " so...\nYou tied with the CPU. :|"

here:		.asciiz "\nhere\n"

.text
main:

	# Displaying the welcome message
	la $a0, welcome
	li $v0, 4
	syscall
	
	# Message 2-5 displays the rules of the game
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
	
	# Asking the player if they want to play the game or not
	la $a0, wantToPlay
	li $v0, 4
	syscall
	
	li $v0, 12
	syscall
	beq $v0, 'n', exit

	# Ask the player if they are going to play pvp or cpu
	la $a0, playerCount
	li $v0, 4
	syscall

	li $v0, 12
	syscall
	beq $v0, 'f', PVPTrue
	
	# PVP false
		add $s7, $zero, $zero

	PVPTrue:
		addi $s7, $zero, 1		# PVP or CPU is in $s7
	
game:
	# Telling the user what the choices are, should they accept to play the game
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

	la $a0, askUserChoice
	li $v0, 4
	syscall

	# User input choice
	li $v0, 5
	syscall
	move $s0, $v0 				# user choice is in $s0

	# Check if it is PVP or CPU
	beq $s7, $zero, CPUChoice
	
	la $a0, askUser2Choice
	li $v0, 4
	syscall

	# User input choice
	li $v0, 5
	syscall
	move $s1, $v0 				# second user choice is in $s1

	j choices

	CPUChoice:
		# Computer Choice
		li $a1, 3				# this is to set the upper limit (in this case the limit is at 3
		li $v0, 42				# syscall to create the random number
		syscall					# returns the random number at $a0
		addi $s1, $a0, 1			# computer choice is in $s1

choices:

	# Displays users choice
	la $a0, userChoice
	li $v0, 4
	syscall
	la $a0, ($s0)
	li $v0, 1
	syscall

	# Check if it is PVP or CPU
	beq $s7, $zero, CPUDisplay

	la $a0, user2Choice
	li $v0, 4
	syscall
	la $a0, ($s1)
	li $v0, 1
	syscall

	j compare

	CPUDisplay:
	# Displays computer's choice 
	la $a0, computerChoice	
	li $v0, 4
	syscall
	la $a0, ($s1)
	li $v0, 1
	syscall
	
compare:

	# Compare user and computer's/second player's choice
	beq $s0, $s1, tie
	beq $s0, 1, choseRock
	beq $s0, 2, chosePaper
	beq $s0, 3, choseScissors
	
	# User chose same option as CPU/player
	tie:
		# Displays tie message
		la $a0, youTied	
		li $v0, 4
		syscall
		
		j endRound
					
	# User chose rock
	choseRock:		
		# Check if User beat CPU/player
		beq $s1, 3, userWins
		j userLoses
		
	# User chose paper
	chosePaper:
		# Check if User beat CPU/player
		beq $s1, 1, userWins
		j userLoses
		
	# User chose scissors
	choseScissors:
		# Check if User beat CPU/player
		beq $s1, 2, userWins
		j userLoses

	userWins:
	# Displays winning message
	la $a0, youWin				
	li $v0, 4
	syscall
	# Increase user's score
	j endRound
	
	userLoses:
	# Displays losing message
	la $a0, youLose		
	li $v0, 4
	syscall
	# Increase CPU's score
	j endRound
	
endRound:
	# Check score to see if game needs to end
	# Ask to play again
	la $a0, playAgain
	li $v0, 4
	syscall
	
	# get user choice
	li $v0, 5                              
	syscall
	
	# if the value in register $v0 equals 0 then the program will go to label game but if the value is 1 then the program will end
	beq $v0, $zero, game

exit:
	# Ending the program, displaying an exit message
	la $a0, ending
	li $v0, 4
	syscall

	li $v0, 10
	syscall

	
		
