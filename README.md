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
Make sure you have [Git](https://git-scm.com/) and [Ruby 2.3.0](https://www.ruby-lang.org/en/downloads/) installed, then run the following command from your favorite shell

```
git clone git@github.com:joycse06/toy-robot-ruby.git
cd toy-robot-ruby
gem install bundler
bundle install
```
## Operating Instructions
After you have all the depencecy installed using ```bundle install```, you can run the following from your favorite shell from within the project directory

```
./lib/toy_robot_simulation.rb

```
which will start the simulator and wait for commands.

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





## License
Toy Robot Simulator is released under the [MIT License](http://www.opensource.org/licenses/MIT)
