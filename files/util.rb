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

def is_board_clear( board )
    
    10.times do |x|
        10.times do |y|
            return false if board[x][y] > 0
        end
    end

    p "Board is clear"
    return true

end

def update_board_after_shot(board, coordinates)

    y = coordinates[0]
    x = coordinates[1]

    if board[x][y] > 0
        board[x][y] = -2
    else
        board[x][y] = -1
    end

end