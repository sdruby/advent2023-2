require_path = File.join(__dir__, "app/**/*.rb")
Dir.glob(require_path).each { |f| require f }

class GameChecker
  attr_accessor :max_pull
  def initialize
    @parser = Parser.new(File.join(__dir__, "input.txt"))
    @max_pull = Pull.new("12 red, 13 green, 14 blue")
  end

  def valid_games
    @valid_games ||= @parser.games.select do |game|
      game.valid?(max_pull)
    end
  end

  def sum_of_valid_game_ids
    valid_games.map(&:id).sum
  end

  def sum_of_powers
    @parser.games.map(&:power).sum
  end
end

gc = GameChecker.new
puts "The answer is: #{gc.sum_of_valid_game_ids}"
puts "The sum of powers is #{gc.sum_of_powers}"
