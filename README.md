# Mastermind Game (Ruby CLI)

A command-line implementation of the classic logic and deduction game, Mastermind.

## Project Overview

This project allows the player to choose whether to be the Code Maker (setting the secret code) or the Code Breaker (guessing the code within 10 turns). When the player is the Code Breaker, the computer acts as the Code Maker, and vice-versa.

---

## 🚀 Getting Started and Requirements

These instructions will get you a copy of the project up and running on your local machine.

* This project was developed and tested with Ruby 3.1+. You can check your version with ruby -v

## Installation

Follow these steps to get a copy of the project running on your local machine.

1.  **Clone the repository**:
    ```sh
    git clone <https://github.com/your-username/your-repo-name.git>
    ```

2.  **Navigate to the project directory**:
    ```sh
    cd your-repo-name
    ```

3.  **Install dependencies**: Bundler will read the Gemfile and install the necessary gems
    ```sh
    bundle install
    ```

4.  **Run the game**: Execute the main script using Bundler to ensure it uses the correct environment.
    ```sh
    bundle exec ruby main.rb
    ```

---


## How to Play 🕹️

The game runs entirely in your terminal.

1.  Start the Game
Execute the main file using Ruby: bundle exec ruby main.rb

2.  Choose Your Role

The game will prompt you to choose your role: Guesser (Code Breaker) or Maker (Code Setter).
Choose guesser: You will try to break the code set by the computer.
Choose maker: The computer will try to guess the code you set.

3.  Gameplay

The secret code consists of a sequence of 4 colors chosen from the following list: RED BLUE YELLOW GREEN PURPLE ORANGE

Human Player's Turn

When prompted, you must enter your four color choices separated by a space (e.g., RED BLUE GREEN YELLOW). The order matters.
After each guess, you will receive feedback in the form of pegs:

Black Pegs: Correct color in the correct position.

White Pegs: Correct color in the wrong position.

The goal is to find the secret code in 10 turns or less.

## Code Structure 📂

The project is structured using the standard Ruby pattern with a central main.rb file and class files in the top level:

1. **main.rb**: Entry point for the game. Initializes the Match and starts the play_game loop.
2. **match.rb**: Manages the overall game flow, turn count, and role selection.
3. **check.rb**: A module containing the check logic, which calculates the black and white pegs based on the secret code and the guess.
4. **Role Classes (Maker & Guesser)**:
    * **maker.rb, guesser.rb**: Abstract parent classes for the code creators and guessers.
    * **maker_human.rb, maker_computer.rb**: Implementations for the code maker role (player input or computer random selection).
    * **guesser_human.rb, guesser_computer.rb**: Implementations for the code guesser role (player input or computer logic).

The Computer Guesser uses a logic-based approach (Knuth's five-guess algorithm principle) to narrow down the possible codes after receiving feedback, although its current implementation randomly samples from the remaining possibilities.

Credits Developed by @fabs82 as a practice project in the Ruby path of The Odin Project.