
checkcell([X,Y],XX,YY):-
    not( bomb([Y,X])),
    X>=0,
    X<XX,
    Y>=0,
    Y<YY.

checkStars(S,R,[A,B]):-
    (star([B,A])-> R is S+1 ;R is S).


move([X,Y],[NX,Y],Way):-
    %move one cell Right
       NX is X+1,
       dim(A,B),
       XX is A,
       YY is B,
       Way = right,
       checkcell([NX,Y],XX,YY).



move([X,Y],[NX,Y],Way):-
    %move one cell left
       NX is X-1,
       dim(A,B),
       XX is A,
       YY is B,
       Way = left,
    checkcell([NX,Y],XX,YY).



move([X,Y],[X,NY],Way):-
    %move one cell down
    NY is Y+1,
     dim(A,B),
     XX is A,
     YY is B,
     Way = down,
    checkcell([X,NY],XX,YY).



move([X,Y],[X,NY],Way):-
    %move one cell up
    NY is Y-1,
    dim(A,B),
    XX is A,
    YY is B,
    Way = up,
   checkcell([X,NY],XX,YY).


game([],0,End,_,End).
game([H|Moves],Stars,Step,Visitedcells,End):-
       move(Step,NStep,Direction),
      \+ member(NStep,Visitedcells),
     append([NStep],Visitedcells,NewVisitedcells),
      H = Direction,
      game(Moves,NStars,NStep,NewVisitedcells,End),
      Star is NStars,
      checkStars(Star,Stars,NStep).





play(Moves,Stars):-
    start([A,B]),
    end([A1,B1]),
    game(Moves,Stars,[B,A],[[B,A]],[B1,A1]).




