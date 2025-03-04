:- object(topology_tests, extends(lgtunit)).
   :- public([]).
   :- use_module(library(clpfd)).
   :- use_module(library(lists)).

   test(tau) :-
       Tau = tau(tau(empty_topology, single(3)), single(4)),
       Tau::open(single(3)),
       Tau::open(single(4)),
       Tau::open(union(single(4), single(3))),
       Tau::open(intersection(single(4), single(3))),
       Tau::open(intersection(single(3), empty_set)),
       findall(X, Tau::open(X), Xs),

    test(d_tau) :-
       Tau = d_tau(d_tau(empty_topology, single(3)), single(4)),
       findall(X, Tau::open(X), Xs),
       Xs == [empty_set].

    test(e_tau) :-
       Tau = e_tau(d_tau(d_tau(empty_topology, single(3)), single(4))),
       findall(X, Tau::open(X), Xs),
       Xs == [union(single(4),union(single(3),empty_set)),empty_set].

:- end_object.
