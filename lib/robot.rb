class Robot
  attr_accessor :xPos, :yPos, :face, :grid, :moveTranslationVector

  def initialize( grid )
    @grid     = grid
    @moveTranslationVector = {
        Direction.WEST.to_s  => [ -1,  0 ],
        Direction.EAST.to_s  => [ +1,  0 ],
        Direction.NORTH.to_s => [  0, +1 ],
        Direction.SOUTH.to_s => [  0, -1 ]
    }
  end

  def place( x, y, face )

  end

  def report

  end

  def placed?
    @face.nil?
  end

end