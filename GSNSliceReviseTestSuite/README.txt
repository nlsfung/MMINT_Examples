TEST SUITE FOR GSN SLICER FOR REVISED ELEMENTS
Nick Fung

--- SUMMARY ---

This is a documentation of the test cases for the GSN slicer for revised 
elements (GSNSliceRevise.java), which were designed with the intention to 
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
(Note: It is assumed here that all goals must be connected to a solution.)

T103 Model: Single goal (Goal G) connected to a solution (Solution Sol)
     Crit:  Goal G
     Slice: Goal G and Solution Sol

T102 Model: Single goal (Goal G) connected to sub-goals via Strategy S
     Crit:  Goal G
     Slice: Goal G and Strategy S

T103 Model: Single goal (Goal G) connected to a parent goal via Staretgy S
     Crit:  Goal G
     Slice: Goal G and Strategy S (and Solution Sol)

T104 Model: Single strategy (Strategy S) connecting a goal with its sub-goals 
     Crit:  Strategy S
     Slice: Strategy S and all connected goals

T105 Model: Single solution (Solution S) supporting a goal (Goal G) 
     Crit:  Solution S
     Slice: Solution S and Goal G

T106 Model: Single goal (Goal G) with a context (Context C)
     Crit:  Context C
     Slice: Context C and Goal G (and Solution Sol)

T107 Model: Single goal (Goal G) with ancestors and a context (Context C)
     Crit:  Context C 
     Slice: Context C and Goal G (and Solution Sol)

T108 Model: Single goal (Goal G) with Strategy S, sub-goals and Context C
     Crit:  Context C
     Slice: Context C, Goal G and all its descendants

T109 Model: Strategy S with parent and sub-goals and Context C
     Crit:  Context C
     Slice: Context C, Strategy S and its descendants

T110 Model: Context C associated with multiple goals and strategies
     Crit:  Context C
     Slice: Context C, all associated nodes and their descendants

--- G02 Tests for Recursion ---
(Note: Ill-formed GSN assurance cases may be used in these tests.)

T201 Model: Cycle of goals and strategies.
            G1 supported by S1, S1 by G2, G2 by S2, etc.
     Crit:  Goal G1
     Slice: Goal G1 and Strategies S1 and S3

T202 Model: Cycle of goals and strategies
            G1 supported by S1, S1 by G2, G2 by S2, etc.
     Crit:  Strategy S1
     Slice: Strategy S1 and Goals G1 and G2

T203 Model: Cycle of goals and strategies with Context C on G1
            G1 supported by S1, S1 by G2, G2 by S2, S2 by G1 
     Crit:  Context C 
     Slice: Everything

T204 Model: Cycle of goals and strategies with Context C on S1
            G1 supported by S1, S1 by G2, G2 by S2, S2 by G1 
     Crit:  Context C 
     Slice: Everything


--- G03 Tests for Other Implementation Details ---
(Note: Some of these tests may involve models that are not well-formed.)

T301 Model: Single goal only (Goal G)
     Crit:  Goal G
     Slice: Goal G

T302 Model: Single strategy only (Strategy S)
     Crit:  Strategy S
     Slice: Strategy S

T303 Model: Single solution only (Solution Sol)
     Crit:  Solution Sol
     Slice: Solution Sol

T304 Model: Single context only (Context C)
     Crit:  Context C
     Slice: Context C

T305 Model: Single context (Context C) with strategy (Strategy S) only
     Crit:  Context C
     Slice: Context C and Strategy S

T306 Model: Two independent goals with the same name (Goal G)
     Crit:  Goal G (One of the two)
     Slice: Goal G (The same one as in the slicing criteria)

T307 Model: Two independent strategies with the same name (Strategy S)
     Crit:  Strategy S (One of the two)
     Slice: Strategy S (The same one)

T308 Model: Two independent solutions with the same name (Solution Sol)
     Crit:  Solution Sol (One of the two)
     Slice: Solution Sol (The same one)

T309 Model: Two independent contexts with the same name (Context C)
     Crit:  Context C (One of the two)
     Slice: Context C (The same one)


--- G04 Tests for Overall Slicing Algorithm ---

T401 Model: Assurance case with everything (goals, strategies, etc.)
     Crit:  Empty
     Slice: Empty

T402 Model: Assurance case with everything (goals, strategies, etc.)
     Crit:  Everything
     Slice: Everything

