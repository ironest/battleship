require_relative "./files/util"
require_relative "./files/graphic"

ship_list = [1, 1, 1, 2, 2, 2, 3, 3, 4]

show_splash_screen

print "\nEnter your name: "
player = gets.chomp

puts "\nPress ENTER to START the game"
gets

player_board = init_board
enemy_board  = init_board

ship_list.each do |ship_size|
    player_board = random_place_ship(ship_size, player_board)
    enemy_board = random_place_ship(ship_size, enemy_board)
end

turn_counter = 1

system("clear")
render_boards(player_board, enemy_board)

while true
    if is_board_clear(player_board)
        puts "\nComputer win!"
        break
    elsif is_board_clear(enemy_board)
        puts "\n#{player} win!"
        break
    else
        nil
    end

    if turn_counter % 2 == 1

        while true
            puts "\n#{player}, it's your turn!"
            print "Where do you want to shoot? "
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
        print "The CPU is shooting to"
        10.times do
            print "."
            sleep 0.2
        end
        xy = get_random_coordinates
        human_xy = get_human_coordinates(xy)
        puts "#{human_xy[0]}#{human_xy[1]}"
        update_board_after_shot(player_board, xy)
    end

    turn_counter += 1
    sleep 2
    system("clear")
    render_boards(player_board, enemy_board)
end

