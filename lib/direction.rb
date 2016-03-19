class Direction
  attr_reader :direction

  def initialize direction
    @direction = direction
  end

  def to_s
    @direction
  end

  @NORTH = Direction.new 'NORTH'
  @EAST  = Direction.new 'EAST'
  @SOUTH = Direction.new 'SOUTH'
  @WEST  = Direction.new 'WEST'

  def self.NORTH
    @NORTH
  end

  def self.EAST
    @EAST
  end

  def self.SOUTH
    @SOUTH
  end

  def self.WEST
    @WEST
  end


  def self.[](direction)
    self.instance_variable_get("@#{direction}") if self.instance_variable_defined?("@#{direction}")
  end

end