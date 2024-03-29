require "application/runner"
require "application/console_io"
require "helpers/loop_helper"

module Application
  RSpec.describe Runner do
    include LoopHelper

    describe "#run" do
      it "loops, reading and executing commands" do
        io = instance_double(ConsoleIO).as_null_object
        allow(io).to receive(:read_input).and_return("PLACE 1,2,NORTH", "MOVE", "REPORT")

        command_controller = instance_double(CommandController).as_null_object

        runner = described_class.new(io, command_controller)
        stop_loop_after_n_iterations(runner, 3)
        runner.run

        expect(command_controller).to have_received(:execute).with("PLACE 1,2,NORTH")
        expect(command_controller).to have_received(:execute).with("MOVE")
        expect(command_controller).to have_received(:execute).with("REPORT")
      end

      it "doesn't error on invalid commands" do
        io = instance_double(ConsoleIO).as_null_object
        allow(io).to receive(:read_input).and_return("PLACE 1,2,NORTH", "INVALID", "REPORT")

        command_controller = instance_double(CommandController).as_null_object

        runner = described_class.new(io, command_controller)
        stop_loop_after_n_iterations(runner, 3)

        expect { runner.run }.to_not raise_error

        expect(command_controller).to have_received(:execute).with("PLACE 1,2,NORTH")
        expect(command_controller).to have_received(:execute).with("REPORT")
      end

      it "prints a welcome message" do
        io = instance_double(ConsoleIO).as_null_object
        command_controller = instance_double(CommandController).as_null_object

        runner = described_class.new(io, command_controller)

        stop_loop_after_n_iterations(runner, 0)

        runner.run

        expect(io).to have_received(:print).with(/Welcome/)
      end

      it "prints a command prompt" do
        io = instance_double(ConsoleIO).as_null_object
        allow(io).to receive(:read_input).and_return("PLACE 1,2,NORTH", "INVALID", "REPORT")

        command_controller = instance_double(CommandController).as_null_object

        runner = described_class.new(io, command_controller)
        stop_loop_after_n_iterations(runner, 1)

        runner.run

        expect(io).to have_received(:print).with("Enter a command: ")
      end
    end
  end
end
