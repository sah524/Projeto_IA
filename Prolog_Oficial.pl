
% PREDICADO PRINCIPAL  

main :-
    statistics(cputime, T1),
    modelo(Solucao),
    imprime_lista(Solucao),
    statistics(cputime, T2),
    Tempo is T2 - T1,
    write('\nTempo de execucao: '), write(Tempo), write(' segundos\n'),
    fail. 

% O segundo main é executado quando não houver mais soluções
main :-
    write('\nBusca finalizada. Nao existem outras solucoes.\n').


% MODELO E RESTRICOES

modelo(Solucao) :-
    % Estrutura da solução com 5 tuplas de 6 atributos 
    Solucao = [
        (Mochila1,Nome1,Mes1,Jogo1,Materia1,Suco1),
        (Mochila2,Nome2,Mes2,Jogo2,Materia2,Suco2),
        (Mochila3,Nome3,Mes3,Jogo3,Materia3,Suco3),
        (Mochila4,Nome4,Mes4,Jogo4,Materia4,Suco4), 
        (Mochila5,Nome5,Mes5,Jogo5,Materia5,Suco5)
    ],

    % Restrições fixas 
    Nome1 = otavio,
    Suco1 = limao,
    Jogo3 = jogo_da_forca,
    Materia3 = biologia,
    Suco3 = morango,
    Nome5 = lenin,

    % Domínios e alldifferent para garantir valores distintos 
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    alldifferent([Nome1,Nome2,Nome3,Nome4,Nome5]),

    materia(Materia1), materia(Materia2), materia(Materia3), materia(Materia4), materia(Materia5),
    alldifferent([Materia1,Materia2,Materia3,Materia4,Materia5]),

    % João gosta de história
    ( (Nome1=joao, Materia1=historia); (Nome2=joao, Materia2=historia);
      (Nome3=joao, Materia3=historia); (Nome4=joao, Materia4=historia);
      (Nome5=joao, Materia5=historia) ),

    suco(Suco1), suco(Suco2), suco(Suco3), suco(Suco4), suco(Suco5),
    alldifferent([Suco1,Suco2,Suco3,Suco4,Suco5]),

    % Matemática gosta de Maracujá
    ( (Materia1=matematica, Suco1=maracuja); (Materia2=matematica, Suco2=maracuja);
      (Materia3=matematica, Suco3=maracuja); (Materia4=matematica, Suco4=maracuja);
      (Materia5=matematica, Suco5=maracuja) ),

    % Uva exatamente à esquerda de Português
    ( (Suco1=uva, Materia2=portugues); (Suco2=uva, Materia3=portugues);
      (Suco3=uva, Materia4=portugues); (Suco4=uva, Materia5=portugues) ),

    mes(Mes1), mes(Mes2), mes(Mes3), mes(Mes4), mes(Mes5),
    alldifferent([Mes1,Mes2,Mes3,Mes4,Mes5]),

    % Matemática nasceu em dezembro
    ( (Materia1=matematica, Mes1=dezembro); (Materia2=matematica, Mes2=dezembro);
      (Materia3=matematica, Mes3=dezembro); (Materia4=matematica, Mes4=dezembro);
      (Materia5=matematica, Mes5=dezembro) ),

    % Setembro ao lado de laranja
    ( (Mes1=setembro, Suco2=laranja); (Mes2=setembro, Suco1=laranja);
      (Mes2=setembro, Suco3=laranja); (Mes3=setembro, Suco2=laranja);
      (Mes3=setembro, Suco4=laranja); (Mes4=setembro, Suco3=laranja);
      (Mes4=setembro, Suco5=laranja); (Mes5=setembro, Suco4=laranja) ),

    % Janeiro ao lado de Setembro
    ( (Mes1=janeiro, Mes2=setembro); (Mes2=janeiro, Mes1=setembro);
      (Mes2=janeiro, Mes3=setembro); (Mes3=janeiro, Mes2=setembro);
      (Mes3=janeiro, Mes4=setembro); (Mes4=janeiro, Mes3=setembro);
      (Mes4=janeiro, Mes5=setembro); (Mes5=janeiro, Mes4=setembro) ),

    jogo(Jogo1), jogo(Jogo2), jogo(Jogo3), jogo(Jogo4), jogo(Jogo5),
    alldifferent([Jogo1,Jogo2,Jogo3,Jogo4,Jogo5]),

    % Cubo Vermelho nas pontas
    (Jogo1 = cubo_vermelho ; Jogo5 = cubo_vermelho),

    % Setembro ao lado de Cubo Vermelho
    ( (Mes1=setembro, Jogo2=cubo_vermelho); (Mes2=setembro, Jogo1=cubo_vermelho);
      (Mes2=setembro, Jogo3=cubo_vermelho); (Mes3=setembro, Jogo2=cubo_vermelho);
      (Mes3=setembro, Jogo4=cubo_vermelho); (Mes4=setembro, Jogo3=cubo_vermelho);
      (Mes4=setembro, Jogo5=cubo_vermelho); (Mes5=setembro, Jogo4=cubo_vermelho) ),

    % Will lado de lógica e mochila branca esquerda de Will 
    ( (Nome2=will, Jogo1=prob_de_logica); (Nome2=will, Jogo3=prob_de_logica);
      (Nome3=will, Jogo2=prob_de_logica); (Nome3=will, Jogo4=prob_de_logica);
      (Nome4=will, Jogo3=prob_de_logica); (Nome4=will, Jogo5=prob_de_logica) ),

    % Uva gosta de lógica
    ( (Suco1=uva, Jogo1=prob_de_logica); (Suco2=uva, Jogo2=prob_de_logica);
      (Suco3=uva, Jogo3=prob_de_logica); (Suco4=uva, Jogo4=prob_de_logica);
      (Suco5=uva, Jogo5=prob_de_logica) ),

    % Forca ao lado de três ou mais
    ( (Jogo3=jogo_da_forca, Jogo2='3_ou_mais'); (Jogo3=jogo_da_forca, Jogo4='3_ou_mais') ),

    mochila(Mochila1), mochila(Mochila2), mochila(Mochila3), mochila(Mochila4), mochila(Mochila5),
    alldifferent([Mochila1,Mochila2,Mochila3,Mochila4,Mochila5]),

    % Lógica ao lado de mochila amarela
    ( (Jogo1=prob_de_logica, Mochila2=amarela); (Jogo2=prob_de_logica, Mochila1=amarela);
      (Jogo2=prob_de_logica, Mochila3=amarela); (Jogo3=prob_de_logica, Mochila2=amarela);
      (Jogo3=prob_de_logica, Mochila4=amarela); (Jogo4=prob_de_logica, Mochila3=amarela);
      (Jogo4=prob_de_logica, Mochila5=amarela); (Jogo5=prob_de_logica, Mochila4=amarela) ),

    % Azul com Janeiro
    ( (Mochila1=azul, Mes1=janeiro); (Mochila2=azul, Mes2=janeiro);
      (Mochila3=azul, Mes3=janeiro); (Mochila4=azul, Mes4=janeiro);
      (Mochila5=azul, Mes5=janeiro) ),

    % Mochila Azul esquerda de maio
    ( (Mochila1=azul, (Mes2=maio;Mes3=maio;Mes4=maio;Mes5=maio));
      (Mochila2=azul, (Mes3=maio;Mes4=maio;Mes5=maio));
      (Mochila3=azul, (Mes4=maio;Mes5=maio));
      (Mochila4=azul, Mes5=maio) ),

    % Uva à direita de Azul
    ( (Mochila1=azul, (Suco2=uva;Suco3=uva;Suco4=uva;Suco5=uva));
      (Mochila2=azul, (Suco3=uva;Suco4=uva;Suco5=uva));
      (Mochila3=azul, (Suco4=uva;Suco5=uva));
      (Mochila4=azul, Suco5=uva) ),

    % Branca esquerda de Will
    ( (Mochila1=branca, Nome2=will); (Mochila2=branca, Nome3=will);
      (Mochila3=branca, Nome4=will); (Mochila4=branca, Nome5=will) ),

    % Forca lado de mochila Vermelha
    ( (Jogo3=jogo_da_forca, Mochila2=vermelha); (Jogo3=jogo_da_forca, Mochila4=vermelha) ).


% FATOS 

mochila(amarela).
mochila(azul).
mochila(branca).
mochila(verde).
mochila(vermelha).

nome(denis).
nome(joao). 
nome(lenin). 
nome(otavio). 
nome(will).

mes(agosto). 
mes(dezembro). 
mes(janeiro). 
mes(maio). 
mes(setembro).

jogo('3_ou_mais'). 
jogo(caca_palavras). 
jogo(cubo_vermelho). 
jogo(jogo_da_forca). 
jogo(prob_de_logica).

materia(biologia). 
materia(geografia). 
materia(historia). 
materia(matematica). 
materia(portugues).

suco(laranja). 
suco(limao). 
suco(maracuja). 
suco(morango). 
suco(uva).

% PREDICADOS AUXILIARES 

alldifferent([]).
alldifferent([H|T]) :- not(member(H, T)), alldifferent(T). 

imprime_lista([]) :- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]) :-
    write('\n......................................\n'),
    write(H), write(' : '),
    imprime_lista(T).