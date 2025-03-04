:- protocol(graph).
   :- public([node/1, neighbour/2]).
:- end_protocol.

%% Problems with this implementation of undirected graphs
%% Nodes can't connect to themselves
:- object(undirected_graph(_V_, _E_), implements(graph)).
   node(X) :- implements_protocol(_V_, set), _V_::member(X).
   neighbour(X, Neighbour) :-
       implements_protocol(_V_, set),
       implements_protocol(_E_, set),
       _V_::member(X),
       _E_::member(Edge),
       implements_protocol(Edge, set),
       Edge::member(X),
       Edge::member(Neighbour),
       X \== Neighbour. 
:- end_object.

:- object(directed_graph(_V_, _E_), implements(graph)).
   node(X) :- implements_protocol(_V_, set), _V_::member(X).
   neighbour(X, Neighbour) :-
       implements_protocol(_V_, set),
       implements_protocol(_E_, set),
       _V_::member(X),
       (_E_::member((X, Neighbour));
        _E_::member((Neighbour, X))).
:- end_object.
