:- object(graph_tests, extends(lgtunit)).
   :- public([]).
   :- use_module(library(clpfd)).
   :- use_module(library(lists)).

   test(undirected_graph) :-
       Nodes = union(single(a), single(b)),
       %% For an undirected graph, the edges are a set of unordered pairs. AKA, sets!
       %% Ehh maybe. This disallows self-connection doesn't it..? Rethink.
       Edges = single(union(single(a), single(b))),
       Graph = undirected_graph(Nodes, Edges),
       Graph::node(a),
       Graph::neighbour(a, b).

   test(directed_graph) :-
       Nodes = union(single(a), single(b)),
       %% For an directed graph, the edges are tuples
       Edges = single((a, b)),
       Graph = directed_graph(Nodes, Edges),
       Graph::node(a),
       Graph::neighbour(a, b).

:- end_object.
