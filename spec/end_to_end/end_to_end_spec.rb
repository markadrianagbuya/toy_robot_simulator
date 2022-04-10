require "application"
require "helpers/loop_helper"
require "helpers/stdin_helper"

RSpec.describe "End to end behaviour" do
  include LoopHelper
  include StdinHelper

  it "works with provided example (a)" do
    inputs = <<~INPUT
      PLACE 0,0,NORTH
      MOVE
      REPORT
    INPUT

    expect { run(inputs) }.to output(/Output: 0,1,NORTH/).to_stdout
  end

  it "works with provided example (b)" do
    inputs = <<~INPUT
      PLACE 0,0,NORTH
      LEFT
      REPORT
    INPUT

    expect { run(inputs) }.to output(/Output: 0,0,WEST/).to_stdout
  end

  it "works with provided example (c)" do
    inputs = <<~INPUT
      PLACE 1,2,EAST
      MOVE
      MOVE
      LEFT
      MOVE
      REPORT
    INPUT

    expect { run(inputs) }.to output(/Output: 3,3,NORTH/).to_stdout
  end

  it "can handle the robot placed in multiple positions" do
    inputs = <<~INPUT
      PLACE 3,2,EAST
      MOVE
      PLACE 1,2,NORTH
      MOVE
      REPORT
    INPUT

    expect { run(inputs) }.to output(/Output: 1,3,NORTH/).to_stdout
  end

  it "can handle walking in a circle" do
    inputs = <<~INPUT
      PLACE 1,1,NORTH
      MOVE
      MOVE
      RIGHT
      MOVE
      MOVE
      RIGHT
      MOVE
      MOVE
      RIGHT
      MOVE
      MOVE
      RIGHT
      REPORT
    INPUT

    expect { run(inputs) }.to output(/Output: 1,1,NORTH/).to_stdout
  end

  it "ignores invalid commands before a placement" do
    inputs = <<~INPUT
      REPORT
      MOVE
      LEFT
      RIGHT
      PLACE 4,4,EAST
      REPORT
    INPUT

    expect { run(inputs) }.to output(/Output: 4,4,EAST/).to_stdout
  end

  def run(inputs)
    with_stubbed_stdin(inputs) do
      runner = Application.with_default_configuration

      stop_loop_after_n_iterations(runner, inputs.split("\n").size)

      runner.run
    end
  end
end
