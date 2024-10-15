%Add your family relation here for eg. male(X) all males , female(X) all females , and parent(X,Y) which indicates X is parent of Y.
%Sample example
%male(vishwanath).
%male(vaidyanath).
%male(buddhiram).
%male(jawaharlal).
%female(saraswati).
%female(geeta).
%female(jagvanti).

%parent(vishwanath, buddhiram).
%parent(vishwanath, jawaharlal).
%parent(vishwanath, manilal).

%parent(saraswati, buddhiram).
%parent(saraswati, jawaharlal).
%parent(saraswati, manilal).

%parent(vaidyanath,mahanarayan).
%parent(vaidyanath,satyanarayan).
%parent(geeta,mahanarayan).
%parent(geeta,satyanarayan).

jeth(X,Y):- wife(X,Z),brother(Z,Y).
second_nephew(X,Y):-
    male(X),parent(Z,X),cousin(Z,Y).
second_niece(X,Y):-
    female(X),parent(Z,X),cousin(Z,Y).
suresh_chacha(X,Y):-male(X),cousin(X,Z),parent(Z,Y).
sunita_bua(X,Y):- female(X),cousin(X,Z),parent(Z,Y).

sonam_chachi(X,Y):-wife(X,Z),suresh_chacha(Z,Y).

second_nephew_ofhusband(X,Y):-
     male(X),parent(Z,X),cousin(Z,W),wife(Y,W).

second_niece_ofhusband(X,Y):-
    female(X),parent(Z,X),cousin(Z,W),wife(Y,W).

second_uncle_nani(X,Y):-
    father(X,Z),second_cousin(Z,Y).
second_nephew_ofwife(X,Y):- male(X),parent(Z,X),cousin(Z,W),husband(Y,W).
second_niece_ofwife(X,Y):-   female(X),parent(Z,X),cousin(Z,W),husband(Y,W).




%sister in law (sali)
sister_in_law(X,Y) :-
    sister(X,Z),wife(Z,Y).
%saala
sala(X,Y) :-
    brother(X,Z), wife(Z,Y).


%babhi

bhabhi(X,Y):-
    wife(X,Z), brother(Z,Y).
bhabhi_jethani(X,Y):- wife(X,Z),sister(Y,Z).
bhabhi_jethani(X,Y):- wife(X,Z),cousin(Y,Z),female(Y).
bhabhi_jethani(X,Y):- wife(X,Z),second_cousin(Y,Z),female(Y).


bhabhi2(X,Y):-
    bhabhi(X,Z),husband(Z,Y).

%chachi se relation
chachi_bhatija(Person, Aunt) :-
    male(Person),
    father(Father, Person),                 
    brother(Uncle, Father),                 
    wife(Aunt, Uncle).

chachi_bhatiji(Person, Aunt) :-
    female(Person),
    father(Father, Person),                 
    brother(Uncle, Father),                 
    wife(Aunt, Uncle).      

bhatija_fufa(X,Y):- male(X),nephew(X,Z),wife(Z,Y).

bhatiji_fufa(X,Y):- female(X),niece(X,Z),wife(Z,Y).

bhabhix(X,Y):-
    wife(X,Z), cousin(Z,Y).
bhabhix(X,Y):-
    wife(X,Z),second_cousin(Z,Y).

jeejaa(X,Y):- husband(X,W),sibling(W,Y).
jeejaa(X,Y):- husband(X,W),cousin(W,Y).
jeejaa(X,Y):- husband(X,W),second_cousin(W,Y).


saali(X,Y):-  female(X),sibling(X,W),husband(Y,W).
saali(X,Y):- female(X),cousin(X,W),husband(Y,W).
saali(X,Y):-female(X),second_cousin(X,W),husband(Y,W).
saala(X,Y):- male(X),sibling(X,W),husband(Y,W).
saala(X,Y):- male(X),cousin(X,W),husband(Y,W).
saala(X,Y):- male(X),second_cousin(X,W),husband(Y,W).








%Maami bhanja
mami_bhanja(Y,X):- male(Y),mother(Z,Y),bhabhi(X,Z).
%Maami bhanji
mami_bhanji(Y,X):- female(Y),mother(Z,Y),bhabhi(X,Z).


samadhi(X,Y):- parent(X,Z),husband(Z,W),parent(Y,W).
samadhi2(X,Y):- parent(X,Z),wife(Z,W),parent(Y,W).

%granddaughter/son in law
granddaughter_in_law(Y,X):- grandparent(X,Z),wife(Y,Z).
grandson_in_law(Y,X):- grandparent(X,Z),husband(Y,Z).




% Basic family relationships (existing ones, unchanged)
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
child(X, Y) :- parent(Y, X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).
wife(X, Y) :- female(X), male(Y), parent(X, Z), parent(Y, Z).
husband(X, Y) :- male(X), female(Y), parent(X, Z), parent(Y, Z).
niece(X, Y) :- female(X), sibling(Y, Z), parent(Z, X).
nephew(X, Y) :- male(X), sibling(Y, Z), parent(Z, X).
father_in_law(X, Y) :- male(X), wife(W, Y), parent(X, W).
father_in_law(X, Y) :- male(X), husband(W, Y), parent(X, W).
mother_in_law(X, Y) :- female(X), wife(W, Y), parent(X, W).
mother_in_law(X, Y) :- female(X), husband(W, Y), parent(X, W).
cousin(X, Y) :- parent(A, X), parent(B, Y), sibling(A, B).
maternal_uncle(X, Y) :- male(X), parent(Z, Y), sister(Z, X).
maternal_aunt(X, Y) :- female(X), parent(Z, Y), sister(X, Z).
paternal_uncle(X, Y) :- male(X), parent(Z, Y), brother(X, Z).
paternal_aunt(X, Y) :- female(X), parent(Z, Y), brother(Z, X).
son_in_law(X, Y) :- male(X), wife(W, X), parent(Y, W).
daughter_in_law(X, Y) :- female(X), husband(W, X), parent(Y, W).
great_grandfather(X, Y) :- male(X), parent(X, Z), grandparent(Z, Y).
great_grandmother(X, Y) :- female(X), parent(X, Z), grandparent(Z, Y).
son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).
uncle(X,Y):- male(X),sibling(X,Z),parent(Z,Y).



%grandchild
grandchild(X,Y):- child(X,Z),parent(Y,Z).

% Define great-grandparent
great_grandparent(GP, X) :- 
    grandparent(GP, P),
    parent(P, X).
wife_great_grandparent(GP, X) :- 
mother(GP, P),
  grandparent(P, X).

% Define queries to find multiple parents, grandparents, and cousins

% Find all parents of a person
find_parents(Person, Parents) :- 
    setof(P, parent(P, Person), Parents).

% Find all grandparents of a person
find_grandparents(Person, Grandparents) :- 
    setof(G, grandparent(G, Person), Grandparents).

% Find all cousins of a person
find_cousins(Person, Cousins) :- 
    setof(C, cousin(Person, C), Cousins).
% Define the relation for uncle's wife (aunt through marriage)

% Paternal Uncle's Wife (father's brother's wife)
paternal_uncles_wife(Aunt, NieceNephew) :-
    paternal_uncle(Uncle, NieceNephew),
    wife(Aunt, Uncle).

% Maternal Uncle's Wife (mother's brother's wife)
maternal_uncles_wife(Aunt, NieceNephew) :-
    maternal_uncle(Uncle, NieceNephew),
    wife(Aunt, Uncle).

% Define the relation for aunt's husband (uncle through marriage)

% Paternal Aunt's Husband (father's sister's husband)
paternal_aunts_husband(Uncle, NieceNephew) :-
    paternal_aunt(Aunt, NieceNephew),
    husband(Uncle, Aunt).

% Maternal Aunt's Husband (mother's sister's husband)
maternal_aunts_husband(Uncle, NieceNephew) :-
    maternal_aunt(Aunt, NieceNephew),
    husband(Uncle, Aunt).

% Define grandson and granddaughter
grandson(X, Y) :- male(X), grandparent(Y, X).
granddaughter(X, Y) :- female(X), grandparent(Y, X).

greatgrandson(X,Y):- grandson(X,Z),parent(Y,Z).
greatgranddaughter(X,Y):- granddaughter(X,Z),parent(Y,Z).

% Define granduncle and grandaunt
granduncle(X, Y) :- male(X), sibling(X, Z), grandparent(Z, Y).
grandaunt2(X,Y):-wife(X,Z),granduncle(Z,Y).

grandaunt(X, Y) :- female(X), sibling(X, Z), grandparent(Z, Y).





% Define grandnephew and grandniece
grandnephew(X, Y) :- male(X), grandparent(Z, X), sibling(Z, Y).
grandnephew2(X,Y):- grandnephew(X,Z),husband(Z,Y).
grandniece(X, Y) :- female(X), grandparent(Z, X), sibling(Z, Y).
grandniece2(X,Y):- grandniece(X,Z),husband(Z,Y).


% Define second cousin relations for both maternal and paternal sides
second_cousin(X, Y) :-
    great_grandparent(G, X),
    great_grandparent(G, Y),
    \+ (grandparent(Z, X), grandparent(Z, Y)),  % Ensure they do not share a grandparent
    X \= Y.


% Update the find_relation rule to include new relationships
find_relation(Person1, Person2, Relation) :-
    ( parent(Person1, Person2) -> Relation = 'parent'
    ; parent(Person2, Person1) -> Relation = 'child'
    ; grandparent(Person1, Person2) -> Relation = 'grandparent'
    ; grandparent(Person2, Person1) -> Relation = 'grandchild'
    ; great_grandfather(Person1, Person2) -> Relation = 'great-grandfather'
    ; great_grandfather(Person2, Person1) -> Relation = 'great-grandchild'
    ; cousin(Person1, Person2) -> Relation = 'cousin'
    ; second_cousin(Person1, Person2) -> Relation = 'second cousin'
    ; second_nephew(Person1, Person2) -> Relation = 'nephew'
    
    ; second_niece(Person1, Person2) -> Relation = 'niece'
    ; second_nephew_ofhusband(Person1, Person2) -> Relation = 'nephew'
    ; second_nephew_ofwife(Person1, Person2) -> Relation = 'nephew'
    ; second_niece_ofhusband(Person1, Person2) -> Relation = 'niece'
    ; second_niece_ofwife(Person1, Person2) -> Relation = 'niece'
    ; sibling(Person1, Person2) -> Relation = 'sibling'
    ; brother(Person1, Person2) -> Relation = 'brother'
    ; sister(Person1, Person2) -> Relation = 'sister'
    ; grandson(Person1, Person2) -> Relation = 'grandson'
    ; granddaughter(Person1, Person2) -> Relation = 'granddaughter'
    ; granduncle(Person1, Person2) -> Relation = 'granduncle'
    ; grandaunt(Person1, Person2) -> Relation = 'grandaunt'
    ; grandaunt2(Person1, Person2) -> Relation = 'grandaunt'

    ; grandnephew(Person1, Person2) -> Relation = 'grandnephew'
    ; grandnephew2(Person1, Person2) -> Relation = 'grandnephew'

    ; grandniece(Person1, Person2) -> Relation = 'grandniece'
    ; grandniece2(Person1, Person2) -> Relation = 'grandniece'
    ; niece(Person1, Person2) -> Relation = 'niece'
    ; nephew(Person1, Person2) -> Relation = 'nephew'
    ; maternal_uncle(Person1, Person2) -> Relation = 'maternal uncle'
    ; paternal_uncle(Person1, Person2) -> Relation = 'paternal uncle'
    ; maternal_aunt(Person1, Person2) -> Relation = 'maternal aunt'
    ; paternal_aunt(Person1, Person2) -> Relation = 'paternal aunt'
    ; maternal_uncles_wife(Person1, Person2) -> Relation = 'maternal uncle\'s wife (aunt)'
    ; paternal_uncles_wife(Person1, Person2) -> Relation = 'paternal uncle\'s wife (aunt)'
    ; maternal_aunts_husband(Person1, Person2) -> Relation = 'maternal aunt\'s husband (uncle)'
    ; paternal_aunts_husband(Person1, Person2) -> Relation = 'paternal aunt\'s husband (uncle)'
    ; son_in_law(Person1, Person2) -> Relation = 'son-in-law'
    ; daughter_in_law(Person1, Person2) -> Relation = 'daughter-in-law'
    ; father_in_law(Person1, Person2) -> Relation = 'father-in-law'
    ; mother_in_law(Person1, Person2) -> Relation = 'mother-in-law'
    ; wife(Person1, Person2) -> Relation = 'wife'
    ; husband(Person1, Person2) -> Relation = 'husband'
    ;wife_great_grandparent(Person1, Person2) -> Relation = 'great-grandmother'
    ;wife_great_grandparent(Person2, Person1) -> Relation = 'great-grandchild'
    ; sister_in_law(Person1,Person2) -> Relation = 'wifes sister/sister in law'   
    ; sister_in_law(Person2,Person1) -> Relation = 'sisters husband'
    ; sala(Person1,Person2) ->  Relation  = 'Saala/brother in law'
    ; sala(Person2,Person1) ->  Relation  = 'jeejaa/brother in law'
    ; bhabhi_jethani(Person2,Person1) ->  Relation  = 'Nannad'
    ; bhabhi(Person2,Person1) ->  Relation  = 'Devar/jeth'
    
    ; bhabhi2(Person1,Person2) ->  Relation  = 'bhabhi/jethani'
    ; bhabhi2(Person2,Person1) ->  Relation  = 'bhabhi/jethani'
    ; chachi_bhatija(Person1,Person2) ->  Relation  = 'nephew'
    ;chachi_bhatiji(Person1,Person2) ->  Relation  = 'neice'
    ;mami_bhanja(Person1,Person2) ->  Relation  = 'bhanja'
    ;mami_bhanji(Person1,Person2) ->  Relation  = 'bhanji'
    ;bhatija_fufa(Person1,Person2) ->  Relation  = 'nephew'
    ;bhatiji_fufa(Person1,Person2) ->  Relation  = 'niece'
    ;suresh_chacha(Person1,Person2) ->  Relation  = 'uncle'
    ;second_uncle_nani(Person1,Person2) ->  Relation  = 'uncle'
    
    ;sunita_bua(Person1,Person2) ->  Relation  = 'aunty'
    ;sonam_chachi(Person1,Person2) ->  Relation  = 'aunty'
    ;greatgrandson(Person1,Person2) -> Relation = 'great- grand -son'
    ;greatgranddaughter(Person1,Person2) -> Relation = 'great- grand -daughter'
    ;samadhi(Person1,Person2) -> Relation = 'Samadhi/ in laws'
    ;samadhi2(Person1,Person2) -> Relation = 'Samadhi/ in laws'
    ;jeth(Person1,Person2) -> Relation = 'bhabhi'
    ;  grandson_in_law(Person1,Person2) -> Relation = 'grandson-in -law'
    ;   grandson_in_law(Person2,Person1) -> Relation  = 'grandparent-in -law'
    ;   granddaughter_in_law(Person1,Person2) ->  Relation = 'grandson-in -law'
    ;   granddaughter_in_law(Person2,Person1) ->  Relation = 'grandparent-in -law'
    ; bhabhix(Person1,Person2) ->  Relation  = 'bhabhi'
    ; jeejaa(Person1,Person2) ->  Relation  = 'jeejaa'
    ;   saali(Person1,Person2) ->  Relation  = 'sister -in -law/sali'
    ;   saala(Person1,Person2) ->  Relation  = 'brother -in -law/sala'
   

    
    
   
   
                  
    ; Relation = 'no direct relation'  % Default case if no relation is found
    ).
