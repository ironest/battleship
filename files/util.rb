def init_board

    board = []
    cols = rows = 0..9

    for x in cols
        board[x] = []
        for y in rows
            board[x][y] = "#"
        end
    end

    return board

end