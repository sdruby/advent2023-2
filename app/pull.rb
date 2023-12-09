class Pull
  attr_accessor :cubes, :red, :green, :blue
  def initialize(cubes)
    @cubes = cubes
    @red = cubes.match(/(\d+) red/)&.[](1).to_i
    @green = cubes.match(/(\d+) green/)&.[](1).to_i
    @blue = cubes.match(/(\d+) blue/)&.[](1).to_i
  end

  def valid?(max_pull)
    return false if red > max_pull.red
    return false if blue > max_pull.blue
    return false if green > max_pull.green
    return true
  end
end
