require_relative 'direction'
require_relative 'grid'
require_relative 'robot'

class Simulator
  def initialize( boardSize = 5, output = STDOUT )
    @grid   = Grid.new( boardSize - 1, boardSize - 1 )
    @robot  = Robot.new( @grid )
    @output = output
  end

  def execute( command )
    return if command.strip.empty?
    command = command.strip.downcase
    # splits the command and the argument
    op, args = command.split( /\s+/, 2 )
    # further split the args if command has arguments, e.g. PLACE command
    args = args.split( /\s*,\s*/ ) if args

    return 'Invalid Command' unless Robot.public_method_defined?( op )
    begin
      result = @robot.send( op, *args )
      return result if result
    rescue ArgumentError
      return 'Invalid Arguments'
    end
  end

  def startSimulation( input = STDIN )
    command = input.gets
    # start the REPL( Read, Eval, Print Loop )
    while command
      result = execute( command )
      @output.puts result if result
      command = input.gets
    end
  end

end