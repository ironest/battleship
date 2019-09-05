HELP_OPTIONS = ["-h", "--help"]

def check_options (array)

    return if array.length == 0

    for opt in HELP_OPTIONS
        if array.include?(opt)
            display_help_message()
            exit
        end 
    end

    print "Illegal option: "
    array.map {|x| print "#{x} "}
    puts "\nUse [-h] or [--help] to access the help menu"
    exit

end

def display_help_message
    system("clear")
    puts "Battleship (Help menu)\n" +
         "----------------------\n" +
         "Battleship is a strategy type guessing game for a single player.\n" +
         "It is played on ruled grids on which each player's fleet of ships are marked.\n" +
         "The locations of the fleets are concealed from the other player.\n" +
         "Players alternate turns calling 'shots' at the other player's ships.\n" +
         "The objective of the game is to destroy the opposing player's fleet\n\n"
end

def init_board

    board = []
    cols = rows = 0..9

    for x in cols
        board[x] = []
        for y in rows
            board[x][y] = 0
        end
    end

    return board

end

def random_place_ship(size, board)

    fit = false
    until fit do

        max_x = 9
        max_y = 9
        newBoard = Marshal.load( Marshal.dump(board) )

        if rand(0..1) == 0
            orientation = :vertical
            max_x = 9 - size
        else
            orientation = :horizontal
            max_y = 9 - size
        end

        x = rand(0..max_x)
        y = rand(0..max_y)

        for c in 1..size
            if newBoard[x][y] == 0
                fit = true
                newBoard[x][y] = size
            else
                fit = false
                break
            end

            if orientation == :vertical
                x+=1
            else
                y+=1
            end

        end
    end

    return newBoard

end

def is_number? string
    true if Float(string) rescue false
end

def validate_coordinates( input )

    return false if input.length != 2
    
    return false if !is_number?(input[1])

    return false if !((0..9).include?(input[1].to_i))

    return false if !(("A".."J").include?(input[0].upcase))

    return true
end

def parse_coordinates( input )

    counter = 0
    for x in ("A".."J")
        break if input[0].upcase == x
        counter += 1
    end

    x = counter
    y = input[1].to_i

    return [x, y]
end

def get_human_coordinates( array )

    counter = array[0]

    for x in ("A".."J")
        break if counter == 0
        counter -= 1
    end

    #x = counter
    y = array[1].to_i

    return [x, y]
end

def is_board_clear( board )
    
    10.times do |x|
        10.times do |y|
            return false if board[x][y] > 0
        end
    end

    return true

end

def update_board_after_shot(board, array)

    y = array[0]
    x = array[1]

    if board[x][y] > 0
        board[x][y] = -2
        puts "Something got hit!".colorize(:color => :green)
    elsif board[x][y] == 0
        board[x][y] = -1
        puts "Nothing there.".colorize(:color => :light_black)
    else
        puts "Already shot here!".colorize(:color => :light_magenta)
    end

end

def get_random_coordinates
    return [rand(0..9),rand(0..9)]
end