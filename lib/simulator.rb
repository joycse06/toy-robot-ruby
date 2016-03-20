class Simulator
  def initialize( boardSize = 5, output = STDOUT )
    @grid   = Grid.new( boardSize - 1, boardSize - 1 )
    @robot  = Robot.new( @grid )
    @output = output
  end

  def execute( command )

  end
end