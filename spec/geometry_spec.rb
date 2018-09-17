require 'geometry'
require 'position'

module Geometry
  RSpec.describe PolarVector do
    describe "#translate_position" do
      context "when the angle is 0" do
        it "translates the position based on the magnitude and angle of the vector" do
          vector = PolarVector.new(polar_angle: 0, magnitude: 1)

          translated_position = vector.translate_position(Position.new(x: 0, y: 0))
          expect(translated_position.x).to eq 1
          expect(translated_position.y).to eq 0

          translated_position = vector.translate_position(Position.new(x: 3, y: 3))
          expect(translated_position.x).to eq 4
          expect(translated_position.y).to eq 3
        end
      end

      context "when the angle is 90" do
        it "translates the position based on the magnitude and angle of the vector" do
          vector = PolarVector.new(polar_angle: 90, magnitude: 1)

          translated_position = vector.translate_position(Position.new(x: 0, y: 0))
          expect(translated_position.x).to eq 0
          expect(translated_position.y).to eq 1

          translated_position = vector.translate_position(Position.new(x: 3, y: 3))
          expect(translated_position.x).to eq 3
          expect(translated_position.y).to eq 4
        end
      end

      context "when the angle is 180" do
        it "translates the position based on the magnitude and angle of the vector" do
          vector = PolarVector.new(polar_angle: 180, magnitude: 1)

          translated_position = vector.translate_position(Position.new(x: 1, y: 1))
          expect(translated_position.x).to eq 0
          expect(translated_position.y).to eq 1

          translated_position = vector.translate_position(Position.new(x: 3, y: 3))
          expect(translated_position.x).to eq 2
          expect(translated_position.y).to eq 3
        end
      end

      context "when the angle is 270" do
        it "translates the position based on the magnitude and angle of the vector" do
          vector = PolarVector.new(polar_angle: 270, magnitude: 1)

          translated_position = vector.translate_position(Position.new(x: 1, y: 1))
          expect(translated_position.x).to eq 1
          expect(translated_position.y).to eq 0

          translated_position = vector.translate_position(Position.new(x: 3, y: 3))
          expect(translated_position.x).to eq 3
          expect(translated_position.y).to eq 2
        end
      end
    end
  end
end
