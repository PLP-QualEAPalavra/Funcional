:-include('menus.pl').
:-include('anagrama.pl').
:-include('termoo.pl').
:-include('letreiros.pl').

main:-
    menuLabel(),
    menuMain().

waysMain(1):-menuLabel(), menuGame().
waysMain(2):- menuLabel(),menuRecords().
waysMain(3):- creditLabel(),menuCredits().
waysMain(4):- halt.

waysGame(1):- termoLabel(), mainTermo().
waysGame(2):- anagramaLabel(), mainAnagrama().   
waysGame(3):- menuLabel(), menuMain(). 

waysRecords(1):- writeln('recordTermoo').
waysRecords(2):- writeln('recordAnagrama').
waysRecords(3):- menuLabel(),menuMain().
    
waysCredit(_):- menuLabel(), menuMain().
     

    


    
    
    
    