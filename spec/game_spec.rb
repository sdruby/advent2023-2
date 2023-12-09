describe Game do
  let(:line) { "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"}

  it "should exists" do
    expect(defined?(Game)).to be
  end

  it "should take a line and create pulls from it" do
    game = Game.new(line)
    expect(game.pulls).to be_a(Array)
    expect(game.pulls.first).to be_a(Pull)
  end

  it "should check if a game is valid" do
    game = Game.new(line)
    expect(game.valid?(Pull.new("12 red, 13 green, 14 blue"))).to be(true)
    expect(game.valid?(Pull.new("9 blue, 3 green, 3 red"))).to be(false)
    expect(game.valid?(Pull.new("3 blue, 3 green, 20 red"))).to be(false)
    expect(game.valid?(Pull.new("3 blue, 8 green, 3 red"))).to be(false)
    expect(game.valid?(Pull.new("1 blue, 1 green, 1 red"))).to be(false)
  end

  it "should check if a game is really valid" do
    max_pull = Pull.new("12 red, 13 green, 14 blue")
    expect(Game.new("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green").valid?(max_pull)).to be(true)
    expect(Game.new("Game 2: 300 blue, 4 red; 1 red, 2 green, 6 blue; 2 green").valid?(max_pull)).to be(false)
    expect(Game.new("Game 3: 3 blue, 4 red; 300 red, 2 green, 6 blue; 2 green").valid?(max_pull)).to be(false)
    expect(Game.new("Game 4: 3 blue, 4 red; 1 red, 2 green, 6 blue; 200 green").valid?(max_pull)).to be(false)
    expect(Game.new("Game 5: 30 blue, 40 red; 100 red, 20 green, 60 blue; 20 green").valid?(max_pull)).to be(false)
  end
end
