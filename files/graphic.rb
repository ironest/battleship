require "colorize"

Ship_colors = {
    6 => :light_cyan,
    5 => :light_red,
    4 => :light_yellow,
    3 => :light_green,
    2 => :light_cyan,
    1 => :light_magenta,
    0 => :light_cyan
}

# Constant to space out the Player and the CPU boards
Separator = " "*10
V_axis = Size = 0..9
H_axis = "A..J"

def render_letters
    print "  "
    for j in 'A'..'J'
        print "#{j} "
    end
end

def render_row(board, idx)
    for i in Size
        render_cell(board[idx], i)
    end
end

def render_cell(row, idx)

    text_color = Ship_colors[row[idx]]

    case row[idx]
    when 0
        symbol = "◻"
    when 5
        symbol = "◉"
    else
        symbol = "◼"
    end

    print "#{symbol}".colorize(:color => text_color, :background => :black)
    print " ".colorize(:background => :black)
end

def render_boards(player_board, enemy_board)

    # Printing out letters for the player board
    render_letters

    print Separator

    # Printing out letters for the CPU board
    render_letters

    print "\n"

    for i in Size
        print "#{i}"
        print " ".colorize(:background => :black) 
        
        render_row(player_board, i)

        print "#{Separator}"
        print "#{i}"
        print " ".colorize(:background => :black)

        render_row(enemy_board, i)

        print "\n"
    end

end