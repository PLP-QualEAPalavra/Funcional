getWords(Dados, []):- at_end_of_stream(Dados).
getWords(Dados, [H|T]):- 
    \+ at_end_of_stream(Dados),
    read(Dados,H),
    getWords(Dados,T).

spacesWord([H|T]):-
    length(T, Tamanho), (Tamanho > 0 -> write('_ '), spacesWord(T) ; writeln('_')).


