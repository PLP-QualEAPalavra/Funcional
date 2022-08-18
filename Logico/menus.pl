menuMain():-
    write('\33[H\e[2J'),
    writeln(' ____________________________'),
    writeln(' 1 - Jogar'),
    writeln(' 2 - Recordes'),
    writeln(' 3 - Creditos'),
    writeln(' 4 - Sair'),
    writeln(' ____________________________'),
    writeln(' Insira a opcao: '), write(' '), read(Op), waysMain(Op).

menuGame():-
    writeln(' ____________________________'),
    writeln(' 1 - Modo Termoo'),
    writeln(' 2 - Modo Anagrama'),
    writeln(' 3 - voltar'),
    writeln(' ____________________________'),
    writeln(' Insira a opcao: '), write(' '), read(Op), waysGame(Op).


menuRecords():-
    writeln(' ____________________________'),
    writeln(' 1 - Recordes Termoo'),
    writeln(' 2 - Recordes Anagrama'),
    writeln(' 3 - voltar'),
    writeln(' ____________________________'),
    writeln('Insira a opcao: '), write(' '), read(Op), waysRecords(Op). 

menuCredits():-
    writeln(' ____________________________'),
    writeln(' Fabio Almendro'),
    writeln(' Maysa Freire de Araujo'),
    writeln(' Huandrey de Souza Pontes'),
    writeln(' Guilherme de Sena Fernandes'),
    writeln(' Maria das Gracas Soares da Costa'),
    writeln(' ____________________________'),
    writeln(' 1 - voltar'),
    writeln(' Insira a opcao: '), write(' '), read(Op),waysCredit(Op).

menuSaveRecordTermo(Pontos):-
    writeln(' ____________________________'),
    writeln(' Insira seu nome:'), write(' '),
    read(Nome),
    salvaNome(Nome),
    salvaPontos(Pontos).

salvaNome(Nome):-
    open('arquivos/recordTermoNomes.txt', append, Dado),
    write(Dado, Nome), writeln(Dado, '.'),
    close(Dado).

salvaPontos(Pontos):-
    open('arquivos/recordTermoPontos.txt', append, Dado),
    write(Dado, Pontos), writeln(Dado, '.'),
    close(Dado).