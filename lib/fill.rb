module Draw
  # calculates which points on a grid to fill from a given initial point
  class Fill
    attr_reader :fill_content, :start_point

    def initialize(start, fill_content)
      @start_point  = start
      @fill_content = fill_content
    end

    def each_point(grid, initial_point = start_point, visited = [], &block)
      block.call(initial_point)
      visited << initial_point
      grid.points_around(initial_point)
        .reject { |point| visited.include? point }
        .each   { |point| each_point(grid, point, visited, &block) }
      grid
    end
  end
end
