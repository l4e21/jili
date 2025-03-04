
# Principled Symbolic Mathematics in the Declarative-OOP style

Tired of type theory? Hate the opacity of ADTs and closures? Want to learn sets the relational/object-oriented way, in the same way the best mathematics professors in the world *actually* teach it? We do too!

To use this library in another project, check out 

https://logtalk.org/manuals/userman/programming.html#writing-and-running-applications

Currently supports SWI-PL only

## Features 

### Sets

Sets in Jili are relational, following the OOP traditional and can be queried and generated bi-directionally. E.G., `elem(X, 5)` is expected to (eventually) generate all the possible sets according to definition which can contain 5.

Already, this beats most implementations of sets when it comes to teaching the fundamentals of mathematics, because the set is defined relationally as it is done in the field of Pure Maths.

### Topologies

Topologies in Jili are constructed by point-free definitions, meaning that they have no reference to underlying spaces. Topologies are defined intrinsically by the relations between sets in the topology, rather than by float arithmetic or Higher Order Type Theory.

Topologies are constructed as chains of 'tau cells' and in this way reflect theories of inductively-generated formal topologies. This means no higher-order predicates (which damage completeness) need to be involved.


## TODO

- Produce graphical applications using XPCE to explore mathematical structures

- Experiment more with the generation and testing of topologies

