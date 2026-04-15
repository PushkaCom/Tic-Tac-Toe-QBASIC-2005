2                              'reset game option (100)
CLS
SCREEN 12                       ' makes lines /

DIM pl1 AS STRING                 'name integer
DIM p1 AS STRING                    'players name
DIM dif AS INTEGER                  ' dificulty
DIM t1 AS LONG                  't - turn
DIM a1 AS INTEGER        'all these are the flags for entered o or xDIM a2 AS INTEGER
DIM a2 AS INTEGER
DIM a3 AS INTEGER
DIM a4 AS INTEGER
DIM a5 AS INTEGER
DIM a6 AS INTEGER
DIM a7 AS INTEGER
DIM a8 AS INTEGER
DIM a9 AS INTEGER
DIM o1 AS INTEGER               'regestering a win
DIM o2 AS INTEGER
DIM o3 AS INTEGER
DIM o4 AS INTEGER
DIM o5 AS INTEGER
DIM o6 AS INTEGER
DIM o7 AS INTEGER
DIM o8 AS INTEGER
DIM o9 AS INTEGER
DIM ha AS INTEGER               'where up to in hard lvl.
DIM com1 AS INTEGER              'computer turn integer
DIM rnd1 AS INTEGER              'flag for random computer picking.
DIM nr1 AS INTEGER

dif = 0                 'choose dificulty


COLOR 14                        'interface color , text color
PRINT ""
INPUT "Players name::: ", p1      'name
PRINT ""
10                                'data validation
INPUT "select dificulty (easy - 1, medium - 2, hard - 3):::", dif      'dificulty
IF dif > 3 THEN
PRINT "error"
GOTO 10                 'validation
ELSEIF dif < 1 THEN
PRINT "error"
GOTO 10
END IF
CLS

5                  'color error  - validation
PRINT ""
                     'colors you can chose
COLOR 9
PRINT "9"
COLOR 10             'only bright colors shown
PRINT "10"
COLOR 11
PRINT "11"
COLOR 13
PRINT "13"
COLOR 15
PRINT "15"

PRINT ""
COLOR 14
INPUT "what color do you want to be?:::", col1

PRINT ""

INPUT "what color do you want your oponent to be?:::", col2
COLOR 4
IF col1 > 15 THEN
PRINT "error - there are only 15 colors"
GOTO 5                              'only color 1-15  - validation
ELSEIF col1 < 1 THEN
PRINT "error "
GOTO 5
ELSEIF col2 > 15 THEN
PRINT "error"
GOTO 5
ELSEIF col2 < 1 THEN
PRINT "error"
GOTO 5
END IF

9                                ' play again after wining or losing

x1 = 0                           'initialising integers incase of reset.
x2 = 0
x3 = 0
x4 = 0
x5 = 0
x6 = 0
x7 = 0
x8 = 0
x9 = 0
o1 = 0
o2 = 0
o3 = 0
o4 = 0
o5 = 0
o6 = 0
o7 = 0
o8 = 0
o9 = 0
a1 = 0
a2 = 0
a3 = 0
a4 = 0
a5 = 0
a6 = 0
a7 = 0
a8 = 0
a9 = 0
ha = 0
nr1 = 1
COLOR 14                       'yellow default color
CLS                             'clear screen
LINE (50, 100)-(200, 100)     'interface grid
LINE (50, 150)-(200, 150)
LINE (100, 50)-(100, 200)
LINE (150, 50)-(150, 200)

COLOR 12
LOCATE 14, 5                    'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Welcome to Pushka's asignment for year 11, have a nice day."
LOCATE 16, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Restart the program with '100'. End with '200' (the number then enter)"
LOCATE 18, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "For help press '300'. The game will resume after reading."
LOCATE 20, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Press a number on the keypad that corosponds to the grid, then enter."
COLOR col1
LOCATE 2, 30
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Welcome to the game "; p1


IF dif = 3 THEN                 'selecting hard game
GOTO 3
END IF

30                        'easy game
GOSUB player              'subprogram for players turn
GOSUB computer                      ' subprogram for computer's turn
GOTO 30                           'repeat players turn

3
COLOR col2
x7 = 1
a7 = 1
LINE (60, 60)-(90, 90)           '1st computer always here
LINE (60, 90)-(90, 60)
GOSUB player       'input players turn

IF t1 = 1 THEN                   'deciding retaliation
GOTO 20
ELSEIF t1 = 2 THEN
GOTO 21
ELSEIF t1 = 3 THEN
GOTO 22
ELSEIF t1 = 4 THEN
GOTO 23
ELSEIF t1 = 5 THEN
GOTO 24
ELSEIF t1 = 6 THEN
GOTO 25
ELSEIF t1 = 9 THEN
GOTO 26
ELSEIF t1 = 8 THEN
GOTO 27
END IF

20                          'all of the following are pre-planed retaliation
com1 = 9
GOSUB computer
GOSUB player
IF a8 = 0 THEN
com1 = 8
GOSUB computer
END IF
com1 = 3
GOSUB computer
GOSUB player
IF a5 = 0 THEN
com1 = 5
GOSUB computer
ELSEIF a6 = 0 THEN
com1 = 6
GOSUB computer
END IF

21
com1 = 1
GOSUB computer
GOSUB player
IF a4 = 0 THEN
com1 = 4
GOSUB computer
END IF
com1 = 9
GOSUB computer
GOSUB player
IF a5 = 0 THEN
com1 = 5
GOSUB computer
ELSEIF a8 = 0 THEN
com1 = 8
GOSUB computer
END IF

22
com1 = 1
GOSUB computer
GOSUB player
IF a4 = 0 THEN
com1 = 4
GOSUB computer
END IF
com1 = 9
GOSUB computer
GOSUB player
IF a5 = 0 THEN
com1 = 5
GOSUB computer
ELSEIF a8 = 0 THEN
com1 = 8
GOSUB computer
END IF

23
com1 = 5
GOSUB computer
GOSUB player
IF a3 = 0 THEN
com1 = 3
GOSUB computer
END IF
com1 = 9
GOSUB computer
GOSUB player
IF a8 = 0 THEN
com1 = 8
GOSUB computer
ELSEIF a1 = 0 THEN
com1 = 1
GOSUB computer
END IF

24

IF dif = 3 THEN
        rnd2 = 1
        GOSUB computer                       ' subprogram for computer's turn
        rnd2 = 0
        IF a1 = 1 AND a2 = 1 AND a3 = 1 AND a4 = 1 AND a5 = 1 AND a6 = 1 AND a7 = 1 AND a8 = 1 AND a9 = 1 THEN
        GOTO 16                                    'regestering a draw
        END IF
        GOSUB player
        GOTO 24
END IF
com1 = 3
GOSUB computer
GOSUB player
IF t1 = 1 THEN
com1 = 9
GOSUB computer
GOSUB player
        IF a8 = 0 THEN
        com1 = 8
        GOSUB computer
        ELSEIF a6 = 0 THEN
        com1 = 6
        GOSUB computer
        END IF
ELSEIF t1 = 9 THEN
com1 = 1
GOSUB computer
GOSUB player
        IF a2 = 0 THEN
        com1 = 2
        GOSUB computer
        ELSEIF a4 = 0 THEN
        com1 = 4
        GOSUB computer
        END IF
ELSEIF t1 = 2 OR 4 OR 6 OR 8 THEN
44
        rnd1 = 1
        GOSUB computer                       ' subprogram for computer's turn
        rnd1 = 2
        IF a1 = 1 AND a2 = 1 AND a3 = 1 AND a4 = 1 AND a5 = 1 AND a6 = 1 AND a7 = 1 AND a8 = 1 AND a9 = 1 THEN
        GOTO 16                                    'regestering a draw
        END IF
        GOSUB player
        GOTO 44
END IF


25
com1 = 9
GOSUB computer
GOSUB player
IF a8 = 0 THEN
com1 = 8
GOSUB computer
END IF
com1 = 1
GOSUB computer
GOSUB player
IF a4 = 0 THEN
com1 = 4
GOSUB computer
ELSEIF a5 = 0 THEN
com1 = 5
GOSUB computer
END IF

26
com1 = 1
GOSUB computer
GOSUB player
IF a4 = 0 THEN
com1 = 4
GOSUB computer
END IF
com1 = 3
GOSUB computer
GOSUB player
IF a5 = 0 THEN
com1 = 5
GOSUB computer
ELSEIF a2 = 0 THEN
com1 = 2
GOSUB computer
END IF

27
com1 = 5
GOSUB computer
GOSUB player
IF a3 = 0 THEN
com1 = 3
GOSUB computer
END IF
com1 = 1
GOSUB computer
GOSUB player
IF a4 = 0 THEN
com1 = 4
GOSUB computer
ELSEIF a9 = 0 THEN
com1 = 9
GOSUB computer
END IF

'END OF GAME - NOW PRINTING WIN/LOSE/DRAW

16
COLOR col1
LOCATE 14, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                     "
COLOR 15                             'this is all deliting instructions                                          "
LOCATE 15, 5                         'and printing if you win or lose
myrow% = CSRLIN                      'also prints your name
mycol% = POS(0)
PRINT "", p1, "                                                                                ";
LOCATE 16, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "THIS GAME WAS A DRAW  >_<;;;                   www.sparda.tk                             "
LOCATE 17, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                                      "
LOCATE 19, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                                 "

GOTO 8

6
COLOR col1
LOCATE 14, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                          "
                                     'this is all deliting instructions                                          "
LOCATE 15, 5                         'and printing if you win or lose
myrow% = CSRLIN                      'also prints your name
mycol% = POS(0)
PRINT "", p1, "                                                                  ";
LOCATE 16, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "YOU WIN!!!!!!!!!!!!!!!!!! AWESOME GAME!!!!!  ^_^   www.sparda.tk           "
LOCATE 18, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                            "
LOCATE 20, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                            "

GOTO 8

7
COLOR col2
LOCATE 14, 5
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                          "
LOCATE 15, 5
myrow% = CSRLIN
mycol% = POS(0)                      'same as last coment
PRINT "                                                                            "

LOCATE 14, 5
myrow% = CSRLIN
mycol% = POS(0)
PRINT p1
LOCATE 15, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "YOU LOSE U_U BETTER LUCK NEXT TIME!              www.sparda.tk                 "
LOCATE 18, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                            "
LOCATE 20, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                            "

8
COLOR 14
LOCATE 22, 5
myrow% = CSRLIN
mycol% = POS(0)
INPUT "play again?::: ", pl1            'asking if want to play again
IF pl1 = "yes" THEN
GOTO 9
ELSEIF pl1 = "ye" THEN GOTO 9
ELSEIF pl1 = "y" THEN GOTO 9
ELSEIF pl1 = "yep" THEN GOTO 9
ELSEIF pl1 = "" THEN GOTO 9
END IF

200                                'end game option (200)
END

'SUBPROGRAMS

player:
1
COLOR 14                          'default color

                LOCATE 22, 5
                myrow% = CSRLIN
                mycol% = POS(0)
                PRINT "                                                                        "
                LOCATE 22, 5
                myrow% = CSRLIN
                mycol% = POS(0)
                INPUT "::: ", t1                    'input in number pad - position of O
                IF t1 = 100 THEN                    'reset program
                GOTO 2
                ELSEIF t1 = 200 THEN                'end program
                GOTO 200
                ELSEIF t1 = 300 THEN
                GOSUB help
                GOTO 1
                ELSEIF t1 < 1 THEN                  ' only 1-9 not - numbers etc.
                GOTO 1
                ELSEIF t1 > 9 THEN GOTO 1
                END IF

                LOCATE 22, 5                       'clear input
                myrow% = CSRLIN
                mycol% = POS(0)
                PRINT "                                                                            "
            
                COLOR col1

                IF t1 = 1 THEN                          'positioning O
                        IF a1 = 1 THEN                  'checking is there is a O there
                        GOTO 1
                        END IF
                a1 = 1                        'flag notifying that there is a O there
                o1 = 1
                CIRCLE (75, 175), 18
                END IF

                IF t1 = 2 THEN                         'same as last one etc.
                        IF a2 = 1 THEN
                        GOTO 1
                        END IF
                a2 = 1
                o2 = 1
                CIRCLE (125, 175), 18
                END IF

                IF t1 = 3 THEN
                        IF a3 = 1 THEN
                        GOTO 1
                        END IF
                a3 = 1
                o3 = 1
                CIRCLE (175, 175), 18
                END IF

                IF t1 = 4 THEN
                        IF a4 = 1 THEN
                        GOTO 1
                        END IF
                a4 = 1
                o4 = 1
                CIRCLE (75, 125), 18
                END IF
                IF t1 = 5 THEN
                        IF a5 = 1 THEN
                        GOTO 1
                        END IF
                a5 = 1
                o5 = 1
                CIRCLE (125, 125), 18
                END IF

                IF t1 = 6 THEN
                        IF a6 = 1 THEN
                        GOTO 1
                        END IF
                a6 = 1
                o6 = 1
                CIRCLE (175, 125), 18
                END IF

                IF t1 = 7 THEN
                        IF a7 = 1 THEN
                        GOTO 1
                        END IF
                a7 = 1
                o7 = 1

                CIRCLE (75, 75), 18
                END IF

                IF t1 = 8 THEN
                        IF a8 = 1 THEN
                        GOTO 1
                        END IF
                a8 = 1
                o8 = 1

                CIRCLE (125, 75), 18
                END IF

                IF t1 = 9 THEN
                        IF a9 = 1 THEN
                        GOTO 1
                        END IF
                a9 = 1
                o9 = 1
                CIRCLE (175, 75), 18
                END IF

                IF o1 = 1 AND o2 = 1 AND o3 = 1 THEN
                GOTO 6
                ELSEIF o4 = 1 AND o5 = 1 AND o6 = 1 THEN GOTO 6         'regestering a win
                ELSEIF o7 = 1 AND o8 = 1 AND o9 = 1 THEN GOTO 6
                ELSEIF o7 = 1 AND o4 = 1 AND o1 = 1 THEN GOTO 6
                ELSEIF o8 = 1 AND o5 = 1 AND o2 = 1 THEN GOTO 6
                ELSEIF o9 = 1 AND o6 = 1 AND o3 = 1 THEN GOTO 6
                ELSEIF o1 = 1 AND o5 = 1 AND o9 = 1 THEN GOTO 6
                ELSEIF o7 = 1 AND o5 = 1 AND o3 = 1 THEN GOTO 6
                END IF

                IF a1 = 1 AND a2 = 1 AND a3 = 1 AND a4 = 1 AND a5 = 1 AND a6 = 1 AND a7 = 1 AND a8 = 1 AND a9 = 1 THEN
                GOTO 16                                    'regestering a draw
                END IF

RETURN

computer:

COLOR col2


12
4
IF rnd2 = 1 THEN
GOTO 66
END IF

IF dif = 1 THEN
GOTO 66
ELSEIF dif = 2 THEN GOTO 66
END IF

IF dif = 4 OR dif = 3 THEN
GOTO 33
END IF

66


RANDOMIZE TIMER                  'random position for computer
com1 = INT(RND * 9) + 1

IF rnd2 = 1 THEN
GOTO 33
END IF

           
IF dif = 1 THEN
GOTO 33
END IF

IF x5 AND x6 = 1 THEN
        IF a4 = 0 THEN
                com1 = 4
                GOTO 33
        END IF
END IF

IF x5 AND x4 = 1 THEN
        IF a6 = 0 THEN
                com1 = 6
                GOTO 33
        END IF
END IF

IF x5 AND x8 = 1 THEN
        IF a2 = 0 THEN
                com1 = 2
                GOTO 33
        END IF
END IF

IF x5 AND x2 = 1 THEN
        IF a8 = 0 THEN
                com1 = 8
                GOTO 33
        END IF
END IF

IF x5 AND x1 = 1 THEN
        IF a9 = 0 THEN
                com1 = 9
                GOTO 33
        END IF
END IF

IF x5 AND x7 = 1 THEN
        IF a3 = 0 THEN
                com1 = 3
                GOTO 33
        END IF
END IF

IF x5 AND x9 = 1 THEN
        IF a1 = 0 THEN
                com1 = 1
                GOTO 33
        END IF
END IF

IF x5 AND x3 = 1 THEN
        IF a7 = 0 THEN
                com1 = 7
                GOTO 33
        END IF
END IF

IF x1 AND x2 = 1 THEN
        IF a3 = 0 THEN
                com1 = 3
                GOTO 33
        END IF
END IF

IF x3 AND x2 = 1 THEN
        IF a1 = 0 THEN
                com1 = 1
                GOTO 33
        END IF
END IF

IF x1 AND x4 = 1 THEN
        IF a7 = 0 THEN
                com1 = 7
                GOTO 33
        END IF
END IF

IF x3 AND x6 = 1 THEN
        IF a9 = 0 THEN
                com1 = 9
                GOTO 33
        END IF
END IF

IF x7 AND x4 = 1 THEN
        IF a1 = 0 THEN
                com1 = 1
                GOTO 33
        END IF
END IF

IF x7 AND x8 = 1 THEN
        IF a9 = 0 THEN
                com1 = 9
                GOTO 33
        END IF
END IF

IF x9 AND x8 = 1 THEN
        IF a7 = 0 THEN
                com1 = 7
                GOTO 33
        END IF
END IF

IF x9 AND x6 = 1 THEN
        IF a3 = 0 THEN
                com1 = 3
                GOTO 33
        END IF
END IF

IF x1 AND x7 = 1 THEN
        IF a4 = 0 THEN
                com1 = 4
                GOTO 33
        END IF
END IF

IF x7 AND x9 = 1 THEN
        IF a8 = 0 THEN
                com1 = 8
                GOTO 33
        END IF
END IF

IF x9 AND x3 = 1 THEN
        IF a6 = 0 THEN
                com1 = 6
                GOTO 33
        END IF
END IF

IF x3 AND x1 = 1 THEN
        IF a2 = 0 THEN
                com1 = 2
                GOTO 33
        END IF
END IF

IF x2 AND x8 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF

IF x4 AND x6 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF

IF x1 AND x9 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF

IF x7 AND x3 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF


IF o5 AND o6 = 1 THEN
        IF a4 = 0 THEN
                com1 = 4
                GOTO 33
        END IF
END IF

IF o5 AND o4 = 1 THEN
        IF a6 = 0 THEN
                com1 = 6
                GOTO 33
        END IF
END IF

IF o5 AND o8 = 1 THEN
        IF a2 = 0 THEN
                com1 = 2
                GOTO 33
        END IF
END IF

IF o5 AND o2 = 1 THEN
        IF a8 = 0 THEN
                com1 = 8
                GOTO 33
        END IF
END IF

IF o5 AND o1 = 1 THEN
        IF a9 = 0 THEN
                com1 = 9
                GOTO 33
        END IF
END IF

IF o5 AND o7 = 1 THEN
        IF a3 = 0 THEN
                com1 = 3
                GOTO 33
        END IF
END IF

IF o5 AND o9 = 1 THEN
        IF a1 = 0 THEN
                com1 = 1
                GOTO 33
        END IF
END IF

IF o5 AND o3 = 1 THEN
        IF a7 = 0 THEN
                com1 = 7
                GOTO 33
        END IF
END IF

IF o1 AND o2 = 1 THEN
        IF a3 = 0 THEN
                com1 = 3
                GOTO 33
        END IF
END IF

IF o3 AND o2 = 1 THEN
        IF a1 = 0 THEN
                com1 = 1
                GOTO 33
        END IF
END IF

IF o1 AND o4 = 1 THEN
        IF a7 = 0 THEN
                com1 = 7
                GOTO 33
        END IF
END IF

IF o3 AND o6 = 1 THEN
        IF a9 = 0 THEN
                com1 = 9
                GOTO 33
        END IF
END IF

IF o7 AND o4 = 1 THEN
        IF a1 = 0 THEN
                com1 = 1
                GOTO 33
        END IF
END IF

IF o7 AND o8 = 1 THEN
        IF a9 = 0 THEN
                com1 = 9
                GOTO 33
        END IF
END IF

IF o9 AND o8 = 1 THEN
        IF a7 = 0 THEN
                com1 = 7
                GOTO 33
        END IF
END IF

IF o9 AND o6 = 1 THEN
        IF a3 = 0 THEN
                com1 = 3
                GOTO 33
        END IF
END IF

IF o1 AND o7 = 1 THEN
        IF a4 = 0 THEN
                com1 = 4
                GOTO 33
        END IF
END IF

IF o7 AND o9 = 1 THEN
        IF a8 = 0 THEN
                com1 = 8
                GOTO 33
        END IF
END IF

IF o9 AND o3 = 1 THEN
        IF a6 = 0 THEN
                com1 = 6
                GOTO 33
        END IF
END IF

IF o3 AND o1 = 1 THEN
        IF a2 = 0 THEN
                com1 = 2
                GOTO 33
        END IF
END IF
          
IF o2 AND o8 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF

IF o4 AND o6 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF

IF o1 AND o9 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF

IF o7 AND o3 = 1 THEN
        IF a5 = 0 THEN
                com1 = 5
                GOTO 33
        END IF
END IF



33

                IF com1 = 1 THEN                        'comp random turns
                        IF a1 = 1 THEN                  'checking for a X or O there
                        GOTO 4
                        END IF
                a1 = 1                                  ' flag notifying there is an X there
                x1 = 1
                LINE (60, 160)-(90, 190)                ' print the X
                LINE (60, 190)-(90, 160)
                END IF

                IF com1 = 2 THEN                       'same as last one etc.
                        IF a2 = 1 THEN
                        GOTO 4
                        END IF
                a2 = 1
                x2 = 1
                LINE (110, 160)-(140, 190)
                LINE (110, 190)-(140, 160)
                END IF

                IF com1 = 3 THEN
                        IF a3 = 1 THEN
                        GOTO 4
                        END IF
                a3 = 1
                x3 = 1
                LINE (160, 160)-(190, 190)
                LINE (160, 190)-(190, 160)
                END IF

                IF com1 = 4 THEN
                        IF a4 = 1 THEN
                        GOTO 4
                        END IF
                a4 = 1
                x4 = 1
                LINE (60, 110)-(90, 140)
                LINE (60, 140)-(90, 110)
                END IF

                IF com1 = 5 THEN
                        IF a5 = 1 THEN
                        GOTO 4
                        END IF
                a5 = 1
                x5 = 1
                LINE (110, 110)-(140, 140)
                LINE (110, 140)-(140, 110)
                END IF

                IF com1 = 6 THEN
                        IF a6 = 1 THEN
                        GOTO 4
                        END IF
                a6 = 1
                x6 = 1

                LINE (160, 110)-(190, 140)
                LINE (160, 140)-(190, 110)
                END IF

                IF com1 = 7 THEN
                        IF a7 = 1 THEN
                        GOTO 4
                        END IF
                a7 = 1
                x7 = 1
                LINE (60, 60)-(90, 90)
                LINE (60, 90)-(90, 60)
                END IF

                IF com1 = 8 THEN
                        IF a8 = 1 THEN
                        GOTO 4
                        END IF
                a8 = 1
                x8 = 1
                LINE (110, 60)-(140, 90)
                LINE (110, 90)-(140, 60)
                END IF

                IF com1 = 9 THEN
                        IF a9 = 1 THEN
                        GOTO 4
                        END IF
                a9 = 1
                x9 = 1

                LINE (160, 60)-(190, 90)
                LINE (160, 90)-(190, 60)
                END IF

                IF x1 = 1 AND x2 = 1 AND x3 = 1 THEN
                GOTO 7
                ELSEIF x4 = 1 AND x5 = 1 AND x6 = 1 THEN GOTO 7        'regestering a win
                ELSEIF x7 = 1 AND x8 = 1 AND x9 = 1 THEN GOTO 7
                ELSEIF x7 = 1 AND x4 = 1 AND x1 = 1 THEN GOTO 7
                ELSEIF x8 = 1 AND x5 = 1 AND x2 = 1 THEN GOTO 7
                ELSEIF x9 = 1 AND x6 = 1 AND x3 = 1 THEN GOTO 7
                ELSEIF x1 = 1 AND x5 = 1 AND x9 = 1 THEN GOTO 7
                ELSEIF x7 = 1 AND x5 = 1 AND x3 = 1 THEN GOTO 7
                END IF

RETURN

help:      'online help
18
CLS
PRINT ":::WELCOME TO THE ONLINE HELP DESK:::"
PRINT ""
PRINT "Technical Help::"
PRINT ""
PRINT "For technical help call our toll free hotline* on 0405 784 104."
PRINT "The hotline is open 24/7 since our phone operator is so incredibly"
PRINT "reliable. If the line is engaged (probably with complaints) then"
PRINT "consult this guide. "
PRINT "As long as you keep to the instructions the game will run smoothly."
PRINT "If the game stops abruptly or prints down the bottom of the screen"
PRINT "press any key to continue, then the game has encountered an error"
PRINT "and has to stop. If you wish to retry then just hit f5 again."
PRINT "For serious complaints or comments, call the technical hotline"
PRINT "for more help"
PRINT "*Free claim valid only in south east Indochina"
PRINT ""

SLEEP
CLS
PRINT ":::WELCOME TO THE ONLINE HELP DESK::: "
PRINT ""

PRINT "Tutorial::"
PRINT ""
PRINT "The game is simple and is very hard to misinterpret."
PRINT "Upon opening the program and hitting F5 the program will begin."
PRINT "Enter your name when prompted. Choose your difficulty by pressing"
PRINT "either 1 for easy, 2 for meduim, 3 for hard and 4 for expert. The counter placement system"
PRINT "is represented by the number pad on the right hand side of your"
PRINT "keyboard. For the top left square you would press 7. For the"
PRINT "middle square you would press 5."

SLEEP
CLS
19
DIM help1 AS LONG

LOCATE 3, 3
myrow% = CSRLIN
mycol% = POS(0)
PRINT "                                                                                                                                                     "

LOCATE 3, 3
myrow% = CSRLIN
mycol% = POS(0)
INPUT "do you want to read again? (1-yes, 2-no) ::: ", help1

IF help1 = 1 THEN
GOTO 18
ELSEIF help1 = 0 THEN
GOTO 19
ELSEIF help1 = 2 THEN
GOTO 34
ELSEIF help1 > 2 THEN
LOCATE 3, 5
myrow% = CSRLIN
mycol% = POS(0)
PRINT "error - only 1 or 2"

GOTO 19
ELSEIF help1 < 0 THEN
LOCATE 3, 5
myrow% = CSRLIN
mycol% = POS(0)
PRINT " error - only 1 or 2"

GOTO 19
END IF
34
GOSUB endhelp
RETURN

endhelp:

CLS                             'clear screen
LINE (50, 100)-(200, 100)     'interface grid
LINE (50, 150)-(200, 150)
LINE (100, 50)-(100, 200)
LINE (150, 50)-(150, 200)

COLOR 12
LOCATE 14, 5                    'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Welcome to Tristan's, Ben's and Kyle's asignment. Have a nice day."
LOCATE 16, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Restart the program with '100'. End with '200' (the number then enter)"
LOCATE 18, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "For help press '300'. The game will resume after reading."
LOCATE 20, 5                         'positioning
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Tic Tac Toe - use the number pad as the positioning - then press enter"
COLOR col1
LOCATE 2, 30
myrow% = CSRLIN
mycol% = POS(0)
PRINT "Welcome to the game "; p1

COLOR col2

IF x1 = 1 THEN
LINE (60, 160)-(90, 190)                ' print the X
LINE (60, 190)-(90, 160)
END IF

IF x2 = 1 THEN
LINE (110, 160)-(140, 190)
LINE (110, 190)-(140, 160)
END IF

IF x3 = 1 THEN
LINE (160, 160)-(190, 190)
LINE (160, 190)-(190, 160)
END IF

IF x4 = 1 THEN
LINE (60, 110)-(90, 140)
LINE (60, 140)-(90, 110)
END IF

IF x5 = 1 THEN
LINE (110, 110)-(140, 140)
LINE (110, 140)-(140, 110)
END IF

IF x6 = 1 THEN
LINE (160, 110)-(190, 140)
LINE (160, 140)-(190, 110)
END IF

IF x7 = 1 THEN
LINE (60, 60)-(90, 90)
LINE (60, 90)-(90, 60)
END IF

IF x8 = 1 THEN
LINE (110, 60)-(140, 90)
LINE (110, 90)-(140, 60)
END IF

IF x9 = 1 THEN
LINE (160, 60)-(190, 90)
LINE (160, 90)-(190, 60)
END IF

COLOR col1
IF o1 = 1 THEN
CIRCLE (75, 175), 18
END IF

IF o2 = 1 THEN
CIRCLE (125, 175), 18
END IF

IF o3 = 1 THEN
CIRCLE (175, 175), 18
END IF

IF o4 = 1 THEN
CIRCLE (75, 125), 18
END IF

IF o5 = 1 THEN
CIRCLE (125, 125), 18
END IF

IF o6 = 1 THEN
CIRCLE (175, 125), 18
END IF

IF o7 = 1 THEN
CIRCLE (75, 75), 18
END IF

IF o8 = 1 THEN
CIRCLE (125, 75), 18
END IF

IF o9 = 1 THEN
CIRCLE (175, 75), 18
END IF
      

h1 = 0
RETURN

