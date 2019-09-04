## Battleship - The game ##

Github Repo: github.com/ironest/battleship.git

Contributors: Riccardo Carzania (github.com/ironest)

### Description ###

This project implements the famous Battleship game with the Ruby programming language. The game is created as a terminal app and, as such, is executed and played from the command line interface. 

#### Purpose ####

The app's purpose is to entertain a single user player who competes against the CPU, with the objective of winning the game.

### Development plan ###

#### Brainstorming ####

The main requirement of the project was to build an app for the command line, which is usually an unfriendly environment for the average user. Due to this, my brainstorming process was heavily affected by the urge of making something fun and enjoyable for anyone. With that in mind, I decided to go for a small game.
Usually, a game is more enjoyable when there's graphic, animations, colors and mouse-inputs but, once again, the "command line" requirement brings in some strong constraints. That meant that the game had to leverage more the art of "patience" and "strategy" rather than visual effects.

This is when I decided to create the old game "BattheShip":
 * it doesn't need animation
 * it doesn't need graphic
 * it doesn't necessarily require input from a mouse

I proposed my idea to my tech leader, Gareth, who luckily accepted.
The early stage of my plan was spent on Trello, a web-based task management app that gives a visual overview of what needs to be done and who is working on it. Mostly, it looks like a whiteboard filled with post-it notes. Obviously, I started with an empty board and, from there, I started filling in tasks and ideas.

#### Plan priority ####

I decided to break down the project into several smaller tasks, in order to make it easier to focus on one challenge at a time, without being distracted by the overall solution. In order of priority, below are are the blocks I planned:

1. High level design of which elements are needed in the game
   * Player board
   * Computer board
   * List of ships
      * Submarine (3x ◼)
      * Destroyer (3x ◼◼)
      * Cruiser (2x ◼◼◼)
      * Aircraft Carrier (1x ◼◼◼◼)
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

![Trello Backlog](docs/00_trello_backlog.png)

### <u>Features</u>

##### <u>Feature 1 - TBD</u>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut varius massa. Quisque eu elit sed odio tristique eleifend vitae vitae leo. Nunc fermentum ligula imperdiet laoreet vehicula. Fusce libero tellus, fermentum eu lobortis non, pulvinar vulputate justo. Sed lacus augue, gravida vel iaculis quis, egestas sit amet massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris venenatis pretium mattis. Suspendisse potenti. Pellentesque vulputate velit nulla, ac ornare ipsum auctor vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;

##### <u>Feature 2 - TBD</u>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut varius massa. Quisque eu elit sed odio tristique eleifend vitae vitae leo. Nunc fermentum ligula imperdiet laoreet vehicula. Fusce libero tellus, fermentum eu lobortis non, pulvinar vulputate justo. Sed lacus augue, gravida vel iaculis quis, egestas sit amet massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris venenatis pretium mattis. Suspendisse potenti. Pellentesque vulputate velit nulla, ac ornare ipsum auctor vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;

##### <u>Feature 3 - TBD</u>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut varius massa. Quisque eu elit sed odio tristique eleifend vitae vitae leo. Nunc fermentum ligula imperdiet laoreet vehicula. Fusce libero tellus, fermentum eu lobortis non, pulvinar vulputate justo. Sed lacus augue, gravida vel iaculis quis, egestas sit amet massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris venenatis pretium mattis. Suspendisse potenti. Pellentesque vulputate velit nulla, ac ornare ipsum auctor vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;

### <u>User Interaction and Experience</u>

### Control Flow Diagram

Insert image here

### <u>**Timeline**</u>

- Project Started - 02/08/19
- ...
- Project Delivered - 06/08/19

