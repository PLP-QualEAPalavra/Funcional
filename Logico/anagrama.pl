:-include('letreiros.pl').
:-include('menus.pl').

%verifica timer
verify(TimeDif):-(TimeDif >= 600,
    timeOutAnagrama(),
    halt; 
    TimeDif < 600).

%DerrotaPorPontosZerados
anagrama(_, _, Pontos, _):-%TO DO
    Pontos is 0,
    nl,
    writeln("DERROTA"),
    writeln("# PONTUAÇÃO ZERADA #").

%Vitoria
anagrama(_,[],Pontos,_):-
    writeln("VITORIA!!!"),
    recordLabel(),
    menuSaveRecordAnagrama(Pontos).


%Anagrama
anagrama(ListaPalavras,ListaAcertadas,Pontos,Tempo):-
    %verificando tempo
    get_time(TimeAtual),
	TimeDif is TimeAtual - Tempo,
	verify(TimeDif), 
    writeln(''),
    embaralha(ListaAcertadas,Embaralhado),
    write("Pontos: "),writeln(Pontos),
    writeEmbaralho(Embaralhado),
    writePalavras(ListaAcertadas),
    inputString("Digite Tentativa: ",X),
    (   member(X,ListaAcertadas) -> 
    
    %acertou
    writeln("Acertou!"),
    subtract(ListaAcertadas,[X],NovaLista),
    NovoPontos is Pontos + 5,
    anagrama(ListaPalavras,NovaLista,NovoPontos,Tempo);
    
    %errou
    writeln("Errou!"),
    NovoPontos is Pontos - 1,
    anagrama(ListaPalavras,ListaAcertadas,NovoPontos,Tempo)
    ).

%Input
inputString(Msg,S):- write(Msg),read(E),term_string(E,S).

%Lista de termos para lista strings
terms_to_strings([],[]).
terms_to_strings([T|X],[S|Y]):-
    term_string(T,S),terms_to_strings(X,Y).
    
%retorna N elementos diferentes de uma lista
n_elementos([],_,_).
n_elementos(L,1,R) :- R = [X],random_member(X,L).
n_elementos(L,N,R) :- R = [X|Y], random_member(X,L),
    N1 is N-1,
    select(X,L,L1),
    n_elementos(L1,N1,Y).


%embaralha strings em uma string sem repetidos 
embaralha(L,R) :- junta(L,T),
    list_to_set(T,T1),
    random_permutation(T1,R).

%junta strings em lista de atomos
junta([],[]).
junta([X|Y],R) :- append(R1,R2,R),
    atom_chars(X,R1),
    junta(Y,R2).

%writePalavras
writePalavras(L) :- writePalavras(L,0).
writePalavras(L,X):-length(L,X).

writePalavras(L,X):- length(L,Y), not(X=Y),nth0(X,L,R),X1 is X+1,
    writeSecret(R), writeln(""),
    writePalavras(L,X1).

%write embaralho
writeEmbaralho([]) :- writeln(" ").
writeEmbaralho([X|Y]):- write(X),write(" "),
    writeEmbaralho(Y).

%writeSecreto

writeSecret(S) :- string_length(S,X), writeSecret(S,X).
writeSecret(_,0).
writeSecret(S,X):- write("_ "),X1 is X-1,writeSecret(S,X1).

%record
recordAnagrama():-
    getInfo('arquivos/recordAnagramaNomes.txt', Nomes),
    getInfo('arquivos/recordAnagramaPontos.txt', Pontos),
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

getWords(Dados, []):- at_end_of_stream(Dados).
getWords(Dados, [H|T]):- 
    \+ at_end_of_stream(Dados),
    read(Dados,H),
    getWords(Dados,T).

printRecord([], []).
printRecord([Hnome|Tnome], [Hponto|Tponto]):-
    write(' Jogardor: '), write(Hnome), write(' | '), write(' Pontos: '), writeln(Hponto),
    printRecord(Tnome,Tponto).