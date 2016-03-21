# Toy Robot Simulator
This application is a very simple simulation of a Toy Robot that moves on a tabletop.

## Simulator specification
* The Table( referred as grid inside the code ) where the robot can move freely is of dimension 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction.
* Any movement that would result in the robot falling off the table must be prevented, however further valid movements must still be allowed
* Available commands on the simulator
    1. PLACE X,Y,F
    2. MOVE
    3. LEFT
    4. RIGHT
    5. REPORT

## Environments
The application was developed on Mac OSX 10.9.5 but it should run on any *nix environments

## Installation instructions
Make sure you have [Git](https://git-scm.com/) and [Ruby 2.3.0](https://www.ruby-lang.org/en/downloads/) installed, then run the following commands from your favorite shell

```
$ git clone git@github.com:joycse06/toy-robot-ruby.git
$ cd toy-robot-ruby
$ gem install bundler
$ bundle install
```
## Operating Instructions
After you have all the depencecy installed using ```bundle install```, you can run the following from your favorite shell from within the project directory

```
$ ./lib/toy_robot_simulation.rb

```
which will start the simulator and wait for commands.

### Example Input and Output
 
```
a.
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

b.
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

c.
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```
### Running The Test Suite
The full test suite can be run using the following command

```
$ rspec spec/

```
And it will also generate the Code Coverage data using the [**SimpleCov**](http://github.com/colszowka/simplecov) gem which can be seen by opening the ```[PROJECT_ROOT]/coverage/index.html``` file into a browser or you can run the following command from terminal.

```
$ open coverage/index.html
```

## Usage
The simulator reads instructions from STDIN, executing valid commands one at a time until EOF is entered. On Unix like systems EOF can be entered using the C-d ( Ctrl + d ) combination.

## Valid commands


### PLACE X,Y,FACE
PLACE command places the robot into the specified Co-ordinate (X,Y) on table top

### Move
Moves the robot one unit forward into the table top into it's facing direction.

### LEFT and RIGHT
Rotates the robot 90 deg to the left(anti-clockwise) and right(clockwise) without changing it's position.

### REPORT
REPORT announces the position of the robot in X,Y,FACE format



## Overview

### Input format
Input is read from ```STDIN```.

For convenience of usage, Commands are intentionally **case-insesitive** and **whitespaces are ignored**. So all the following forms of PLACE commands are valid

```
PLACE X,Y,FACE
or
place x,y,face
or
place   x,   y  , face
```


### Output format
Output is printed into ```STDOUT```. The following texts are printed when invalid commands are entered

1. For invalid command like : ```HELLO``` it prints ```Invalid Command```
2. For valid command with invalid number of Arguments like : ```PLACE 1``` it prints ```Invalid Arguments```
3. For any command before the robot is placed into a valid position it prints ```Ignoring command until robot is placed.```

After robot is placed into a valid position, entering the ```REPORT``` command prints the position in the following format

``` 1,1,NORTH ```

### Design

1. **LAUNCH**
	
	```$ ./lib/toy_robot_simulation.rb```

	```toy_robot_simulation.rb``` is an executable which loads the necessary files, instantiate the simulator and run the simulation. It has the following code which is pretty self-explanatory
	
	```
	require_relative '../lib/simulator'
	simulator = Simulator.new
	simulator.startSimulation 
	```
	
2. **lib/simulatior.rb**	
	The ```startSimulation``` method starts an infinite loop and continue evaluating the commands like a ```REPL(READ.EVAL.PRINT.LOOP)``` until ```EOF``` is entered.

	Each command is delegated into a ```execute``` method which parses the command and arguments, checks if it is a valid command, if it is it then pass the commnad to an instnace of the ```Robot``` class, captures the output from the command and returns back to the REPL loop which then prints that into ```STDOUT```
	
3. **lib/grid.rb**

	The ```Grid``` class is a very simple class solely responsible for determining if a point is inside the grid, it knows the dimension of the grid.
	
4. **lib/direction.rb**

	The ```Direction``` class acts like a ```enum``` which handles everyting related to ```Directions```. It has all the directions as ```Instance variables``` of the ```Direction``` Object itself and implements ```.[]``` access methods for easier access. So directions can be access like fillowing,

	```
	Direction.EAST  Direction.SOUTH Direction.WEST Direction.NORTH
	or
	Direction['EAST'] Direction['SOUTH'] Direction['WEST'] Direction['NORTH']
	```
	It also has an array ```CLOCKWISE_DIRECTIONs``` using which it determines the the ```LEFT``` or ```RIGHT``` of a ```Direction```
	
5. **lib/robot.rb**

	The ```Robot``` class leverages the ```Grid``` and ```Direction``` class and does all the heavy-lifting. It can validate if any point is valid using the ```Grid``` class, can turn left or right using the ```Direction``` class.
	It has a ```moveTranslationVector```( which holds a vector ) which holds the ```vector``` which it uses for the ```move``` command to move the robot forward.
				

## Discussion

The simulator was designed using ```TDD``` which can be seen from the commit log. The classes were designed keeping the ```SRP(Signle Responsibility Principle)``` principle in mind. The classes are intentionally short and does only one thing.

I am still relatively new in ```Ruby``` land and was looking for an ```Enum``` data structure for directions and didn't find anything built into the language. Checked some tutorials online and came up with this solution.

I am not particularly happy with the implementation of the ```Robot``` class and it seems it's currently doing too much. Ideally for extensibility of the simulator it would have been better to offload the command execution into a different ```Module``` or maybe via implementing the ```Command Pattern```.

It would have been great it there was a reposioty of commands with a common interface, which the ```Robot``` class could use to delegate the commands to. It would make adding new commands easier.

But to keep the simulator simple and with the short list of commands it has been done like it is now.

## Future Improvements
* Seperating commands from ```Robot``` class into it's own Module/classes with a common interface. 
* Using a exception class and Throwing ```exceptions``` for invalid commnads instead of returning strings
* Allow for using other ```INPUT``` and ```OUTPUT``` sources 
* Adding ```rake``` tasks for running the spec and running the simulator easily
* Allow passing arguments into the simulator script from command line, like ```board size``` , ```input and output``` sources
* Extract the x,y positions and direction into a ```Position``` class for better encapsulation of data and lesser responsibility for the ```Robot``` class

## Contributing
Contributions are wecome and can be done by sending pull requests.

Please create [issues](https://github.com/joycse06/toy-robot-ruby/issues) for discussion or bug reports.

## License
Toy Robot Simulator is released under the [MIT License](http://www.opensource.org/licenses/MIT)
