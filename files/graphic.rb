require "colorize"

def render_boards(player_board)

    print "  "
    for j in 'A'..'J'
        print "#{j} "
    end
    print "\n"

    for i in 0..9
        print "#{i} " 
        for j in 0..9

            if player_board[i][j] == "#"
                color = :light_blue
            else
                color = :yellow
            end

            print "#{player_board[i][j]} ".colorize((color))
        end
        print "\n"
    end

end