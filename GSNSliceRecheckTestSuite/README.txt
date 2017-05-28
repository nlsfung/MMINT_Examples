TEST SUITE FOR GSN SLICER FOR RECHECKED ELEMENTS
Nick Fung

--- SUMMARY ---

This is a documentation of the test cases for the GSN slicer for rechecked 
elements (GSNSliceRecheck.java), which were designed with the intention to 
cover all dependency rules as well as possible ways of satisfying and 
falsifying each condition in the slicing algorithm. Each test case is assigned 
an unique number and a group according to its purpose, whether it mainly tests:

G1 A specific dependency rule in the slicing algorithm,
G2 The recursiveness of the algorithm,
G3 Other implementation details (e.g. handling of null pointers), or
G4 The overall slicing algorithm.

At the moment, the test cases mainly focus on one specific condition each, 
thus combinations (e.g. pairs and triples) of conditions are not well-
represented by the test suite. For details about the correspondence between 
each condition and each test case, please refer to TestSuite.xls. This 
document divides the test cases into the four groups and for each test case 
describes what its input model and slicing criteria are as well as its output. 


--- Format of Test Case Description ---

T123 Model: Description of input model
     Crit:  Description the input slicing criteria
     Slice: Description of the resulting slice

Note that the string "T123" represents the unique ID of a test case. The first 
digit ("1") corresponds to the group the test case belongs to, and the 
remaining two digits ("23") identifies the test case within that group.


--- G01 Tests for Specific Dependency Rule ---
(Note: Some models for these tests may not be well-formed.)

T101 Model: Single goal (Goal G) connected to a solution (Solution Sol)
     Crit:  Goal G
     Slice: Goal G

T102 Model: Single goal (Goal G2) supporting conclusion G1 via Strategy S
     Crit:  Goal G2
     Slice: Goals G2 and G1

T103 Model: Chain of goals and strategies
            G1 supported by S1, S1 by G2, G2 by S2, S2 by G3
     Crit:  Goal G3
     Slice: Goals G1, G2 and G3

T104 Model: Single strategy (Strategy S) connecting a goal with its sub-goals 
     Crit:  Strategy S
     Slice: Strategy S

T105 Model: Single solution (Solution Sol) supporting a goal (Goal G)
     Crit:  Solution Sol
     Slice: Goal G

T106 Model: Single Solution Sol1 supporting chain of goals and strategies
            G1 supported by S1, S1 by G2, G2 by Sol1
     Crit:  Solution Sol1
     Slice: Solution Sol1, Goals G1 and G2 and Strategy S1

T107 Model: Single context (Context C) connected to some goals and strategies
     Crit:  Context C
     Slice: Context C


--- G02 Tests for Recursion ---
(Note: Ill-formed GSN assurance cases may be used in these tests.)

T201 Model: Cycle of goals and strategies
            G1 supported by S1, S1 by G2, G2 by S2, etc. 
     Crit:  Goal G1
     Slice: All goals in the cycle

T202 Model: Single solution (Solution Sol) supporting a goal (Goal G)
     Crit:  Goal G and Solution Sol (in order)
     Slice: Goal G and Solution Sol


--- G03 Tests for Other Implementation Details ---
(Note: Some of these tests may involve models that are not well-formed.)

T301 Model: Single Goal G supporting a Strategy S with no conclusion goal
     Crit:  Goal G
     Slice: Goal G

T302 Model: Single solution (Solution Sol) with no supported Goal 
     Crit:  Solution Sol
     Slice: Solution Sol

T303 Model: Two independent goals with the same name (Goal G)
     Crit:  Goal G (One of the two)
     Slice: Goal G (The same one as in the slicing criteria)

T304 Model: Two independent strategies with the same name (Strategy S)
     Crit:  Strategy S (One of the two)
     Slice: Strategy S (The same one)

T305 Model: Two independent solutions with the same name (Solution Sol)
     Crit:  Solution Sol (One of the two)
     Slice: Solution Sol (The same one) and its conclusions

T306 Model: Two independent contexts with the same name (Context C)
     Crit:  Context C (One of the two)
     Slice: Context C (The same one)


--- G04 Tests for Overall Slicing Algorithm ---

T401 Model: Assurance case with everything (goals, strategies, etc.)
     Crit:  Empty
     Slice: Empty

T402 Model: Assurance case with everything (goals, strategies, etc.)
     Crit:  Everything
     Slice: Everything

