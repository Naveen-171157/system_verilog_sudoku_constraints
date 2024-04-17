# Sudoku Solver Using Randomization and Constraints
## Overview
This SystemVerilog code implements a Sudoku solver using randomization and constraints. Sudoku is a popular logic-based number-placement puzzle where the objective is to fill a 9x9 grid with digits so that each column, each row, and each of the nine 3x3 subgrids contain all of the digits from 1 to 9. The solver generates valid Sudoku puzzles of varying difficulty levels and provides solutions.

## Files
1. 'sudoku.sv': Contains the SystemVerilog class sudoku that defines the Sudoku puzzle and solver logic.
2. 'easy_level.png': Sample output of the puzzle at easy level.
3. 'Intermediate_level.png' : Sample output of the puzzle at intermediate level
4. 'Difficult_level.png':  Sample output of the puzzle at Difficult level

## Sudoku Difficulty Levels
The test module initializes Sudoku puzzles of different difficulty levels:
1. Easy Level
2. Intermediate Level
3. Difficult Level

Each level represents a Sudoku puzzle with varying degrees of complexity.

## Running the Simulation
To run the simulation,I have used Synopsys VCS using command:
$ vcs -sverilog sudoku.sv
$ ./simv
