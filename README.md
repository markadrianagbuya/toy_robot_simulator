# Toy Robot Simulator
This is an implementation of the Toy Robot Simulator in Ruby based on [this specification](toy_robot_simulator_specification.md).

This solution takes into consideration a few [assumptions](#assumptions). It was built with an approach to demonstrate my coding ability and contains concepts and abstractions that may be "overkill" for such a simple task. Feel free to explore the commits to view how I arrived at this solution.

## Installation
1. Ensure `ruby v2.5.1` installed
2. Ensure `bundler` installed
3. Run `bundle install`

## Starting the Application
Run Simulation:
```
./bin/start
```

## Assumptions
* Input is via STDIN
* Invalid commands are ignored
* Commands are case sensitive
* Output is via STDOUT
* The program terminates after an "EXIT" command


## Decisions and considerations made - For reviewer

# Objects
# Architecture

# CI

## Future Improvements
* Docker Image for seamless set up
* Makefile for easy running
* More accurate representation of geometry domain concepts and formulas
