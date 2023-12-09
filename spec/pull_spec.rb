describe "Pull" do
  let(:cubes) { "12 red, 13 green, 14 blue" }
  let(:pull) { Pull.new(cubes) }

  it "should exists" do
    expect(defined?(Pull)).to be
  end

  it "should take a line and create cubes from it" do
    expect(pull.cubes).to be_a(String)
    expect(pull.blue).to be(14)
    expect(pull.green).to be(13)
    expect(pull.red).to be(12)
  end

  it "should check if a pull is invalid" do
    expect(Pull.new("3 blue, 3 green, 3 red").valid?(pull)).to be(true)
    expect(Pull.new("15 blue, 3 green, 3 red").valid?(pull)).to be(false)
    expect(Pull.new("3 blue, 3 green, 13 red").valid?(pull)).to be(false)
    expect(Pull.new("3 blue, 14 green, 3 red").valid?(pull)).to be(false)
    expect(Pull.new("20 blue, 20 green, 20 red").valid?(pull)).to be(false)
  end
end
