require_relative "./files/util"
require_relative "./files/graphic"

# print "\nEnter your name: "
# player = gets.chomp

player_board = init_board
enemy_board  = init_board

# 5.times do |x|
#     5.times do |y|
#         player_board[x*2][y*2] = rand(0..4)
#     end
# end

player_board[3][3] = 4
player_board[3][4] = 4
player_board[3][5] = 4
player_board[3][6] = 4

player_board[2][3] = 3
player_board[2][4] = 3
player_board[2][5] = 3


render_boards(player_board, enemy_board)

print "Where do you want to shoot? (e.g. B5)"
coordinates = gets.chomp
#implement method to check input