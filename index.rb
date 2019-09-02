require_relative "./files/util"

print "\nEnter your name: "
player = gets.chomp

player_board = init_board
enemy_board  = init_board
