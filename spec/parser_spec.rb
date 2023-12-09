describe Parser do
  let(:file_path) { File.join(__dir__, "../input.txt") }
  let(:parser) { Parser.new(file_path) }

  it "should exists" do
    expect(defined?(Parser)).to be
  end

  describe "#initialize" do
    it "should take a file path and store it" do
      parser = Parser.new(file_path)
      expect(parser.file_path).to eq(file_path)
    end

    it "throws an exception if no path is given" do
      expect { Parser.new }.to raise_error(ArgumentError)
    end

    it "creates an array of games" do
      expect(parser.games).to be_a(Array)
      expect(parser.games.first).to be_a(Game)
    end
  end

  describe "#file" do
    it "returns a file if the file exists" do
      expect(parser.file).to be_a(File)
    end

    it "throws an exception if the file does not exist" do
      expect { Parser.new("foo").file }.to raise_error(Errno::ENOENT)
    end
  end
end
