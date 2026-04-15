' ============================================================
' Pushka's Tic Tac Toe - Year 11 Assignment
' QBJS compatible version - uses SUB/FUNCTION + DO/WHILE loops
' No GOTO or GOSUB anywhere.
' ============================================================

' --- All shared game state ---
DIM SHARED p1 AS STRING
DIM SHARED pl1 AS STRING
DIM SHARED dif AS INTEGER
DIM SHARED t1 AS LONG
DIM SHARED col1 AS INTEGER
DIM SHARED col2 AS INTEGER

DIM SHARED a(9) AS INTEGER   ' occupied flag
DIM SHARED o(9) AS INTEGER   ' player O
DIM SHARED x(9) AS INTEGER   ' computer X

DIM SHARED com1 AS INTEGER
DIM SHARED rnd2 AS INTEGER

' ============================================================
' MAIN PROGRAM
' ============================================================

CLS
SCREEN 12

' --- Name ---
COLOR 14
PRINT ""
INPUT "Players name::: ", p1
PRINT ""

' --- Difficulty ---
DIM validDif AS INTEGER
validDif = 0
DO
    PRINT "select dificulty (easy - 1, medium - 2, hard - 3):::"
    INPUT dif
    IF dif >= 1 AND dif <= 3 THEN
        validDif = 1
    ELSE
        PRINT "error"
    END IF
LOOP WHILE validDif = 0
CLS

' --- Colour ---
DIM validCol AS INTEGER
validCol = 0
DO
    PRINT ""
    COLOR 9:  PRINT "9"
    COLOR 10: PRINT "10"
    COLOR 11: PRINT "11"
    COLOR 13: PRINT "13"
    COLOR 15: PRINT "15"
    PRINT ""
    COLOR 14
    INPUT "what color do you want to be?:::", col1
    PRINT ""
    INPUT "what color do you want your oponent to be?:::", col2
    COLOR 4
    IF col1 >= 1 AND col1 <= 15 AND col2 >= 1 AND col2 <= 15 THEN
        validCol = 1
    ELSE
        PRINT "error - there are only 15 colors"
    END IF
LOOP WHILE validCol = 0

' ============================================================
' PLAY-AGAIN OUTER LOOP
' ============================================================
DIM playAgain AS INTEGER
playAgain = 1

DO WHILE playAgain = 1

    ' Reset board
    DIM i AS INTEGER
    FOR i = 1 TO 9
        a(i) = 0
        o(i) = 0
        x(i) = 0
    NEXT i
    com1 = 0
    rnd2 = 0

    CLS
    DrawBoard

    ' Result: 0=ongoing, 1=player wins, 2=computer wins, 3=draw
    DIM result AS INTEGER
    result = 0

    IF dif = 3 THEN
        ' ---- HARD MODE ----
        ' Computer always opens at cell 7
        COLOR col2
        x(7) = 1: a(7) = 1
        LINE (60,60)-(90,90): LINE (60,90)-(90,60)

        ' Get player's first move
        PlayerTurn
        result = CheckResult()

        IF result = 0 THEN
            DIM firstMove AS LONG
            firstMove = t1

            IF firstMove = 1 THEN
                com1 = 9: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(8) = 0 THEN com1 = 8: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 3: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(5) = 0 THEN com1 = 5: ComputerTurn: result = CheckResult()
            ELSEIF firstMove = 2 THEN
                com1 = 1: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(4) = 0 THEN com1 = 4: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 9: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(5) = 0 THEN com1 = 5: ComputerTurn: result = CheckResult()
            ELSEIF firstMove = 3 THEN
                com1 = 1: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(4) = 0 THEN com1 = 4: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 9: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(5) = 0 THEN com1 = 5: ComputerTurn: result = CheckResult()
            ELSEIF firstMove = 4 THEN
                com1 = 5: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(3) = 0 THEN com1 = 3: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 9: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(8) = 0 THEN com1 = 8: ComputerTurn: result = CheckResult()
            ELSEIF firstMove = 6 THEN
                com1 = 9: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(8) = 0 THEN com1 = 8: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 1: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(4) = 0 THEN com1 = 4: ComputerTurn: result = CheckResult()
            ELSEIF firstMove = 8 THEN
                com1 = 5: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(3) = 0 THEN com1 = 3: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 1: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(4) = 0 THEN com1 = 4: ComputerTurn: result = CheckResult()
            ELSEIF firstMove = 9 THEN
                com1 = 1: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(4) = 0 THEN com1 = 4: ComputerTurn: result = CheckResult()
                IF result = 0 THEN com1 = 3: ComputerTurn: result = CheckResult()
                IF result = 0 THEN PlayerTurn: result = CheckResult()
                IF result = 0 AND a(5) = 0 THEN com1 = 5: ComputerTurn: result = CheckResult()
            END IF
        END IF

        ' Random fallthrough for remainder of hard game
        DO WHILE result = 0
            rnd2 = 1
            ComputerTurn
            rnd2 = 0
            result = CheckResult()
            IF result = 0 THEN
                PlayerTurn
                result = CheckResult()
            END IF
        LOOP

    ELSE
        ' ---- EASY / MEDIUM GAME LOOP ----
        DO WHILE result = 0
            PlayerTurn
            result = CheckResult()
            IF result = 0 THEN
                ComputerTurn
                result = CheckResult()
            END IF
        LOOP
    END IF

    ' --- Show result ---
    IF result = 3 THEN
        COLOR col1
        LOCATE 14,5: PRINT "                                                                     "
        LOCATE 15,5: PRINT p1; "                                                                  "
        LOCATE 16,5: PRINT "THIS GAME WAS A DRAW  >_<;;;                   www.sparda.tk"
        LOCATE 17,5: PRINT "                                                                      "
        LOCATE 19,5: PRINT "                                                                 "
    ELSEIF result = 1 THEN
        COLOR col1
        LOCATE 14,5: PRINT "                                                                          "
        LOCATE 15,5: PRINT p1; "                                                                  "
        LOCATE 16,5: PRINT "YOU WIN!!!!!!!!!!!!!!!!!! AWESOME GAME!!!!!  ^_^   www.sparda.tk"
        LOCATE 18,5: PRINT "                                                                            "
        LOCATE 20,5: PRINT "                                                                            "
    ELSEIF result = 2 THEN
        COLOR col2
        LOCATE 14,5: PRINT "                                                                          "
        LOCATE 15,5: PRINT "                                                                            "
        LOCATE 14,5: PRINT p1
        LOCATE 15,5: PRINT "YOU LOSE U_U BETTER LUCK NEXT TIME!              www.sparda.tk"
        LOCATE 18,5: PRINT "                                                                            "
        LOCATE 20,5: PRINT "                                                                            "
    END IF

    ' --- Play again? ---
    COLOR 14
    LOCATE 22,5
    INPUT "play again?::: ", pl1
    IF pl1 = "yes" OR pl1 = "ye" OR pl1 = "y" OR pl1 = "yep" OR pl1 = "" THEN
        playAgain = 1
    ELSE
        playAgain = 0
    END IF

LOOP

END

' ============================================================
' SUB: DrawBoard
' ============================================================
SUB DrawBoard
    LINE (50,100)-(200,100)
    LINE (50,150)-(200,150)
    LINE (100,50)-(100,200)
    LINE (150,50)-(150,200)
    COLOR 12
    LOCATE 14,5: PRINT "Welcome to Pushka's asignment for year 11, have a nice day."
    LOCATE 16,5: PRINT "Restart the program with '100'. End with '200' (the number then enter)"
    LOCATE 18,5: PRINT "For help press '300'. The game will resume after reading."
    LOCATE 20,5: PRINT "Press a number on the keypad that corosponds to the grid, then enter."
    COLOR col1
    LOCATE 2,30: PRINT "Welcome to the game "; p1
END SUB

' ============================================================
' SUB: PlayerTurn
' ============================================================
SUB PlayerTurn
    DIM validMove AS INTEGER
    validMove = 0
    DO
        COLOR 14
        LOCATE 22,5: PRINT "                                                                        "
        LOCATE 22,5
        INPUT "::: ", t1

        IF t1 = 200 THEN END

        IF t1 = 300 THEN
            ShowHelp
        ELSEIF t1 >= 1 AND t1 <= 9 THEN
            IF a(t1) = 0 THEN
                a(t1) = 1
                o(t1) = 1
                COLOR col1
                SELECT CASE t1
                    CASE 1: CIRCLE (75,175), 18
                    CASE 2: CIRCLE (125,175), 18
                    CASE 3: CIRCLE (175,175), 18
                    CASE 4: CIRCLE (75,125), 18
                    CASE 5: CIRCLE (125,125), 18
                    CASE 6: CIRCLE (175,125), 18
                    CASE 7: CIRCLE (75,75), 18
                    CASE 8: CIRCLE (125,75), 18
                    CASE 9: CIRCLE (175,75), 18
                END SELECT
                validMove = 1
                LOCATE 22,5: PRINT "                                                                            "
            END IF
        END IF
    LOOP WHILE validMove = 0
END SUB

' ============================================================
' SUB: ComputerTurn
' ============================================================
SUB ComputerTurn
    COLOR col2

    IF com1 = 0 THEN
        IF dif <> 1 AND rnd2 = 0 THEN
            ' Attack
            IF x(5)=1 AND x(6)=1 AND a(4)=0 THEN com1=4
            IF com1=0 AND x(5)=1 AND x(4)=1 AND a(6)=0 THEN com1=6
            IF com1=0 AND x(5)=1 AND x(8)=1 AND a(2)=0 THEN com1=2
            IF com1=0 AND x(5)=1 AND x(2)=1 AND a(8)=0 THEN com1=8
            IF com1=0 AND x(5)=1 AND x(1)=1 AND a(9)=0 THEN com1=9
            IF com1=0 AND x(5)=1 AND x(7)=1 AND a(3)=0 THEN com1=3
            IF com1=0 AND x(5)=1 AND x(9)=1 AND a(1)=0 THEN com1=1
            IF com1=0 AND x(5)=1 AND x(3)=1 AND a(7)=0 THEN com1=7
            IF com1=0 AND x(1)=1 AND x(2)=1 AND a(3)=0 THEN com1=3
            IF com1=0 AND x(3)=1 AND x(2)=1 AND a(1)=0 THEN com1=1
            IF com1=0 AND x(1)=1 AND x(4)=1 AND a(7)=0 THEN com1=7
            IF com1=0 AND x(3)=1 AND x(6)=1 AND a(9)=0 THEN com1=9
            IF com1=0 AND x(7)=1 AND x(4)=1 AND a(1)=0 THEN com1=1
            IF com1=0 AND x(7)=1 AND x(8)=1 AND a(9)=0 THEN com1=9
            IF com1=0 AND x(9)=1 AND x(8)=1 AND a(7)=0 THEN com1=7
            IF com1=0 AND x(9)=1 AND x(6)=1 AND a(3)=0 THEN com1=3
            IF com1=0 AND x(1)=1 AND x(7)=1 AND a(4)=0 THEN com1=4
            IF com1=0 AND x(7)=1 AND x(9)=1 AND a(8)=0 THEN com1=8
            IF com1=0 AND x(9)=1 AND x(3)=1 AND a(6)=0 THEN com1=6
            IF com1=0 AND x(3)=1 AND x(1)=1 AND a(2)=0 THEN com1=2
            IF com1=0 AND x(2)=1 AND x(8)=1 AND a(5)=0 THEN com1=5
            IF com1=0 AND x(4)=1 AND x(6)=1 AND a(5)=0 THEN com1=5
            IF com1=0 AND x(1)=1 AND x(9)=1 AND a(5)=0 THEN com1=5
            IF com1=0 AND x(7)=1 AND x(3)=1 AND a(5)=0 THEN com1=5
            ' Defend
            IF com1=0 AND o(5)=1 AND o(6)=1 AND a(4)=0 THEN com1=4
            IF com1=0 AND o(5)=1 AND o(4)=1 AND a(6)=0 THEN com1=6
            IF com1=0 AND o(5)=1 AND o(8)=1 AND a(2)=0 THEN com1=2
            IF com1=0 AND o(5)=1 AND o(2)=1 AND a(8)=0 THEN com1=8
            IF com1=0 AND o(5)=1 AND o(1)=1 AND a(9)=0 THEN com1=9
            IF com1=0 AND o(5)=1 AND o(7)=1 AND a(3)=0 THEN com1=3
            IF com1=0 AND o(5)=1 AND o(9)=1 AND a(1)=0 THEN com1=1
            IF com1=0 AND o(5)=1 AND o(3)=1 AND a(7)=0 THEN com1=7
            IF com1=0 AND o(1)=1 AND o(2)=1 AND a(3)=0 THEN com1=3
            IF com1=0 AND o(3)=1 AND o(2)=1 AND a(1)=0 THEN com1=1
            IF com1=0 AND o(1)=1 AND o(4)=1 AND a(7)=0 THEN com1=7
            IF com1=0 AND o(3)=1 AND o(6)=1 AND a(9)=0 THEN com1=9
            IF com1=0 AND o(7)=1 AND o(4)=1 AND a(1)=0 THEN com1=1
            IF com1=0 AND o(7)=1 AND o(8)=1 AND a(9)=0 THEN com1=9
            IF com1=0 AND o(9)=1 AND o(8)=1 AND a(7)=0 THEN com1=7
            IF com1=0 AND o(9)=1 AND o(6)=1 AND a(3)=0 THEN com1=3
            IF com1=0 AND o(1)=1 AND o(7)=1 AND a(4)=0 THEN com1=4
            IF com1=0 AND o(7)=1 AND o(9)=1 AND a(8)=0 THEN com1=8
            IF com1=0 AND o(9)=1 AND o(3)=1 AND a(6)=0 THEN com1=6
            IF com1=0 AND o(3)=1 AND o(1)=1 AND a(2)=0 THEN com1=2
            IF com1=0 AND o(2)=1 AND o(8)=1 AND a(5)=0 THEN com1=5
            IF com1=0 AND o(4)=1 AND o(6)=1 AND a(5)=0 THEN com1=5
            IF com1=0 AND o(1)=1 AND o(9)=1 AND a(5)=0 THEN com1=5
            IF com1=0 AND o(7)=1 AND o(3)=1 AND a(5)=0 THEN com1=5
        END IF

        IF com1 = 0 THEN
            RANDOMIZE TIMER
            DIM found AS INTEGER
            found = 0
            DO WHILE found = 0
                com1 = INT(RND * 9) + 1
                IF a(com1) = 0 THEN found = 1
            LOOP
        END IF
    END IF

    a(com1) = 1
    x(com1) = 1
    SELECT CASE com1
        CASE 1: LINE (60,160)-(90,190):   LINE (60,190)-(90,160)
        CASE 2: LINE (110,160)-(140,190): LINE (110,190)-(140,160)
        CASE 3: LINE (160,160)-(190,190): LINE (160,190)-(190,160)
        CASE 4: LINE (60,110)-(90,140):   LINE (60,140)-(90,110)
        CASE 5: LINE (110,110)-(140,140): LINE (110,140)-(140,110)
        CASE 6: LINE (160,110)-(190,140): LINE (160,140)-(190,110)
        CASE 7: LINE (60,60)-(90,90):     LINE (60,90)-(90,60)
        CASE 8: LINE (110,60)-(140,90):   LINE (110,90)-(140,60)
        CASE 9: LINE (160,60)-(190,90):   LINE (160,90)-(190,60)
    END SELECT

    com1 = 0
END SUB

' ============================================================
' FUNCTION: CheckResult
' Returns 0=ongoing, 1=player wins, 2=computer wins, 3=draw
' ============================================================
FUNCTION CheckResult ()
    IF (o(1) AND o(2) AND o(3)) OR (o(4) AND o(5) AND o(6)) OR (o(7) AND o(8) AND o(9)) THEN CheckResult = 1: EXIT FUNCTION
    IF (o(7) AND o(4) AND o(1)) OR (o(8) AND o(5) AND o(2)) OR (o(9) AND o(6) AND o(3)) THEN CheckResult = 1: EXIT FUNCTION
    IF (o(1) AND o(5) AND o(9)) OR (o(7) AND o(5) AND o(3)) THEN CheckResult = 1: EXIT FUNCTION
    IF (x(1) AND x(2) AND x(3)) OR (x(4) AND x(5) AND x(6)) OR (x(7) AND x(8) AND x(9)) THEN CheckResult = 2: EXIT FUNCTION
    IF (x(7) AND x(4) AND x(1)) OR (x(8) AND x(5) AND x(2)) OR (x(9) AND x(6) AND x(3)) THEN CheckResult = 2: EXIT FUNCTION
    IF (x(1) AND x(5) AND x(9)) OR (x(7) AND x(5) AND x(3)) THEN CheckResult = 2: EXIT FUNCTION
    IF a(1) AND a(2) AND a(3) AND a(4) AND a(5) AND a(6) AND a(7) AND a(8) AND a(9) THEN CheckResult = 3: EXIT FUNCTION
    CheckResult = 0
END FUNCTION

' ============================================================
' SUB: ShowHelp
' ============================================================
SUB ShowHelp
    DIM readAgain AS INTEGER
    readAgain = 1
    DO WHILE readAgain = 1
        CLS
        PRINT ":::WELCOME TO THE ONLINE HELP DESK:::"
        PRINT ""
        PRINT "Technical Help::"
        PRINT ""
        PRINT "For technical help call our toll free hotline* on 0405 784 104."
        PRINT "The hotline is open 24/7 since our phone operator is so incredibly"
        PRINT "reliable. If the line is engaged (probably with complaints) then"
        PRINT "consult this guide."
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
        PRINT ":::WELCOME TO THE ONLINE HELP DESK:::"
        PRINT ""
        PRINT "Tutorial::"
        PRINT ""
        PRINT "The game is simple and is very hard to misinterpret."
        PRINT "Upon opening the program and hitting F5 the program will begin."
        PRINT "Enter your name when prompted. Choose your difficulty by pressing"
        PRINT "either 1 for easy, 2 for medium or 3 for hard. The counter placement"
        PRINT "system is represented by the number pad on the right hand side of your"
        PRINT "keyboard. For the top left square you would press 7. For the"
        PRINT "middle square you would press 5."
        SLEEP
        CLS

        DIM helpChoice AS INTEGER
        DIM validHelp AS INTEGER
        validHelp = 0
        DO WHILE validHelp = 0
            LOCATE 3,3: PRINT "                                                                                 "
            LOCATE 3,3
            INPUT "do you want to read again? (1-yes, 2-no) ::: ", helpChoice
            IF helpChoice = 1 OR helpChoice = 2 THEN
                validHelp = 1
            ELSE
                LOCATE 3,5: PRINT "error - only 1 or 2"
            END IF
        LOOP

        IF helpChoice = 2 THEN readAgain = 0
    LOOP

    ' Redraw board and pieces after help
    CLS
    LINE (50,100)-(200,100)
    LINE (50,150)-(200,150)
    LINE (100,50)-(100,200)
    LINE (150,50)-(150,200)
    COLOR 12
    LOCATE 14,5: PRINT "Welcome to Tristan's, Ben's and Kyle's asignment. Have a nice day."
    LOCATE 16,5: PRINT "Restart the program with '100'. End with '200' (the number then enter)"
    LOCATE 18,5: PRINT "For help press '300'. The game will resume after reading."
    LOCATE 20,5: PRINT "Tic Tac Toe - use the number pad as the positioning - then press enter"
    COLOR col1
    LOCATE 2,30: PRINT "Welcome to the game "; p1

    COLOR col2
    DIM j AS INTEGER
    FOR j = 1 TO 9
        IF x(j) = 1 THEN
            SELECT CASE j
                CASE 1: LINE (60,160)-(90,190):   LINE (60,190)-(90,160)
                CASE 2: LINE (110,160)-(140,190): LINE (110,190)-(140,160)
                CASE 3: LINE (160,160)-(190,190): LINE (160,190)-(190,160)
                CASE 4: LINE (60,110)-(90,140):   LINE (60,140)-(90,110)
                CASE 5: LINE (110,110)-(140,140): LINE (110,140)-(140,110)
                CASE 6: LINE (160,110)-(190,140): LINE (160,140)-(190,110)
                CASE 7: LINE (60,60)-(90,90):     LINE (60,90)-(90,60)
                CASE 8: LINE (110,60)-(140,90):   LINE (110,90)-(140,60)
                CASE 9: LINE (160,60)-(190,90):   LINE (160,90)-(190,60)
            END SELECT
        END IF
    NEXT j
    COLOR col1
    FOR j = 1 TO 9
        IF o(j) = 1 THEN
            SELECT CASE j
                CASE 1: CIRCLE (75,175), 18
                CASE 2: CIRCLE (125,175), 18
                CASE 3: CIRCLE (175,175), 18
                CASE 4: CIRCLE (75,125), 18
                CASE 5: CIRCLE (125,125), 18
                CASE 6: CIRCLE (175,125), 18
                CASE 7: CIRCLE (75,75), 18
                CASE 8: CIRCLE (125,75), 18
                CASE 9: CIRCLE (175,75), 18
            END SELECT
        END IF
    NEXT j
END SUB
