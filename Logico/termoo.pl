colorRed2(Z):- ansi_format([bold,fg(red)], ' ~w', [Z]).
colorGreen2(Z):- ansi_format([bold,fg(green)], ' ~w', [Z]).
colorYellow2(Z):- ansi_format([bold,fg(yellow)], ' ~w', [Z]).

getWords(Dados, []):- at_end_of_stream(Dados).
getWords(Dados, [H|T]):- 
    \+ at_end_of_stream(Dados),
    read(Dados,H),
    getWords(Dados,T).

spacesWord([H|T]):-
    length(T, Tamanho), (Tamanho > 0 -> write('_ '), spacesWord(T) ; writeln('_')).


checkWord([H1|[]], [H2|[]], [H3|T3]):-
    (H1 == H2 -> colorGreen2(H1); 
    member(H1, [H3|T3]) -> colorYellow2(H1); colorRed2(H1)),writeln(' '),!.
checkWord([H1|T1],[H2|T2],[H3|T3]):-
    (H1 == H2 -> colorGreen2(H1), checkWord(T1, T2, [H3|T3]) ; 
    member(H1, [H3|T3]) -> colorYellow2(H1), checkWord(T1, T2, [H3|T3]) ;
    colorRed2(H1), checkWord(T1, T2, [H3|T3])).

recordTermo():-
    getInfo('arquivos/recordTermoNomes.txt', Nomes),
    getInfo('arquivos/recordTermoPontos.txt', Pontos),
    sortLists(Nomes, Pontos, ListaNomes, ListaPontos),
    writeln(' ____________________________'),
    printRecord(ListaNomes, ListaPontos),
    writeln(' ____________________________'),
    writeln(' Digite 1 para voltar: '), read(Op),menuLabel(),menuRecords().

sortLists(Nomes, Pontos, NomeOrg, PontosOrg):-
    zipPairs(Pontos, Nomes, Pairs),
    sort(1, @>=, Pairs, PairsOrd),
    pairs_values(PairsOrd, PontosOrg),
    pairs_keys(PairsOrd, NomeOrg).

zipPairs([], [], []).
zipPairs([H1|T1], [H2|T2], [H1-H2|T]) :- zipPairs(T1, T2, T).

getInfo(Caminho, ListaInfo):-
    open(Caminho, read, Dados),
    getWords(Dados,ListaInfo),
    close(Dados),!.

printRecord([], []).
printRecord([Hnome|Tnome], [Hponto|Tponto]):-
    write(' Jogardor: '), write(Hnome), write(' | '), write(' Pontos: '), writeln(Hponto),
    printRecord(Tnome,Tponto).

randomWords([],_,_).
randomWords(L,1,R) :- R = [X],random_member(X,L).
randomWords(L,N,R) :- R = [X|Y], random_member(X,L),
    N1 is N-1,
    select(X,L,L1),
    n_elementos(L1,N1,Y).