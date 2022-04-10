[![Actions Status](https://github.com/markadrianagbuya/toy_robot_simulator/workflows/Tests%20and%20Code%20Quality%20Checks/badge.svg)](https://github.com/markadrianagbuya/toy_robot_simulator/actions)
<div align="center">
  <h1 align="center">Toy Robot Simulator 🤖</h1>

  <p align="center">
    Mark Agbuya-Cheok's implementation of the "Toy Robot Simulator" in Ruby based on [this specification](toy_robot_simulator_specification.md).
  </p>
</div>

## Approach
My approach while writing the solution to maximise maintainability such that code is easy to extend whilst not being difficult to reason about without excess indirection.

### Assumptions
This solution takes into consideration a few assumptions.

* Input is via STDIN
* Invalid commands are ignored
* Commands are case sensitive
* Output is via STDOUT

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

## Running the Tests

Run tests:
```sh
bundle exec rspec spec
```

## Design

### Classes
### Architecture

### Code Quality
Code quality is checked via the [RubyCritic gem](https://github.com/whitesmith/rubycritic). RubyCritic scores the code based on the complexity and code smells identified. I've added a check in the CI to ensure the score of the code in the `lib` directory achieves a minimum of 95/100.

### Test completeness
I utilise mutation testing via the [Mutant gem](https://github.com/mbj/mutant) to ensure test completeness. This test suite has **100% mutation coverage**.

### What is mutation testing?
Mutation testing works by changing the code slightly in a variety of ways to cause it to break, creating a "mutant" for each variety, and running the tests against the "mutant". If the tests continue to pass, then it indicates that the tests are not complete.

This method is a more precise way of checking test completeness than code coverage as relying on code coverage could lead to false positives.

### Linting
I utilise standardrb to maintain a base style
