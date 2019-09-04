require "colorize"

# String.colors                       # return array of all possible colors names
# String.modes                        # return array of all possible modes
# String.color_samples                # displays color samples in all combinations
# exit

Ship_colors = {
    4 => :light_yellow,   # aircraft carrier
    3 => :light_green,    # cruiser
    2 => :white,          # destroyer
    1 => :light_cyan,     # submarine
    0 => :light_cyan,     # empty / water
    -1 => :light_cyan,    # shot in water
    -2 => :light_red,     # ship got hit
}

# Constant to space out the Player and the CPU boards
Separator = " "*10
Size = 0..9

def show_splash_screen
    system("clear")
    puts "Welcome to...\n" +
    "\n"+
    "######                                                          \n" +
    "#     #   ##   ##### ##### #      ######  ####  #    # # #####  \n" +
    "#     #  #  #    #     #   #      #      #      #    # # #    # \n" +
    "######  #    #   #     #   #      #####   ####  ###### # #    # \n" +
    "#     # ######   #     #   #      #           # #    # # #####  \n".colorize(:color => :light_red) +
    "#     # #    #   #     #   #      #      #    # #    # # #      \n".colorize(:color => :red) +
    "######  #    #   #     #   ###### ######  ####  #    # # #      \n".colorize(:color => :red)
end

def render_letters
    print "  "
    for j in 'A'..'J'
        print "#{j} "
    end
end

def render_row(board, idx, is_enemy_board)
    for i in Size
        render_cell(board[idx], i, is_enemy_board)
    end
end

def render_cell(row, idx, is_enemy_board)

    text_color = Ship_colors[row[idx]]

    case row[idx]
    when 0
        symbol = "~" #"◻"
    when -2
        symbol = "◉"
    when -1 
        symbol = " "
    else
        if is_enemy_board
            symbol = "~"
            text_color = Ship_colors[0]
        else
            symbol = "◼"
        end
    end

    print "#{symbol}".colorize(:color => text_color, :background => :black)
    print " ".colorize(:background => :black)
end

def render_boards(player_board, enemy_board, round_counter)

    puts "Round #{round_counter}\n".center(55)

    print "Your board".center(22)
    print Separator
    puts "Computer board".center(22)
    puts ""

    # Printing out letters for the player board
    render_letters

    print Separator

    # Printing out letters for the CPU board
    render_letters

    print "\n"

    for i in Size
        print "#{i}"
        print " ".colorize(:background => :black) 
        
        render_row(player_board, i, false)

        print "#{Separator}"
        print "#{i}"
        print " ".colorize(:background => :black)

        render_row(enemy_board, i, true)

        print "\n"
    end

end