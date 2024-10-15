Family Relationships Prolog Code - README
Overview
This Prolog program defines a set of predicates to represent family relationships across multiple generations, including extended relationships by marriage and blood. The goal of this code is to facilitate querying familial ties, including traditional parent-child relationships, in-laws, uncles, aunts, cousins, and more complex relations like second cousins and relationships formed through marriage.

Features
The program includes:

Basic Family Relationships: Defines simple family relations like parent, sibling, child, and spouse.
Grandparent and Great-Grandparent Relations: Grandparents, great-grandparents, grandchildren, and great-grandchildren.
In-Law Relations: Relations such as brother-in-law, sister-in-law, father-in-law, and mother-in-law from both the husband’s and wife’s side.
Extended Family by Marriage: Cousins, nephews, nieces, and their in-laws, along with uncle/aunt relations through marriage.
Custom Relations: Includes culturally significant relations like jeth (husband's elder brother), bhabhi (brother's wife), and others, including multiple levels of uncle/aunt relationships.
Find Queries: Provides utility predicates to query a person's multiple parents, grandparents, and cousins.
Usage
Defining Family Members
Each family member is defined with the male/1 or female/1 predicates:

prolog:
male(vishwanath).
female(saraswati).
Defining Relationships
Family relationships are established using the parent/2 predicate, which links parents to their children:


parent(vishwanath, buddhiram).
parent(saraswati, buddhiram).
Querying Relations
You can query the relationships using predefined rules:

Basic Relationships:

Query a person's father:
prolog

father(X, buddhiram).
This will return X = vishwanath.
In-Law Relationships:

Query the jeth relation (husband’s elder brother):
jeth(X, vishwanath).
Extended Relations:

Query the second cousin relationship:

cousin(X, Y).
Query uncle or aunt through marriage:

paternal_uncles_wife(Aunt, NieceNephew).
Custom Relationships
Chachi-Bhatija/Bhatiji (Uncle’s Wife & Nephew/Niece):


chachi_bhatija(Nephew, Aunt).
chachi_bhatiji(Niece, Aunt).
Bhabhi (Sister-in-Law):


bhabhi(X, Y).
Samadhi (Relation between Parents of a Married Couple):

samadhi(X, Y).
Custom Queries
Finding All Parents:


find_parents(Person, Parents).
Finding All Grandparents:


find_grandparents(Person, Grandparents).
Finding All Cousins:

find_cousins(Person, Cousins).
Conclusion
This Prolog program provides a powerful way to explore and query complex family structures, including both direct and in-law relations. It is especially useful for culturally specific relations that go beyond traditional parent-child hierarchies. The utility functions make it easy to query multiple family members and complex relationships through simple predicates.
