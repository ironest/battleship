require_relative "./files/util"
require_relative "./files/graphic"

ship_list = [1, 1, 1, 2, 2, 2, 3, 3, 4]

# print "\nEnter your name: "
# player = gets.chomp
player = "Ricky"

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

turn_counter = 1

until is_board_clear(player_board) or is_board_clear(enemy_board)

    system("clear")
    render_boards(player_board, enemy_board)

    if turn_counter % 2 == 1

        while true
            puts "\n#{player} it's your turn!"
            print "Where do you want to shoot? (e.g. B5) "
            coordinates = gets.chomp
            break if validate_coordinates(coordinates)
        end
        
        #implement method to check input
        x = parse_coordinates(coordinates)[0]
        y = parse_coordinates(coordinates)[1]
    else
        puts "\nIt's computer turn!"
    end

    sleep 1
end

