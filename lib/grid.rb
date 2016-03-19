class Grid
  def initialize maxX, maxY
    @MAX_X = maxX
    @MAX_Y = maxY
  end

  def inside? x, y
    (0..@MAX_X) === x && (0..@MAX_Y) === y
  end
end