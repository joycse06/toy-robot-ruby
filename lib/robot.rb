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
      @xPos, @yPos, @face = x, y, Direction[face]
    end
  end

  def left
    return 'Ignoring command until robot is placed.' unless placed?
    @face = Direction.left @face
  end

  def right
    return 'Ignoring command until robot is placed.' unless placed?
    @face = Direction.right @face
  end

  def move
    return 'Ignoring command until robot is placed.' unless placed?
    moveVector = @moveTranslationVector[@face.to_s]
    newX = @xPos + moveVector.first
    newY = @yPos + moveVector.last

    if @grid.inside?( newX, newY )
      @xPos = newX
      @yPos = newY
    end
  end

  def report
    return 'Ignoring command until robot is placed.' unless placed?
    "#{@xPos},#{@yPos},#{@face.to_s}"
  end

  def placed?
    ! @face.nil?
  end

  private

  def validate( x, y , face )
     @grid.inside?( x, y ) && ! Direction[face].nil?
  end

end