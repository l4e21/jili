:- object(set_tests, extends(lgtunit)).
   :- public([combinations/3]).
   :- use_module(library(clpfd)).
   :- use_module(library(lists)).

   combinations_aux(_, [], []).
   combinations_aux(A, [B|Bs], [[A, B]|Combos]) :-
       combinations_aux(A, Bs, Combos).

   combinations([], _, []).
   combinations([A|As], Bs, Combos) :-
       combinations_aux(A, Bs, Combos1),
       combinations(As, Bs, Combos2),
       lists:append(Combos1, Combos2, Combos).

   test(nats) :-
       forall(X in 1..100, union(odds, evens)::member(X)).

   test(members) :-
       union(union(single(3), single(5)), single(4))::members(Xs),
       %% Members as list will be ordered DFS. I don't recommend using this as a generator obviously!
       Xs == [3, 5, 4].

   test(unions_membership) :-
       union(single(3), single(5))::member(3).

   test(intersection_membership) :-
       \+ intersection(single(3), single(2))::member(3).

   test(product_membership) :-
       union(single(3), single(2))::product(union(single(4), single(5)), Product),
       combinations([3, 2], [4, 5], Combos),
       forall(lists:member([X, Y], Combos), Product::member((X, Y))).

%% Note on Unions: if the mem is directly from the second slot, it
%% won't find the simplest solution first due to DFS. We could switch
%% to BFS, since that's more useful for sets.
  %% test(unions_bfs) :-
  %%     union(X, single(5))::member(3),
  %%     X == union(_, single(3)).
:- end_object.
