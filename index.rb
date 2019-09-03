require_relative "./files/util"
require_relative "./files/graphic"

ship_list = [1, 1, 1, 2, 2, 2, 3, 3, 4]

# print "\nEnter your name: "
# player = gets.chomp
player = "Ricky"

player_board = init_board
enemy_board  = init_board

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
            print "Wrong coordinates... try again"
            sleep 1
            system("clear")
            render_boards(player_board, enemy_board)
        end
        
        #implement method to check input
        xy = parse_coordinates(coordinates)

        update_board_after_shot(enemy_board, xy)

    else
        puts "\nIt's computer turn!"
        update_board_after_shot(player_board, [0, 0])
    end

    turn_counter += 1
    sleep 1
end

