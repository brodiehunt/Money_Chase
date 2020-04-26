# README

## Purpose of Money Chase(snake)

The purpose of the terminal application Money Chase is to bring a fun and amusing twist to the original game 'snake'. When the application is run in the terminal, the user will be greeted with a menu and prompted to create either a random or customised username. When a username has been created, the user will then be allowed to start the game. When the user opens the game window, they will be greeted with a welcome page which will inform them how to interact with the game. This will include instructions on how to move the snake, start the game, restart the game, or quit at any time. When the user is ready, they can begin playing by following the instructions of the application. Once the user has indicated they are ready to play, the game will begin, and they will have access to control the snake with the keybinds outlined. When the user dies, they will be told their score and given instruction to either quit the application or restart the game. The objective of the game is simple. Collect as many coins as possible before running into yourself or an enemy. The more coins collected, the higher your score will be. Every time you collect a coin, you will grow and hence the mission becomes harder. The higher your score, the more enemy objects you have to avoid to continue your collection of coins. Due to the simple objective and minimal user controls, 'wsad', yet increasing complexity as you progress, the game Money Chase aims to target a wide demographic of people looking for a fun and entertaining gaming experience. It solves the problem of isolation boredom in a stimulating and strangely addicting way. 

## Features

#### Opening Prompt using TTY-Prompt

This feature will be used at the begining of the application. When the program is run a display object is created and assigned to a variable 'prompt'. 'prompt' is an object of the Display class and the Display class is a child class of Prompt class from the tty-prompt gem. The Display class initializes an additional instance variable '@username' whos value determines the options in the prompt printed to the screen. The Display class method 'options_array' takes the instance variable 'username' as an argument allowing program to control what the user can select from the prompt, depending on the 'username' instance variable value.  The initial menu prompt will be printed to the terminal. This will give the user the option to create a username or quit. In order to progress the user must create a valid username, which can either be random, or customised. The username must meet specific requirements for the user to continue, if these requirements are not met, a message will be displayed informing the user of what they must do. Conditional statements are used to control the progression of the program based on the user seletion from the prompt. This entire feature is placed inside a continuous loop which breaks when the user selects the 'quit' option from the prompt. 

#### The Snake

The snake is an object of the class Trump which is created when the program is run. When the snake object is created, three instance variables are intialized, 'location', 'increase_size' and 'direction'. The location instance is set to a two dimensional array at the left side of the window, the direction is set to right, and increase_size is set to false. The movement of the snake is acheived by deleting the first index in the two dimensional array 'location', and pushing a new array into the two dimensional array in the current direction of the snakes movement. This is all acheived in the class method 'move_trump'. The direction instance variable is given an attribute accessor so it can be changed according to user input, and used outside of the Trump class. The class method draw is responsible to itterating through the two dimensional array and displaying an Image object to the screen at his current coordinates. Conditional control is used to prevent the snake from leaving the screen, or turning directly back into itself. The trump object in the game window will also interact with other objects, causing the game to progress and increase in difficulty. This class also contains methods which allow access to the objects location from outside the class. This is used for collision detection between the snake object, and other objects in the game window. 

#### The Coins

The coin is an object of the class Coin and is created when the program is run. The coin object is displayed to game window at a random coordinate and can be 'collected' by the snake object resulting in the users score to increase, and the introduction of another enemy object. When the coin is created, random x and y values are initialized. The coin is drawn to the screen using the draw method which creates a Sprite object at the coordinates of the coin. When the head of the snake object and the coin object are at the same location, a method is called to reset the x and y coordinates of the coin which causes it to be drawn at a different location. A method of the coin class 'trump_collect' takes the coordinates of the snakes head as an argument. It returns a boolean depending on whether the two objects are at the same location. This is used to control the game flow in the update loop of the game. 

#### The Update method 

The update method allows us to enter the update loop and make changes to the game window as time passes. Within this loop is where the methods of the above objects are called. Each time the loop cycles the window is cleared using the clear method, and the methods are called again depending on the current situation of the game. Within this update loop conditional statements are used to control the game flow. For example, if the trump_collect method returns true, then a set of other methods will be called to increase the score, iniate another enemy object, and to re-assign the value of the x and y instance variables for the coin. The control flow within this loop is critical to creating a seamless game. 

## User Interaction and Experience

- The user will initially be greeted by a prompt which will allow them to either create username or quit the application. The tty-prompt gem is used for this prompt the select method used automatically displays user controls for navigating the prompt. In this case it is the arrow keys up and down, and enter to select. [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/initial_prompt.png)
- The user will then be taken to another menu where they are prompted to either choose a random or custom username. If a random username is chosen they will be taken back to the initial menu prompt, but now they will be able to select the play option, or how to play option. If the user chooses the custom option, they will be asked to create a username, if the try to enter no username and continue, they will recieve a message telling them that a username must be provided. Once they have entered a valid username, they will be taken back to the main menu prompt where they can quit, change username, find out how to play, or play. 
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/username_option.png)
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/username_validate.png)
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/second_prompt.png)
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/how_to_play.png)
- If the user decides to change their username, they will be looped back into the username selection experience. If the user selects quit, the program shuts down. If the user selects play, the game window opens and the update loop is initiated. 
- When the user first enters the game window, they are greeted with a introduction screen which informs them of the available user inputs. These are 'wsad' for movement, 'r' to restart, 't' to quit, and 'any other button' to play. 
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/start_game.png)
- When the user presses any button other than 'r' or 't' the game begins and the snake object, coin object, and score are all printed to the screen. The user then has control of the game using the outlined input function until they die. If the user presses a button that does not have a specific function (anything that isn't wsadrt) a small prompt will appear on the screen telling them to press a valid key 
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/in_game.png)
- When the user dies, an end game screen will appear which tells the user their score, and how to continue from there. If the user would like to play again, they are told to press 'r', if they would like to quit, they are told to press 't'. If the user input is 'r', they are taken to the original starting page showing them how to play the game. If the use input is 't', the window is closed and the application ends.
- [](https://github.com/brodiehunt/Money_Chase/blob/master/docs/End_game.png)

## Control Flow Diagram

[](https://github.com/brodiehunt/Money_Chase/blob/master/docs/flowchart.png)

## Implementation Plan

- | Feature                     | Outline                                                      | Checklist                                                    |
  | --------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | Coin                        | The colletable coins in the game will be implemented by creating a coin class that will contain methods to draw the coin to the screen, assess whether the coin has been collected by taking other objects coordinates as an argument, and reset the coins x and y instance variables once the coin has been collected. Using the Ruby2d gem will provide the functionality to create coin image objects and draw them to the window. | Create coin class and initialize method which contains x and y instance variables. These will be set to random grid value. (Priority = High).                                    Create method to determine if coin has been collected. (Priority = high).             Create method to change coin instance variables x and y when a coin has been collected. (Priority = high).                           Use ruby 2d functions to get the coin to appear as if it is rotating. (Priority = low) |
  | Trump                       | Trump(snake) object will be created using a class Trump. When the object is created it will initialize three instance variables (location, increase_size, and direction). The snake will be represented as a two dimensional array that has its first index deleted and an array pushed in the direction of its movement every time the update method loops. When the snake collects a coin, the instance variable increase_size will be flipped to true, and the snake will increase by one. This class will contain methods that will allow the snake to move, be drawn to the window, access the x and y coordinates of the snakes head, prevent the snake from leaving the window, and determine whether the snake has collided with itself. These methods will be called on the snake object from within the update loop. | Create class and initialize method (Priority = high)                                                      Create move and draw methods for the snake (Priority = High)                        Create method to get the snakes head coordinates and its x and y coordinates individually (priority=high)                 Create a method that will detect for collisions with itself (priority = high) Create a method that will check for collisions with the window border (priority = high)                                           Create a method that will flip the value of the instance variable to true when called. (Priority = high)                                          Get the image of trump to flip when directions are changed (priority = low) Get the object to look like its walking (sprite). (Priority = low) |
  | Enemy                       | The enemy object will be created using class Enemy. It is similar to the trump class in that the enemies will be an array of coordinates (2d array) which will increase in size every time a coin is collected. The initiailize method will contain the instance variables ‘location’, which will start as an empty array, and ‘enemy_collide’ which will be set to false. This class will contain an add_enemy method which will push a random coordinate (array) into the instance variable ‘location’ every time the coin is collected. It will contain a method that will draw the array to the screen by creating a square object at every coordinate in the location array. These methods will be called in the update loop. Condition statements will control which method is called every time the update loop is executed. | Create class and initialize method. (Priority = high)                                       Create method that draws enemy to the window (Priority = high)                                     Create method that pushes a new random array into the @location instance variable. This will be called when a coin is collected. (Priority = high)                                      Create a method that checks if the snake has collided with and enemy by iterating through the @location array and comparing every value to that of the coordinates of the snakes head. When the condition is true, flip the @enemy_collide instance variable too true. (Priority = high)                                                        Create a extra functionality that will prevent an enemy from spawning within 4 grids of the snakes head. (Priority = low) |
  | TTY-Prompt and opening menu | The opening menu will introduce the user to the game and prompt them to create a username, they will be able to create a random user name or customised username as long as it is valid. Once this is done they will be taken back to a prompt where they will able to enter the game. This section will make use of three gems (tty-prompt, colorize, faker). A class ‘Display’ will be created that inherits from the class Prompt in the tty gem. This class will allow the prompt to be customised depending on the value of instance variables of the display class. (Forcing the user to create a username before being able to enter the game) | Create display class and initialize method. (Priority = high)                                       Create a method which will change the options array for the menu prompt based on the value of the instance variable ‘username’ (priority = high)                   Give the username instance variable an attribute accessor (priority = high) Integrate the prompt into a functioning loop that breaks if particular conditions are met.(priority = high)                       Integrate the faker gem to generate a random name (priority = low)        Integrate the colorise gem to make the initial title and display visually appealing.(priority = low)                                           Use tty-prompt gem to reduce difficulty of user input options. (Priority = high) |
  | Game                        | This is a class created to display different text and images to the screen depending the what stage the user is at within the game Window. It will initialize an instance variable ‘game_stage’ which will default be set to ’start’. This instance variable will be given an attribute accessor. This class will contain a method draw which will draw text to the screen depending on what the value of the game_stage variable is. The game_stage variable will change depending on user input, or particular situations within the game (end game etc). This class will also have an instance variable score, and a method that will increase the score by 10 each time it is called. The instance variable ‘game_stage’ will be critical to the control flow of the game. And will be responsible for displaying the start screen, game screen and end screen in the game window. | Create class and initialize method (priority = high)                                                     Create a draw method (priority = medium)                                                   Create a method that will return a value of which text and image objects to draw depending on what stage of the game the player is currently at. (Priority = medium)                                                      Create method that increases score by 10 every time it is called (priority = low)      Find images to be drawn to the screen for these different game-stages. (Priority = low) |
  | Update loop                 | This is where all the methods of each object will be called and condition statements and control flow be implemented in order to make the game run smoothly. This function is from the ruby 2d gem, and it is an infinite loop that I have set to loop 10 times per second. Each time the loop is called the entire window is cleared and then redrawn depending on the conditions that control the game. | Implement conditional statements to allow particular methods of each object to be called under the right circumstances. (Priority = high) |
  | User input and game control | This is done using ruby 2d and allows the window to capture keyboard events. This function will be how to user controls the the snake, navigates through game stages and quits the program. It is here that the direction instance variable of the snake will be set when the right conditions are met. | Allow user to change direction instance variable of the snake object if they press the required key. (Priority = high)            Set a conditional statement that forbids the snake from changing direction so it would enter itself (if up cannot go down) (priority = high)                                                        Add functionality to a key (r) so the game can be restarted (priority = high)              Add functionality to a key (t) so the game can be exited (priority = high)                 Add functionality to every other key to allow the use to start playing the game.  (priority = high) |

## Application Testing

| Feature                                  | Test Case                                                    | Test Data                                                    | Expected Result                                              | Actual result | Status |
| ---------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------- | ------ |
| TTY -Prompt.                             | Checking the the application doesnt encounter bugs when random keyboard inputs entered. | 'qwertyuioplkjhgfdsazxcvbnmb'                                | Program will continue running untill up and down keys are used to navigate prompt. | As expected   | pass   |
| TTY-Prompt.                              | Check the username validation on entering username           | no username entered.                                         | message informing user that the username is required.        | As expected   | Pass   |
| trump_collide method.                    | Checking whether the game reacts to the snake hitting a coin by moving the coin and increasing score. | snake run into a coin.                                       | the coin will change location, an enemy will spawn and the score will increase by 10. | As expected   | Pass   |
| checking border collision functionality. | Check to see whether the snake will leave the window.        | run snake into border, and allow to rotate around the window naturally. | snake will collide with the window borders and stay within the main game window. | As expected   | Pass   |
| Exit key bind                            | check to see whether the game can be exited at anytime using 't', keybind. | pressing 't' in the start menu, during the game, and at the end. | The window should be closed regardless of when the user presses 't' | As expected   | pass   |
| restart key bind                         | check to see whether the game can be restarted at any time using the 'r' keybind. | Pressing 'r' in the start menu, during the game, and the end. | The game will be restarted and the user will be taken to the start page. | As expected   | Pass   |
| the hit_itself method                    | check to see whether the hit_itself method works and the game finishes when the snake collides with itself. | Run the snake into itself.                                   | The game will end and the user will be taken to the end game screen. | As Expected   | Pass   |
| enemy collision detection                | check to see whether the game end when the snake collides with an enemy object | run the snake into an enemy object                           | The game will end and the user wil be taken to the end game screen. | As Expected   | Pass   |
|                                          |                                                              |                                                              |                                                              |               |        |



## Status Update

#### Wednesday 22nd 

 I used most of today to get an understanding of the ruby2d gem and how I would apply it to make my game of snake. I was able to create an extremely rough version with limited functionality. But the core concepts of the snake, coins and score were all there. Spent some time focusing on my implementation plan and how I would integrate the game which uses ruby2d with a menu run in the terminal.

#### Saturday 25th

Today I started Implementing all of what I had experimented with and built a lot of my app from scratch. I created my GitHub repository for my project and have pushed my code to it a few times today. I have completed a lot of my software development plan. I am using my trello board to try to stay on top of what I need to do. 

#### Sunday 26th

Today I added my software development plan to a readme file and pushed it to github. I also added enemies to my game, and made some changes to the initial prompt, which included creating a 'how to play' option which describes how to play the game before you enter the window. I just completed writing my manual tests, ready for testing tomorrow. I also put together my presentation for Tuesday. Something happended with my remote repository. It wasn't pushing my new changes to GitHub despite it saying that it was all up to date. This made me extremely nervous, so after a while of no success a created a new git repo, made a copy of my local repository and pushed it all to github in a new repository. This is unfortunate because all of my commit history is now unaccessable from my current repository. 

#### Monday 27th





####  