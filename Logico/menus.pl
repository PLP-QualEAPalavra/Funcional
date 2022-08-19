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
    writeln(' Insira a opcao: '), write(' '), read(Op), waysRecords(Op). 

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
    salvaNomeTermo(),
    salvaPontosTermo(Pontos).

salvaNomeTermo():-
    read(Nome),
    open('arquivos/recordTermoNomes.txt', append, Dado),
    write(Dado, Nome), writeln(Dado, '.'),
    close(Dado).

salvaPontosTermo(Pontos):-
    open('arquivos/recordTermoPontos.txt', append, Dado),
    write(Dado, Pontos), writeln(Dado,'.'),
    close(Dado).


menuSaveRecordAnagrama(Pontos):-
    writeln(' ____________________________'),
    writeln(' Insira seu nome:'), write(' '),
    read(Nome),
    salvaNomeAnagrama(Nome),
    salvaPontosAnagrama(Pontos).

salvaNomeAnagrama(Nome):-
    open('arquivos/recordAnagramaNomes.txt', append, Dado),
    write(Dado, Nome), writeln(Dado, '.'),
    close(Dado).

salvaPontosAnagrama(Pontos):-
    open('arquivos/recordAnagramaPontos.txt', append, Dado),
    write(Dado, Pontos), writeln(Dado, '.'),
    close(Dado),!.

regraAnagrama():-
    writeln(' ____________________________________________'),
    writeln(' A cada nova palavra, voce inicia o jogo com'),
    writeln(' não não ultrapasse o tempo de 10 minutos. '),
    writeln(' Nesse modo existe um conjunto de palavras'),
    writeln(' com caracteres em comum e o jogador deve'),
    writeln(' encontrar que forme uma palavra.'),
    writeln(' A cada palavra acertada, você ganha 10'),
    writeln(' pontos, sendo somado no seu total de pontos.'),
    writeln(' Quando acerta uma palavra em sequência, '),
    writeln(' aumentará '),
    writeln(' um multiplicador, por exemplo com o '),
    writeln(' acerto de uma palavra é alcançado 10 pontos,'),
    writeln(' com o acerto de outra em seguida se consegue'),
    writeln(' 20 pontos.'),
    writeln(' A cada tentativa errada se perde 1 ponto.  '),
    writeln(' partida acaba quando é alcançado o limite do'),
    writeln(' tempo ou se acertando todas as palavras'),
    writeln(' do anagrama. '),
    writeln(' ____________________________________________'),
    writeln('          Digite 1 para comecar!             '),
    writeln(' ____________________________________________'),
    read(Op).

regraTermo():-
    writeln(' ____________________________________________'),
    writeln(' A cada nova palavra, você inicia o jogo com'),
    writeln(' 150 pontos. Para cada tentativa que você não'),
    writeln(' acertar a palavra, você perde 25 pontos,ou'),
    writeln(' seja, se você acertar a palavra de primeira,'),
    writeln(' pontua 150 pontos, se acertar na segunda, '),
    writeln(' pontua 125 pontos e assim respectivamente.'),
    writeln(' caso suas vidas acabem, o jogo sera encer-'),
    writeln(' rado.'),
    writeln(' ____________________________________________'),
    writeln(' Se a letra aparecer verde: ela esta na pala-'),
    writeln(' vra e na posicao correta. '),
    writeln(' Se a letra aparecer amarela: ela esta na pala-,'),
    writeln(' vra mas a posicao esta incorreta. '),
    writeln(' Se a letra aparecer vermelha: ela nao esta na'),
    writeln(' palavra.'),
    writeln(' ____________________________________________'),
    writeln('          Digite 1 para comecar!             '),
    writeln(' ____________________________________________'),
    read(Op).


