require_relative "./files/util"
require_relative "./files/graphic"

print "\nEnter your name: "
player = gets.chomp

player_board = init_board
enemy_board  = init_board

render_boards(player_board)