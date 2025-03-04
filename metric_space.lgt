:- protocol(metric_space).
   :- public([distance/3]).
:- end_protocol.

%% The input set of a metric space is a domain as a set.
%% Doesn't like floats of course, but this is the most perfect solution symbolically
:- object(integer_cartesian(_S_), implements(metric_space)).
   :- use_module(library(clpfd)).

   squared_pythagorean_distance(X1, X2, P) :-
       X1 \= (_, _), X2 \= (_, _),
       X #= X1 - X2, P #= X ^ 2. 
   squared_pythagorean_distance((X1, Rest1), (X2, Rest2), P) :-
       X #= X1 - X2,
       P #= X ^ 2 + P1,
       squared_pythagorean_distance(Rest1, Rest2, P1).
   
   distance(X, Y, D) :-
       implements_protocol(_S_, set),
       _S_::member(X), _S_::member(Y),
       squared_pythagorean_distance(X, Y, Square),
       Square #= D * D.
:- end_object.

%% Allows some completeness, but requires integers and outputs floats
:- object(pseudointeger_cartesian(_S_), implements(metric_space)).
   :- use_module(library(clpfd)).

   squared_pythagorean_distance(X1, X2, P) :-
       X1 \= (_, _), X2 \= (_, _),
       X #= X1 - X2, P #= X ^ 2. 
   squared_pythagorean_distance((X1, Rest1), (X2, Rest2), P) :-
       X #= X1 - X2,
       P #= X ^ 2 + P1,
       squared_pythagorean_distance(Rest1, Rest2, P1).
   
   distance(X, Y, D) :-
       implements_protocol(_S_, set),
       _S_::member(X), _S_::member(Y),
       squared_pythagorean_distance(X, Y, Square),
       D is sqrt(Square).
:- end_object.

%% Pure floats, takes anything, also means it will generate anything
:- object(float_cartesian(_S_), implements(metric_space)).
   :- use_module(library(clpfd)).

   squared_pythagorean_distance(X1, X2, P) :-
       X1 \= (_, _), X2 \= (_, _),
       X is X1 - X2,
       P is X ** 2. 
   squared_pythagorean_distance((X1, Rest1), (X2, Rest2), P) :-
       X is X1 - X2,
       XS is X ** 2,
       squared_pythagorean_distance(Rest1, Rest2, P1),
       P is P1 + XS.

   distance(X, Y, D) :-
       implements_protocol(_S_, set),
       _S_::member(X), _S_::member(Y),
       squared_pythagorean_distance(X, Y, Square),
       D is sqrt(Square).
:- end_object.

