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
    x = (x.to_i)
    y = (y.to_i)
    face = face.upcase
    if ( validate( x, y, face ) )
      @xPos, @yPos, @face = x, y, face
    end
  end

  def left

  end

  def right

  end

  def move

  end

  def report
    "#{@xPos},#{@yPos},#{@face.to_s}" if placed?
  end

  def placed?
    ! @face.nil?
  end

  private

  def validate( x, y , face )
     @grid.inside?( x, y ) && ! Direction[face].nil?
  end

end