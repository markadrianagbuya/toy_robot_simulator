require "application/command_controller"
require "application/console_io"
require "toy_robot_simulation/simulation"

module Application
  RSpec.describe CommandController do
    describe "#execute" do
      it "does nothing if the command is an invalid request" do
        controller = described_class.new(double, double)
        expect(controller.execute("invalid command")).to be_nil
      end

      it "does nothing if the command is a valid request but not a handled command" do
        controller = described_class.new(double, double)
        expect(controller.execute("COMMAND")).to be_nil
      end

      context "when command is PLACE" do
        it "does nothing if the params are not valid" do
          controller = described_class.new(double, double)
          expect(controller.execute("PLACE invalid,params")).to be_nil
        end

        it "calls place on simulation with valid params" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("PLACE 1,2,NORTH")

          expect(simulation).to have_received(:place_robot).with(1, 2, "NORTH")
        end
      end

      context "when command is MOVE" do
        it "calls move on simulation" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("MOVE")

          expect(simulation).to have_received(:move_robot)
        end

        it "ignores params and calls move on simulation" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("MOVE 1,2,3")

          expect(simulation).to have_received(:move_robot)
        end
      end

      context "when command is LEFT" do
        it "calls turn_robot_left on simulation" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("LEFT")

          expect(simulation).to have_received(:turn_robot_left)
        end

        it "ignores params and calls turn_robot_left on simulation" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("LEFT 1,2,3")

          expect(simulation).to have_received(:turn_robot_left)
        end
      end

      context "when command is RIGHT" do
        it "calls turn_robot_right on simulation" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("RIGHT")

          expect(simulation).to have_received(:turn_robot_right)
        end

        it "ignores params and calls turn_robot_right on simulation" do
          simulation = instance_double(ToyRobotSimulation::Simulation).as_null_object
          controller = described_class.new(simulation, double)

          controller.execute("RIGHT 1,2,3")

          expect(simulation).to have_received(:turn_robot_right)
        end
      end

      context "when command is REPORT" do
        it "prints the simulation report to io" do
          simulation = instance_double(ToyRobotSimulation::Simulation, report: "a report").as_null_object
          io = instance_double(ConsoleIO).as_null_object

          controller = described_class.new(simulation, io)

          controller.execute("REPORT")

          expect(io).to have_received(:print).with("a report")
        end

        it "prints the simulation report to io and ignores extra params" do
          simulation = instance_double(ToyRobotSimulation::Simulation, report: "a report").as_null_object
          io = instance_double(ConsoleIO).as_null_object

          controller = described_class.new(simulation, io)

          controller.execute("REPORT 1,2,3")

          expect(io).to have_received(:print).with("a report")
        end
      end
    end
  end
end
