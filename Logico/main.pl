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
waysGame(2):- anagramaLabel(), startAnagrama().   
waysGame(3):- menuLabel(), menuMain(). 

waysRecords(1):- recordLabel(),recordTermo(),menuMain().
waysRecords(2):- recordAnagrama().
waysRecords(3):- menuLabel(),menuMain().

waysCredit(_):- menuLabel(), menuMain().

startTermo():-
    open("arquivos/palavrasTermoo.txt", read, Dados),
    getWords(Dados,Palavras),!,
    close(Dados), 
    length(Palavras, CountPalavras),
    randomWords(Palavras, CountPalavras, PalavrasRandom),  
    termo(PalavrasRandom, 5, 150),
    menuLabel(), menuMain().

startAnagrama():-
    open("arquivos/palavrasAnagrama.txt", read, Dados),
    getWords(Dados,Termos),!,
    close(Dados),
    terms_to_strings(Termos,TodasPalavras),
    n_elementos(TodasPalavras,5,Palavras),
    get_time(Tempo),
    anagrama(Palavras,Palavras,10,Tempo),
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

    


    
    
    
    