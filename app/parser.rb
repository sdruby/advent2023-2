class Parser
  attr_accessor :file_path
  def initialize(file_path)
    @file_path = file_path
    @games = parse
  end

  def file
    @file ||= File.open(@file_path)
  end

  def games
    @games ||= []
  end

  private
  def parse
    file.lines.map do |line|
      Game.new(line)
    end
  end
end
