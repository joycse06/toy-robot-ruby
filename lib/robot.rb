class Robot
  attr_accessor :face
  
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
    x = (x.to_i if /\d+/.match(x.to_s))
    y = (y.to_i if /\d+/.match(x.to_s))
    face = face.strip.upcase

    return nil if x.nil? or y.nil? or face.empty?

    if ( valid?( x, y, face ) )
      @xPos, @yPos, @face = x, y, Direction[face]
    end
    nil
  end

  def left
    return 'Ignoring command until robot is placed.' unless placed?
    @face = Direction.left @face
    nil
  end

  def right
    return 'Ignoring command until robot is placed.' unless placed?
    @face = Direction.right @face
    nil
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
    nil
  end

  def report
    return 'Ignoring command until robot is placed.' unless placed?
    "#{@xPos},#{@yPos},#{@face.to_s}"
  end

  private

  def placed?
    ! @face.nil?
  end

  def valid?( x, y , face )
     @grid.inside?( x, y ) && ! Direction[face].nil?
  end

end