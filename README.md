# Battleship #

Github Repo: [github.com/ironest/battleship](https://github.com/ironest/battleship)

Contributors: Riccardo Carzania ([github.com/ironest](https://github.com/ironest))

### Description ###

This project implements the famous Battleship game with the Ruby programming language. The game is created as a terminal app and, as such, is executed and played from the command line interface. 

#### Purpose ####

The app's purpose is to entertain a single user player who competes against the CPU, with the objective of winning the game.

### Development plan ###

#### Brainstorming ####

The main requirement of the project is to build an app for the command line, which is usually an unfriendly environment for the average user. Due to this, my brainstorming process was heavily affected by the urge of making something fun and enjoyable for "average user". With that in mind, I decided to go for a simple game.
Usually, a game is more enjoyable when there's graphic, animations, colors and mouse-inputs but, once again, the "command line" requirement brings in some strong constraints. That means the game has to leverage more the art of "patience" and "strategy" rather than visual effects.

This is why I decided to recreate the old BattheShip game:
 * it doesn't need animation
 * it doesn't need graphic
 * it doesn't necessarily require input from a mouse

I proposed my idea to my tech leader, Gareth, who luckily approved it.
The early stage of my plan was spent on Trello, a web-based task management app that gives a visual overview of what needs to be done and who works on what. Generically speaking, Trello looks like a whiteboard filled with post-it notes. Obviously, I started with an empty board and, from there, I started filling in my own tasks and ideas.

#### Plan priority ####

I decided to break down the project into several smaller tasks, so that it would be easier to focus on one challenge at a time, without being distracted by the overall solution. In order of priority, below are are the blocks I planned:

1. High level design of which elements are needed in the game
   * Player board
   * Computer board
   * List of ships
      * Submarine (represented by ◼)
      * Destroyer (represented by ◼◼)
      * Cruiser (represented by ◼◼◼)
      * Aircraft Carrier (represented by ◼◼◼◼)
   * Turn counter
   * Turn alternation
   * Victory condition
   * Basic visualization of each board
2. Data structures needed to represent each element from previous point
   * Array of arrays for the Player board and Computer board
   * Array for the List of ships
   * Integer for the Turn counter
   * Method returning a boolean value for the Victory condition
3. Outline possible values/constants to represent each state of complex data structures
   * Constants for board sizes
   * Hash for states and colors of each cell on the boards
4. Decide which inputs are required from a user
   * Nickname
   * Coordinates of where to shoot
   * Coordinates of where to place own ships (this is a nice to have)
5. Game mechanics
   * When/How to initialize data structures?
   * What determines the turn alternation?
   * How/when to check for Victory condition
6. Cosmetic matters
   * Splash screen when the game starts
   * Colored output messages
   * Slowing down turn alternations to give the game a "human" feeling with usage of "sleep" instructions

Here is what my Trello board looked like after finishing breaking down the project into smaller elements

<img src="docs/00_trello_backlog.png" alt="Backlog Github" width="250"/>

### Features ###

#### 1. Coordinates (from user input) ####

One of the most important feature of the app revolves around users beign able to provide their own input as coordinates. This aspect is fundamental to give a player that sense of being active in the game. That said, user inputs are potentially subjected to human errors, meaning that anything manually typed must go through a validation layer, before taking into consideration the data inputted.

The nature of the input must be supplied as a 2 character long string, in the shape of <*letter*><*digit*> such as **B5**.
A user input is read by the instruction `coordinates = gets.chomp()` and, depending on whether or not the `coordinates` variable satisfies the expected syntax, the game proceeds or requests the user to re-enter another input.

Below a snippet of the code responsible for the input validation:
```ruby
def validate_coordinates( input )
    return false if input.length != 2
    return false if !is_number?(input[1])
    return false if !((0..9).include?(input[1].to_i))
    return false if !(("A".."J").include?(input[0].upcase))
    return true
end

while true
   print "Where do you want to shoot? "
   coordinates = gets.chomp
   break if validate_coordinates(coordinates)
   print "Wrong coordinates: type something like \"B5\" or \"b7\". Try again"
end
```

#### 2. TBD ####

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut varius massa. Quisque eu elit sed odio tristique eleifend vitae vitae leo.

#### 3. TBD ####

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut varius massa. Quisque eu elit sed odio tristique eleifend vitae vitae leo.

### User Interaction and Experience

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut varius massa. Quisque eu elit sed odio tristique eleifend vitae vitae leo.

### Control Flow Diagram

<img src="docs/06_workflow.png" alt="Control Flow Diagram" width="50%" height="50%"/>

### Status Updates ###

A link to my Status Updates can be found [here on GitHub](docs/development-log.md)
