require_relative "./files/util"
require_relative "./files/graphic"

ship_list = [1, 1, 1, 2, 2, 2, 3, 3, 4]

# print "\nEnter your name: "
# player = gets.chomp

player_board = init_board
enemy_board  = init_board

# 5.times do |x|
#     5.times do |y|
#         player_board[x*2][y*2] = rand(0..4)
#     end
# end

ship_list.each do |ship_size|
    player_board = random_place_ship(ship_size, player_board)
    enemy_board = random_place_ship(ship_size, enemy_board)
end

render_boards(player_board, enemy_board)

print "Where do you want to shoot? (e.g. B5)"
coordinates = gets.chomp
#implement method to check input

