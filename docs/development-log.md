### Status Updates ###

#### 1. Battleship board data structure (03/08/2019) ####

The Battleship game I am creating revolves around the concept of maintaining a 10x10 matrix with data in it. To achieve such requirement, I am using the Ruby built-in Array class and am also using each element of such array to hold values of other 10 arrays. In total I'll have 11 arrays, each with length equal to 10.
Now that the data structure is ready, I have to create a logic on how to
 * initialize each *cell* of the matrix
 * how to keep track of those ships that spans across multiple cells
 * how to *render* each cell on the command line

I came up with the following idea

Value in memory | Render graphic | Meaning
------------ | ------------- | -------------
0 | ~ | The cell contains water
1 | ◼ | The cell contains a piece of ship
-2 | ◉ | The cell contains a damaged ship
-1 | " " | The cell contains nothing

The implemention of the above logic was achieved by leveraging an Hash data structure (in the form of a costant).

```Ruby
Ship_colors = {
    0 => :light_cyan,     # empty / water
    1 => :light_black,    # ship
    -1 => :light_cyan,    # shot in water
    -2 => :light_red,     # ship got hit
}
```

To initialize the matrix I created an adhoc method that performs a two level loops

```ruby
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
```

If my reasoning is right, I could simply print each cell by looping through all the slots of my array-of-array. Obviously, to keep my code as DRY as possible, I wrote an adhoc method to print each element of the board

```Ruby
def render_cell(cell_value)
    text_color = Ship_colors[cell_value]
    case cell_value
    when 0
        symbol = "~"
    when -2
        symbol = "◉"
    when -1 
        symbol = " "
    else
        symbol = "◼"
    end
    print "#{symbol}".colorize(:color => text_color, :background => :black)
end
```

#### 2. Horrible visual bug (04/08/2019) ####

I did my best to ignore a cosmetic issue... but I sincerely can't stand it anymore.
Since the ships are randomly placed on the board by the game itself, whenever two (or more) ships sit next to each other, the user has little or no chance to distinguish them apart and, sometimes, it's also impossible to determine the orientation of a ship.
Below an example:

<img src="01_board_render.png" alt="Cosmetic issue" width="250"/> <img src="02_board_render.png" alt="Cosmetic issue" width="250"/>

Usually cosmetic issues are not very important and should to be left at the very end of a project due to their *low priority* but... for a game, I felt this problem was quite bothering. So, I decided to tackle it down with a redesign to the code, to include more colors which could have improved the ability to read objects on the board.

Below is a revisited and extended version of the definition of symbols

Value in memory | Render graphic | Meaning
------------ | ------------- | -------------
0 | <span style='color:blue'>~</span> | The cell contains water
1 | <span style='color:cyan'>◼</span> | The cell contains a submarine
2 | <span style='color:gray'>◼◼</span> | The cell contains a (piece of) destroyer
3 | <span style='color:lime'>◼◼◼</span> | The cell contains a (piece of) cruiser
4 | <span style='color:yellow'>◼◼◼◼</span> | The cell contains a (piece of) aircraft carrier
-2 | <span style='color:red'>◉</span> | The cell contains a damaged ship
-1 | " " | The cell contains nothing

Once again, I also transfer the above cosmetic changes into my original Hash data structure

```Ruby
Ship_colors = {
    4 => :light_yellow,   # aircraft carrier
    3 => :light_green,    # cruiser
    2 => :white,          # destroyer
    1 => :light_cyan,     # submarine
    0 => :light_cyan,     # empty / water
    -1 => :light_cyan,    # shot in water
    -2 => :light_red,     # ship got hit
}
```

Interesting enough, the nice way I deteached the logic of colors from the code, paid me back; by applying minimal changes to my Hash data structure, I had very little impacts on the rest of my code and the `render_cell` method required no change at all.

Below are a couple of samples produced with the new version of the board

<img src="04_board_render.png" alt="Cosmetic issue" width="250"/> <img src="05_board_render.png" alt="Cosmetic issue" width="250"/>