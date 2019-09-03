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