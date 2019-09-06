require_relative "./files/util"
require_relative "./files/graphic"

ship_list = [1, 1, 1, 2, 2, 2, 3, 3, 4]

# Check whether the command line options/arguments were provided
argv_copy = ARGV.map{ |i| i }
ARGV.clear
check_options(argv_copy)

# Normal execution of the program
show_splash_screen

print "\nEnter your name: "
player = gets.chomp

puts "\nPress ENTER to START the game"
gets

# Data initialization
player_board = init_board
enemy_board  = init_board

# Placing Player and Opponent ships
ship_list.each do |ship_size|
    player_board = random_place_ship(ship_size, player_board)
    enemy_board = random_place_ship(ship_size, enemy_board)
end


turn_counter = 1
system("clear")

# Rendering the two boards
render_boards(player_board, enemy_board, turn_counter)

while true

    # Checking if Winning Condition (for the player) is satisfied
    if is_board_clear(player_board)
        puts "\nComputer win!"
        break
    # Checking if Winning Condition (for the Computer) is satisfied
    elsif is_board_clear(enemy_board)
        puts "\n#{player} win!"
        break
    else
        nil
    end

    # Alternating Player turn VS Computer turn
    if turn_counter % 2 == 1

        while true
            puts "\n#{player}, it's your turn!"
            print "Where do you want to shoot? "
            coordinates = gets.chomp
            break if validate_coordinates(coordinates)
            print "Wrong coordinates... try again".colorize(:color => :light_red)
            sleep 1
            system("clear")
            render_boards(player_board, enemy_board, turn_counter)
        end
        
        # Transforming human coordinates (e.g. B5) into Matrix coordinates (e.g. [2,5])
        xy = parse_coordinates(coordinates)

        # Checking and updating coordinates against the Computer board
        update_board_after_shot(enemy_board, xy)

    else
        puts "\nIt's computer turn!"
        print "The CPU is shooting to"
        10.times do
            print "."
            sleep 0.2
        end
        xy = get_random_coordinates

        # Transforming computer coordinates (e.g. [2,5]) into Matrix coordinates (e.g. B5)
        human_xy = get_human_coordinates(xy)
        puts "#{human_xy[0]}#{human_xy[1]}"

        # Checking and updating coordinates against the Player board
        update_board_after_shot(player_board, xy)
    end

    turn_counter += 1
    sleep 2
    system("clear")
    
    # Rendering the two boards
    render_boards(player_board, enemy_board, turn_counter)
end

