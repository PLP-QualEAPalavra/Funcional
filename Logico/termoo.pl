red().
green().
yellow().

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


    
checkWord([H1|T1],[H2|T2],[H3|T3]):-
    (H1 == H2 -> colorGreen2(H1), write(' '), checkWord(T1, T2, [H3|T3]) ; 
    member(H1, [H3|T3]) -> colorYellow2(H1), write(' '), checkWord(T1, T2, [H3|T3]) ;
    colorRed2(H1), checkWord(T1, T2, [H3|T3])).

