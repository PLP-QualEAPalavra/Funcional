:-include('letreiros.pl').
:-include('menus.pl').

%verificando timer
anagrama(_,_, Pontos,Tempo):-
    get_time(TimeAtual),
	TimeDif is TimeAtual - Tempo,
	verify(TimeDif), 
	writeln('').

verify(TimeDif):-(TimeDif >= 600,
    timeOutAnagrama(),
    halt; 
    TimeDif < 600).

%DerrotaPorPontosZerados
anagrama(_,_,0):-
    writeln("DERROTA"),
    writeln("# PONTUAÇÃO ZERADA #").

%Vitoria
anagrama(_,[],Pontos):-
    writeln("VITÓRIA!!!"),
    write(Pontos),
    menuSaveRecordAnagrama(Pontos),!.

%Anagrama
anagrama(ListaPalavras,ListaAcertadas,Pontos):-
    Pontos \= 0,
    embaralha(ListaAcertadas,Embaralhado),
    write("Pontos: "),writeln(Pontos),
    writeEmbaralho(Embaralhado),
    writePalavras(ListaAcertadas),
    inputString("Digite Tentativa: ",X),
    (   member(X,ListaAcertadas) -> 
    
    %acertou
    subtract(ListaAcertadas,[X],NovaLista),
    NovoPontos is Pontos + 5,
    anagrama(ListaPalavras,NovaLista,NovoPontos);
    
    %errou
    writeln("Errou!"),
    NovoPontos is Pontos - 1,
    anagrama(ListaPalavras,ListaAcertadas,NovoPontos)
    )
    .
    
%Input
inputString(Msg,S):- write(Msg),read(E),term_string(E,S).

%Lista de termos para lista strings
terms_to_strings([],[]).
terms_to_strings([T|X],[S|Y]):-
    term_string(T,S),terms_to_strings(X,Y).
    
    

%retorna N elementos diferentes de uma lista
palavras([],_,_).
palavras(L,1,R) :- R = [X], random_member(X,L).
palavras(L,N,R) :- R = [X|Y], random_member(X,L),
    N1 is N-1,
    select(X,L,L1),
    palavras(L1,N1,Y).

%atomics to strings
letrasUpper([],[]).
letrasUpper([X|Y],[X2|Y1]) :- 
    atom_string(X, X1),
    string_upper(X1, X2),
    letrasUpper(Y,Y1).
 

%embaralha strings em uma string sem repetidos 
embaralha(L,R) :- junta(L,T),
    list_to_set(T,T1),
    random_permutation(T1,R).

%junta strings em lista de atomos
junta([],[]).
junta([X|Y],R) :- append(R1,R2,R),
    atom_chars(X,R1),
    junta(Y,R2).

%LoopSimplesFor
%Loop(0).
%Loop(X) :- X1 is X-1,Loop(X1).

%writePalavras
writePalavras(L) :- writePalavras(L,0).
writePalavras(L,X):-length(L,X).

writePalavras(L,X):- length(L,Y), not(X=Y),nth0(X,L,R),X1 is X+1,
    writeSecret(R), writeln(""),
    writePalavras(L,X1).

%writeEmbaralho
writeEmbaralho([]) :- writeln(" ").
writeEmbaralho([X|Y]):- write(X),write(" "),
    writeEmbaralho(Y).

%writeSecreto

writeSecret(S) :- string_length(S,X), writeSecret(S,X).
writeSecret(_,0).
writeSecret(S,X):- write("_ "),X1 is X-1,writeSecret(S,X1).