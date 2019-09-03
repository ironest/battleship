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

def validate_coordinates( input )
    return true
end

def parse_coordinates( input )
    return [3, 3]
end

def isBoardClear( board )
    
    10.times do |x|
        10.times do |y|
            return false if board[x][y] > 0
        end
    end

    p "Board is clear"
    return true

end