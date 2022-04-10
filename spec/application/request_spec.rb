require "application/request"

module Application
  RSpec.describe Request do
    describe ".valid_input?" do
      it "returns true when the input contains just a command" do
        result = described_class.valid_input?("REPORT")
        expect(result).to be_truthy
      end

      it "returns true when the input contains any upcased command" do
        result = described_class.valid_input?("COMMAND")
        expect(result).to be_truthy
      end

      it "returns true when the input contains a command and a single param" do
        result = described_class.valid_input?("COMMAND 1")
        expect(result).to be_truthy
      end

      it "returns true when the input contains a command and a single string param" do
        result = described_class.valid_input?("COMMAND NORTH")
        expect(result).to be_truthy
      end

      it "returns true when the input contains a command and integer params delimited by an comma" do
        result = described_class.valid_input?("COMMAND 1,2,3")
        expect(result).to be_truthy
      end

      it "returns true when the input contains a command and multiple param types" do
        result = described_class.valid_input?("COMMAND 1,2,NORTH")
        expect(result).to be_truthy
      end

      it "returns false when the input contains a command and multiple commands" do
        result = described_class.valid_input?("COMMAND 1,2,3 a,b,c")
        expect(result).to be_falsey
      end

      it "returns false when the input contains a lowercase command" do
        result = described_class.valid_input?("command")
        expect(result).to be_falsey
      end

      it "returns false when the input contains a command with a number" do
        result = described_class.valid_input?("COMMAND123")
        expect(result).to be_falsey
      end

      it "returns false when the input contains only params" do
        result = described_class.valid_input?("A,1,2")
        expect(result).to be_falsey
      end
    end

    describe ".from_input" do
      it "returns a request object with command_name and params from an input with just a command" do
        request = described_class.from_input("COMMAND")
        expect(request).to have_attributes(command_name: "COMMAND", params: nil)
      end

      it "returns a request object with command_name and nil params from an input with a command and params" do
        request = described_class.from_input("COMMAND 1,2,ABC")
        expect(request).to have_attributes(command_name: "COMMAND", params: "1,2,ABC")
      end

      it "raises an error if the input is invalid" do
        expect { described_class.from_input("COMMAND 1,2,ABC 3,4") }.to raise_error(
          Request::ParserError,
          "Input 'COMMAND 1,2,ABC 3,4' does not match request format"
        )
      end
    end

    describe "attributes" do
      it "has the attributes command_name and params" do
        expect(described_class.new("COMMAND", "PARAMS")).to have_attributes(command_name: "COMMAND", params: "PARAMS")
      end
    end
  end
end
