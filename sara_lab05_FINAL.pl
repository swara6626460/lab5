% ============================================
% Lab Exercise - Task 1
% Simpsons Family Tree Knowledge Base
% ============================================

% ===== FACTS: Gender =====
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ===== FACTS: Parent relationships =====
% parent(Parent, Child)

% Abraham & Mona's children
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

% Clancy & Jackie's children
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

% Homer & Marge's children
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

% Selma's child (adopted)
parent(selma, ling).

% ============================================
% RULES
% ============================================

% father(F, C) : F is the father of C
father(F, C) :- parent(F, C), male(F).

% mother(M, C) : M is the mother of C
mother(M, C) :- parent(M, C), female(M).

% son(S, P) : S is the son of P
son(S, P) :- parent(P, S), male(S).

% daughter(D, P) : D is the daughter of P
daughter(D, P) :- parent(P, D), female(D).

% helper rule: two people are siblings if they share a parent
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

% brother(B, C) : B is the brother of C
brother(B, C) :- sibling(B, C), male(B).

% sister(S, C) : S is the sister of C
sister(S, C) :- sibling(S, C), female(S).

% grandfather(GF, C) : GF is the grandfather of C
grandfather(GF, C) :- parent(GF, P), parent(P, C), male(GF).

% aunt(A, C) : A is the aunt of C
aunt(A, C) :- parent(P, C), sibling(A, P), female(A).

% uncle(U, C) : U is the uncle of C
uncle(U, C) :- parent(P, C), sibling(U, P), male(U).

% cousin(X, Y) : X and Y are cousins (their parents are siblings)
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

% ancestor(A, C) : A is an ancestor of C (direct or through generations)
ancestor(A, C) :- parent(A, C).
ancestor(A, C) :- parent(A, P), ancestor(P, C).

% ============================================
% TEST QUERIES AND ANSWERS
% (at least two queries per rule)
% ============================================

% --- father ---
% ?- father(homer, bart).
% true.
% ?- father(abraham, homer).
% true.

% --- mother ---
% ?- mother(marge, lisa).
% true.
% ?- mother(mona, herb).
% true.

% --- son ---
% ?- son(bart, homer).
% true.
% ?- son(homer, abraham).
% true.

% --- daughter ---
% ?- daughter(lisa, marge).
% true.
% ?- daughter(maggie, marge).
% true.

% --- brother ---
% ?- brother(herb, homer).
% true.
% ?- brother(bart, lisa).
% true.

% --- sister ---
% ?- sister(patty, selma).
% true.
% ?- sister(lisa, maggie).
% true.

% --- grandfather ---
% ?- grandfather(abraham, bart).
% true.
% ?- grandfather(clancy, bart).
% true.

% --- aunt ---
% ?- aunt(patty, bart).
% true.
% ?- aunt(selma, bart).
% true.

% --- uncle ---
% ?- uncle(herb, bart).
% true.
% ?- uncle(herb, lisa).
% true.

% --- cousin ---
% ?- cousin(bart, ling).
% true.
% ?- cousin(lisa, ling).
% true.

% --- ancestor ---
% ?- ancestor(abraham, bart).
% true.
% ?- ancestor(clancy, bart).
% true.
