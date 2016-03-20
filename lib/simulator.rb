class Simulator
  def initialize( boardSize = 5, output = STDOUT )
    @grid   = Grid.new( boardSize - 1, boardSize - 1 )
    @robot  = Robot.new( @grid )
    @output = output
  end

  def execute( command )
    command = command.strip.downcase
    # splits the command and the argument
    op, args = command.split( /\s+/, 2 )
    # further split the args if command has args, covers PLACE command
    args = args.split(/\s*,\s*/) if args

    return 'Invalid command' unless Robot.public_method_defined?(op)
    begin
      output = @robot.send(op, *args)
      return output if output
    rescue
      return 'Invalid arguments'
    end
  end
  
end