% A game of Tic Tac Toe between 2 local players or a single player against comp.

- module(tictacgame).
- import(string,[len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/1]).
- export([main/0]).

main() -> 
        startscreen().

startscreen() -> 
    
        io : fwrite("Welcome to Tic Tac Toe on the Go! \n"),
        io : fwrite("Select an item from the menu by typing the menu number and pressing enter. \n"),
        io : fwrite("\t 1. Single player \t 2. Multi player \t 3. Info \n"),
        Read = io : fread("Selection> ", "~d"),
        {_,B} = Read,
        B,
        Ans = hd(B), 
        if 
                Ans == 1 -> singlegame();
                Ans == 2 -> multiplaygame();
                Ans == 3 -> information() 
        end.

                                                                                                                        % Single Player game 
singlegame() -> 
        io : fwrite("You selected single player \n").
        

                                                                                                                        % Multi player game 
multiplaygame() ->
                                                                                                                        % Getting Player 1 name
        io : fwrite("You selected multi player \n"),
        io : fwrite("Enter name of player 1. \n"),
        Read1 = io : fread("Player 1> " ,"~s"),
        Read1,
        {_,C} = Read1,
        C,
        P1 = hd(C),

                                                                                                                        % Getting Player 2 name
        io : fwrite("Enter name of player 2. \n"),
        Read2 = io : fread("Player 2> " ,"~s"),
        Read2,
        {_,D} = Read2,
        D,
        P2 = hd(D),
        
        io : format("Hello " ++ P1 ++ " and " ++ P2 ++ ". Time to play tic tac toe! \n"),

        newgame(P1, P2).


                                                                                                                        %info screen
information() ->
        io : fwrite("Here is the info: BLANK \n").

                                                                                                                        % New multi player game set up
newgame(P1, P2) -> 
        Toprow = {"Empty", "Empty", "Empty"},
        Midrow = {"Empty", "Empty", "Empty"},
        Bottomrow = {"Empty", "Empty", "Empty"},
        showlist(Toprow, Midrow, Bottomrow),

        io : fwrite("Pick a number 1 - 10 and the closest one will start first as X. \n"),
        Randnum = rand : uniform(10),
        
        io : fwrite("~p Pick a number 1 - 10 \n", [P1]),
        Read3 = io : fread("Pick a number> " ,"~d"),
        {_,E} = Read3,
        E,
        P1guess = hd(E),
        io : fwrite("~p you guessed ~p ~n", [P1, P1guess]), 

        io : fwrite("~p Pick a number 1 - 10 \n", [P2]),
        Read4 = io : fread("Pick a number> " ,"~d"),
        {_,F} = Read4,
        F,
        P2guess = hd(F),
        io : fwrite("~p you guessed ~p ~n", [P2, P2guess]),

        io : fwrite("The random number chosen was ~p ~n", [Randnum]),
        if 
                (Randnum - P1guess) =< (Randnum - P2guess) -> First = P1, Second = P2;
                (Randnum - P2guess) =< (Randnum - P1guess) -> First = P2, Second = P1
        end,
        io : fwrite("~p is going first as X and ~p will be going second as O. ~n", [First, Second]),
        playround(First).

playround(Player) ->
        Toprow = {"Empty", "Empty", "Empty"},
        Midrow = {"Empty", "Empty", "Empty"},
        Bottomrow = {"Empty", "Empty", "Empty"},
        showlist(Toprow, Midrow, Bottomrow),

        io : fwrite("Where do you want to place your piece? Choose one of the following rows by typing the cooresponding number.\n"),
        io : fwrite("\t 1. Top \t 2. Middle \t 3. Bottom \n"),
        Read5 = io : fread("Row> ", "~d"),
        {_,G} = Read5,
        G,
        Rowans = hd(G),

        io : fwrite("Now, which column will you place your piece? Choose one of the following columns by typing the cooresponding number. \n"),
        io : fwrite("\t 1. Left \t 2. Middle \t 3. Right \n"),
        Read6 = io : fread("Column> ", "~d"),
        {_,H} = Read6,
        H,
        Colans = hd(H),

        if 
                Rowans == 1 -> topchange(Toprow, Colans);
                Rowans == 2 -> io : fwrite("hi");
                Rowans == 3 -> io : fwrite("bothi")
        end,
        playround(Player).



topchange(List, Column) ->
        {A0, A1, A2} = List,
        if      
                Column == 1 -> List = {"Empty", "Empty", "Empty"};                              /////////////////////
                Column == 2 -> A1 = "X";
                Column == 3 -> A2 = "X"
        end.




                                                                                                                        % Prints the Game Board
showlist(T1, T2, T3) ->
        io : fwrite("Here is the current gameboard!\n"),
        {A0, A1, A2} = T1,
        {B0, B1, B2} = T2,
        {C0, C1, C2} = T3,
        io : fwrite("~s ~s ~s ~n", [A0, A1, A2]),
        io : fwrite("~s ~s ~s ~n", [B0, B1, B2]),
        io : fwrite("~s ~s ~s ~n ~n", [C0, C1, C2]).




