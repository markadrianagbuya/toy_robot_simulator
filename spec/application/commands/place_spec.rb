require 'application/commands/place'

module Application
  module Commands
    RSpec.describe Place do
      describe ".valid_params?" do
        it "returns true when valid params are passed" do
          expect(described_class.valid_params?("1,2,NORTH")).to be_truthy
        end

        it "returns true when x and y params have multiple digits" do
          expect(described_class.valid_params?("12,34,NORTH")).to be_truthy
        end

        it "it returns false if the y param is missing" do
          expect(described_class.valid_params?("1,,NORTH")).to be_falsey
        end

        it "it returns false if the x param is missing" do
          expect(described_class.valid_params?(",2,NORTH")).to be_falsey
        end

        it "it returns false if the direction param is missing" do
          expect(described_class.valid_params?("1,2,")).to be_falsey
        end

        it "it returns false if the direction param is not north, east, south or west" do
          expect(described_class.valid_params?("1,2,SOUTHEAST")).to be_falsey
        end

        it "it returns false if the direction param is not upcased" do
          expect(described_class.valid_params?("1,2,north")).to be_falsey
        end

        it "it returns false if the params are in the wrong order" do
          expect(described_class.valid_params?("NORTH,1,2")).to be_falsey
        end

        it "it returns false if the params are the wrong type" do
          expect(described_class.valid_params?("one,2,NORTH")).to be_falsey
        end

        it "it returns false if the params are the not integers" do
          expect(described_class.valid_params?("1.2,2.1,NORTH")).to be_falsey
        end

        it "it returns false if the params are in the completely wrong format" do
          expect(described_class.valid_params?("wrongformat")).to be_falsey
        end
      end

      describe ".from_params" do
        it "returns a place command with an x and y position integers and direction name string" do
          place_command = described_class.from_params("1,2,NORTH")
          expect(place_command).to have_attributes(x_position: 1, y_position: 2, direction_name: "NORTH")
        end

        it "returns a place command with an x and y position and direction name for larger inputs" do
          place_command = described_class.from_params("12,34,SOUTH")
          expect(place_command).to have_attributes(x_position: 12, y_position: 34, direction_name: "SOUTH")
        end

        it "raises an error if the params are invalid" do
          expect { described_class.from_params("A,B,12")}.to raise_error(Place::InvalidParams, "Cannot parse params: 'A,B,12'")
        end
      end

      describe "attributes" do
        it "has the attributes x_position, y_position and direction_name" do
          expect(described_class.new(3, 1, "SOUTH")).to have_attributes(
            x_position: 3,
            y_position: 1,
            direction_name: "SOUTH"
          )
        end
      end
    end
  end
end
