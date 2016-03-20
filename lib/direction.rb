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

  @CLOCKWISE_DIRECTIONS = [ @NORTH, @EAST, @SOUTH, @WEST ]

  class << self
    attr_reader :NORTH, :EAST, :SOUTH, :WEST
  end

  def self.[](direction)
    self.instance_variable_get("@#{direction}") if self.instance_variable_defined?("@#{direction}")
  end

  def self.left(direction)
    @CLOCKWISE_DIRECTIONS[ ( @CLOCKWISE_DIRECTIONS.index(direction) - 1 ) % 4 ]
  end

  def self.right(direction)
    @CLOCKWISE_DIRECTIONS[ ( @CLOCKWISE_DIRECTIONS.index(direction) + 1 ) % 4 ]
  end

end