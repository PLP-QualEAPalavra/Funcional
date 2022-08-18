%subtract(L1,L2,R) L2-L1

%retorna N elementos diferentes de uma lista
palavras([],,).
palavras(L,1,R) :- R = [X],random_member(X,L).
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
embaralha(L,R) :- junta(L,T),subset(T,T1),
    removeLast(T1,T2),
    randompermutation(T2,R).

%tira ultimo
removeLast([|[]],[]).
removeLast([X|Y],[X|T]) :- removeLast(Y,T).

%junta strings em lista de atomos
junta([],[]).
junta([X|Y],R) :- append(R1,R2,R),
    atom_chars(X,R1),
    junta(Y,R2).

%LoopSimplesFor
Loop(0).
Loop(X) :- X1 is X-1,Loop(X1).

%write embaralho
writeEmbaralho([]) :- writeln(" ").
writeEmbaralho([X|Y]):- write(X),write(" "),
    writeEmbaralho(Y).

%write secreto
writeSecret(S) :- stringlength(S,X), writeSecret(S,X).

writeSecret(S,X):- write(" "),X1 is X-1,writeSecret(S,X1). 
writeSecret(S,X) :- string_length(S, Length)




%jogo de fato
anagrama(ListaPalavras,ListaAcertadas,Pontos,Jogador,)