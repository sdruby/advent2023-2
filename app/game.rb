class Game
  attr_accessor :line, :id, :pulls
  GAME_PATTERN = /Game (\d+):/
  def initialize(line)
    @line = line
  end

  def id
    @id ||= line.match(GAME_PATTERN)[1].to_i
  end

  def pulls
    @pulls ||= line.gsub(GAME_PATTERN, '').split(";").map do |cubes|
      Pull.new(cubes)
    end
  end

  def valid?(max_pull)
    pulls.all? do |pull|
      pull.valid?(max_pull)
    end
  end

  def power
    minimum(:red) * minimum(:green) * minimum(:blue)
  end

  # the smallest valid set, is the largest number of cubes for a given color in that set
  # for each color
  def minimum(color)
    pulls.map(&color).max
  end
end
