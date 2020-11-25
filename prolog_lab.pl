% Jacob Ziehli
% CSCI 305 Prolog Lab 2

 mother(M,C):- parent(M,C), female(M). %Proves that the parent 'M' is female and the parent of the child C.

 father(F,C):-  parent(F,C), male(F). %Proves the parent F is male and the father of the child C


 spouse(Var,Spouse):- married(Var, Spouse) | married(Spouse, Var).
%Get who is married to 'Spouse'


 child(Var,Child):- parent(Var,Child).


 son(Var,Son):- male(Son), child(Var,Son).



%NOTE TO SELF: TO PROVE:
%Atom "is" the "blank" of "Variable"

sibling(Y,Given):- mother(X,Given),father(Z,Given), child(X,Y), child(Z,Y).

 %Get the mother Y, the father Z, and see if they have any other children.


 daughter(X,Daughter):- female(Daughter), parent(X,Daughter).
%If Daughter is female and has a sibling X...


sister(Var, Sister):- female(Sister), sibling(Var, Sister).


 brother(Var,Bro):- male(Bro), sibling(Var, Bro). %Proves the 'Bro' is the brother of X (sibling does not have to be exclusively male).

 uncle(Y, Uncle):- brother(X,Uncle), parent(X,Y).
%Prove that 'Uncle' has a brother 'X' who is the parent of 'Y'

aunt(Y, Aunt):- sister(X, Aunt), parent(X,Y).
%Prove that 'Uncle' has an Aunt 'X' who is the parent of 'Y'

grandparent(Y, Grandparent):- parent(Grandparent, X), parent(X, Y).
%Prove that Grandparent is the parent of X, and X is the parent of Y.

grandfather(X, Gfather):- grandparent(Gfather,X), male(X).

grandmother(X, Gmother):- grandparent(Gmother,X), female(X).

grandchild(Y, Child):- child(X,Child), child(Y,X).

ancestor(X,Y):- grandparent(Z,X), parent(Z,Y).
descendant(X,Y):- ancestor(X,Z), child(Z,Y).

older(X,Y):- born(Y,F), born(X,G), G@<F.
younger(X,Y):- born(Y,F), born(X,G), G@>F.

cousin(X, Cuzz):- parent(Y, Cuzz), aunt(X,Y), child(X,Y).
%Get the parent of Cuzz and find an Aunt with a child Y.