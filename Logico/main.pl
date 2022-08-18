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

waysGame(1):- termoLabel(), startTermo().
waysGame(2):- anagramaLabel(), mainAnagrama().   
waysGame(3):- menuLabel(), menuMain(). 

waysRecords(1):- recordTermo().
waysRecords(2):- writeln('recordAnagrama').
waysRecords(3):- menuLabel(),menuMain().
    
waysCredit(_):- menuLabel(), menuMain().

startTermo():-
    open("arquivos/palavrasTermoo.txt", read, Dados),
    getWords(Dados,Palavras),!,
    close(Dados), 
    termo(Palavras, 5, 150),
    menuLabel(), menuMain().


termo([_|_], 0, Pontos):- recordLabel(),menuSaveRecordTermo(Pontos).
termo([Palavra1|[]], Vidas, Pontos):- 
    writeln(' ____________________________'),
    write(' Tentativas restantes: '), writeln(Vidas), 
    nl,
    write(' Pontos: '), writeln(Pontos),
    nl,
    write(' Palavra: '),
    string_chars(Palavra1, PalavraSeparada),
    spacesWord(PalavraSeparada),
    writeln(' ____________________________'),
    writeln(' Tentativa: '), write(' '),read(Entrada), 
    (Entrada == Palavra1 -> recordLabel(),menuSaveRecordTermo(Pontos) ;
    string_chars(Entrada, EntradaSeparada), 
    line(), write('Tentativa Anterior:'),checkWord(EntradaSeparada, PalavraSeparada, PalavraSeparada), 
    NP is Pontos - 25, NV is Vidas - 1, termo([Palavra1|PalavrasN], NV, NP)).

termo([Palavra1|PalavrasN], Vidas, Pontos) :-
    writeln(' ____________________________'),
    write(' Tentativas restantes: '), writeln(Vidas), 
    nl,
    write(' Pontos: '), writeln(Pontos),
    nl,
    write(' Palavra: '),
    string_chars(Palavra1, PalavraSeparada),
    spacesWord(PalavraSeparada),
    writeln(' ____________________________'),
    writeln(' Tentativa: '), write(' '),read(Entrada), 
    (Entrada == Palavra1 -> NP is Pontos + 150, termo(PalavrasN, 5, NP) ;
    string_chars(Entrada, EntradaSeparada), line(),
    write(' tentativa anterior:'),checkWord(EntradaSeparada, PalavraSeparada, PalavraSeparada), 
    NP is Pontos - 25, NV is Vidas - 1, termo([Palavra1|PalavrasN], NV, NP)).




         

    


    
    
    
    