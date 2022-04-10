[![Actions Status](https://github.com/markadrianagbuya/toy_robot_simulator/workflows/Tests%20and%20Code%20Quality%20Checks/badge.svg)](https://github.com/markadrianagbuya/toy_robot_simulator/actions)

<div align="center">
  <h1 align="center">Toy Robot Simulator 🤖</h1>

  <p align="center">
    Mark Agbuya-Cheok's implementation of the "Toy Robot Simulator" in Ruby
  </p>
</div>

## Approach
My approach while writing the solution to maximise maintainability such that code is easy to extend whilst not being difficult to reason about without excess indirection.

### Assumptions
This solution is based on [this specification](toy_robot_simulator_specification.md).

This solution takes into consideration a few assumptions:
* Input is via STDIN
* Output is via STDOUT
* Invalid commands are ignored
* Commands are case sensitive

## Setup

Install dependencies:
```sh
bundle install
```

## Starting the Application

Run Simulation:
```sh
./bin/start
```

## Testing and Checks

Run tests:
```sh
bundle exec rspec spec
```

Run mutant:
```sh
bundle exec mutant run
```

Run StandardRB lint:
```sh
bundle exec standardrb
```

Run RubyCritic code quality checks:
```sh
bundle exec rubycritic lib
```

## Design

### Architecture

I split the code into two main namespaces: `Application` and `ToyRobotSimulation`.

The `Application` namespace contains the code about the details on how the user interacts with the application, interpreting that input and calling the necessary domain objects.

The `ToyRobotSimulation` namespace contains the code related to the simulation, robot and board. The classes here are mainly domain objects which are designed to be useable in any context and decoupled from the details of the user interface (i.e., the classes would still be useable in a web interface or an API etc.)

### Code Quality

Code quality is checked via the [RubyCritic gem](https://github.com/whitesmith/rubycritic). RubyCritic scores the code based on the complexity and code smells identified. I've added a check in the CI to ensure the score of the code in the `lib` directory achieves a minimum of 95/100.

![Ruby_Critic_-_Home](https://user-images.githubusercontent.com/4326858/162619445-8f1a2ed5-d144-4ce2-9e1d-e5e8f497c6e0.png)

### Test completeness

I utilise mutation testing via the [Mutant gem](https://github.com/mbj/mutant) to ensure test completeness. This test suite has **100% mutation coverage**.

#### What is mutation testing?

Mutation testing works by changing the code slightly in a variety of ways to cause it to break, creating a "mutant" for each variety, and running the tests against the "mutant". If the tests continue to pass, then it indicates that the tests are not complete.

This method is a more precise way of checking test completeness than code coverage as relying on code coverage could lead to false positives.

### Linting

I utilise the [standard gem](https://github.com/testdouble/standard) to maintain a good and consistent style. Standard has no configuration, meaning no decisions and a consistent style throughout the code base.
