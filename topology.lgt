:- protocol(topology).
   :- public([domain/1, open/1]).
:- end_protocol.

:- object(empty_topology, implements(topology)).
   domain(empty_set).
   open(empty_set).
:- end_object.

:- object(tau(_T_, _E_), implements(topology)).   
   domain(union(_E_, D)) :- implements_protocol(_T_, topology), _T_::domain(D).
   open(X) :- (X = _E_;
               implements_protocol(_T_, topology),
               (_T_::open(Y),
                (X = union(_E_, Y);
                 X = union(Y, _E_);
                 X = intersection(_E_, Y);
                 X = intersection(Y, _E_));
                _T_::open(X))).
:- end_object.

:- object(d_tau(_T_, _E_), implements(topology)).   
   domain(union(_E_, D)) :- implements_protocol(_T_, topology), _T_::domain(D).
   open(X) :-  implements_protocol(_T_, topology), (_T_::open(X)).
:- end_object.

:- object(e_tau(_T_), implements(topology)).   
   domain(D) :- _T_::domain(D).
   open(X) :- (domain(X);
               implements_protocol(_T_, topology),
               (_T_::open(X))).
:- end_object.
