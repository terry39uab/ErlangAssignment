# ErlangAssignment

Problem 1. 
Write a function that computes π using the Monte Carlo method and N iterations spread over X actors. You can use random:uniform to generate a random number. A sequential Erlang version can be found on https://programmingpraxis.com/2009/10/09/calculating-pi/.
pi:montecarlo(N, X).

Problem 2. 
Implement a two client version of a text based tic-tac-toe program that can be played in a
distributed environment. To this end develop a module t3 that contains the following functions: – newgame() starts a new game node and waits for an opponent.
  – playwith(Opponent) connects to another Erlang node identified by Opponent and starts a new game. If the Opponent does not     exist, a call to playwith results in an error. When the game starts the two clients randomly decide who starts the game.
  – placetoken(Coordinate) validates that Coordinate is a valid move and places a new token at field Coordinate. The move is        also communicated to the opponent’s client. Coordinate is coordinate in the form of a1, ..., c3. When a winning position      is reached or no more move is possible, the program announces the result on both clients and the game terminates. If it        is not a client’s turn, a call to placetoken prints an error message. If there is no ongoing game, a call to placetoken        may result in an error.
  – tell(Message) sends a message to the opponent. The message will be printed on the console. Hint: This site may give you 
    some ideas: http://ninenines.eu/articles/tictactoe/

  Note: If the problem description is unclear, please use the Canvas forum to seek clarification.
