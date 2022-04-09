require 'application/console_io'
require 'stringio'

module Application
  RSpec.describe ConsoleIO do
    describe "#print" do
      it "writes to output" do
        output = StringIO.new
        console_io = described_class.new(input: double, output: output)

        console_io.print("Hello World")

        expect(output.string).to eq("Hello World\n")
      end

      it "writes to output delimited by a newline when printed multiple times" do
        output = StringIO.new
        console_io = described_class.new(input: double, output: output)

        console_io.print("Hello World")
        console_io.print("Foo Bar")

        expect(output.string).to eq("Hello World\nFoo Bar\n")
      end
    end

    describe "#read_input" do
      it "returns the stripped string from input" do
        input = StringIO.new("COMMAND  ")

        expect(described_class.new(input: input, output: double).read_input).to eq "COMMAND"
      end

      it "returns the stripped strings from multiple commands" do
        input = StringIO.new("COMMAND  \n OTHERCOMMAND\n")
        console_io = described_class.new(input: input, output: double)

        expect(console_io.read_input).to eq "COMMAND"
        expect(console_io.read_input).to eq "OTHERCOMMAND"
      end
    end
  end
end
