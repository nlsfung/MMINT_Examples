TEST SUITE FOR CLASS DIAGRAM SLICER
Nick Fung

--- SUMMARY ---

This is a documentation of the test cases for the class diagram slicer 
(CDSlice.java), which were designed with the intention to cover all possible 
ways of satisfying and falsifying each condition in the slicing algorithm. 
Each test case is assigned an unique number and is a group according to its 
purpose, whether it mainly tests:

G1 A specific dependency rule in the slicing algorithm,
G2 The recursiveness of the algorithm,
G3 Other implementation details (e.g. handling of null pointers), or
G4 The overall slicing algorithm.

At the moment, the test cases mainly focus on one specific condition each, 
thus combinations (e.g. pairs and triples) of conditions are not well-
represented by the test suite. For details about the correspondence between 
each condition and each test case, please refer to TestSuiteMatrix.xls. This 
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

T101 Model: Single empty class (Class A)
     Crit:  Class A
     Slice: Class A

T102 Model: Single class (Class A) with sub-classes only
     Crit:  Class A
     Slice: Class A and its sub-classes

T103 Model: Single class (Class A) with nested-classes only
     Crit:  Class A
     Slice: Class A and its nested classes

T104 Model: Single class (Class A) with attributes only
     Crit:  Class A
     Slice: Class A and its attributes

T105 Model: Single class (Class A) with operations only
     Crit:  Class A
     Slice: Class A and its operations

T106 Model: Single class (Class A) with associations only
            All associations have Class A as their source
     Crit:  Class A
     Slice: Class A, its associations and associated classes

T107 Model: Single class (Class A) with associations only
            All associations have Class A as their target
     Crit:  Class A
     Slice: Class A, its associations and associated classes

T108 Model: Single class (Class A) with dependencies only
            All dependencies have Class A as their depender
     Crit:  Class A
     Slice: Class A, its dependencies and associated classes

T109 Model: Single class (Class A) with dependencies only
            All dependencies have Class A as their dependee
     Crit:  Class A
     Slice: Class A, its dependencies and associated classes

T110 Model: Two independent empty classes (Class A & B)
     Crit:  Class A
     Slice: Class A

T111 Model: Two independent classes (Class A & B)
           Class B contains attributes whose type is not A
     Crit:  Class A
     Slice: Class A

T112 Model: Two independent classes (Class A & B)
            Class B contains attributes whose type is A
     Crit:  Class A
     Slice: Class A and attributes of B

T113 Model: Two independent classes (Class A & B)
            Class B contains operations whose type is not A
     Crit:  Class A
     Slice: Class A

T114 Model: Two independent classes (Class A & B)
            Class B contains operations whose type is A
     Crit:  Class A
     Slice: Class A and operations of B

T115 Model: Single class (Class A) with single attribute (attrA)
     Crit:  Attribute attrA
     Slice: Attribute attrA

T116 Model: Single class (Class A) with single operation (opA)
     Crit:  Operation opA
     Slice: Operation opA

T117 Model: Single class (Class A) with single association (assocA) 
     Crit:  Association assocA
     Slice: Association assocA

T118 Model: Single class (Class A) with single dependency (dependA)
     Crit:  Dependency dependA
     Slice: Dependency dependA


--- G02 Tests for Recursion ---
(Note: Ill-formed class diagrams may be used in these tests.)

T201 Model: Cycle of empty sub-classes
            Class A extends Class C, Class B extends A and C extends B
     Crit:  Class A
     Slice: Classes A, B and C

T202 Model: Cycle of empty nested classes
            Class A nested in Class C, Class B nested in A and C nested in B
     Crit:  Class A
     Slice: Classes A, B and C

T203 Model: Single class (Class A) with single attribute (attrA)
     Crit:  Attribute attrA and Class A (in order)
     Slice: Attribute attrA and Class A

T204 Model: Single class (Class A) with single operation (opA)
     Crit:  Operation opA and Class A (in order)
     Slice: Operation opA and Class A

T205 Model: Cycle of empty associated classes
            Class A associated with Class B, B with C and C with A
     Crit:  Class A
     Slice: Classes A, B and C

T206 Model: Cycle of empty dependent classes
            Class A depends on Class B, B on C and C on A
     Crit:  Class A
     Slice: Classes A, B and C

T207 Model: Two independent classes (Class A & B)
            Class B contains an attribute (attrB) whose type is A
     Crit:  Attribute attrB and Class A (in order)
     Slice: Class A and Attribute attrB

T208 Model: Two independent classes (Class A & B)
            Class B contains an operation (opB) whose type is A
     Crit:  Operation opB and Class A (in order)
     Slice: Class A and Operation opB


--- G03 Tests for Other Implementation Details ---

T301 Model: Two independent classes with the same name (Class A)
     Crit:  Class A (One of the two)
     Slice: Class A (The same one as in the slicing criteria)

T302 Model: Two independent classes (A & B) with same attribute (attrA)
     Crit:  Class A
     Slice: Class A and its attribute attrA

T303 Model: Two independent classes (A & B) with same operation (opA)
     Crit:  Class A
     Slice: Class A and its operation opA

T304 Model: Two independent classes (A & B) with same association (assocA)
     Crit:  Class A
     Slice: Class A and its association assocA

T305 Model: Two independent classes (A & B) with same dependency (dependA)
     Crit:  Class A
     Slice: Class A and its dependency dependA


--- G04 Tests for Overall Slicing Algorithm ---

T401 Model: A class with everything (attributes, operations, etc.)
     Crit:  Empty
     Slice: Empty

T402 Model: A class with everything (attributes, operations, etc.)
     Crit:  Everything
     Slice: Everything

