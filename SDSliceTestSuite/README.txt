TEST SUITE FOR SEQUENCE DIAGRAM SLICER
Nick Fung

--- SUMMARY ---

This is a documentation of the test cases for the sequence diagram slicer 
(SDSlice.java), which were designed with the intention to cover all possible 
ways of satisfying and falsifying each condition in the slicing algorithm. 
Each test case is assigned an unique number and a group according to its 
purpose, whether it mainly tests:

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
(Note: It is assumed for these tests that the input model is consistent.)

T101 Model: Single class (Class A) with empty lifeline (Lifeline A)
     Crit:  Lifeline A
     Slice: Lifeline A

T102 Model: Single lifeline (Lifeline A) with messages from it only
     Crit:  Lifeline A
     Slice: Lifeline A and the messages originating from it

T103 Model: Single lifeline (Lifeline A) with messages to it only
     Crit:  Lifeline A
     Slice: Lifeline A and the  messages targeting it

T104 Model: Single class with attribute (attrA) and lifeline
     Crit:  Attribute attrA
     Slice: Attribute attrA

T105 Model: Single attribute (attrA) with messages referring to it
            Messages originate from and point to arbitrary lifelines
     Crit:  Attribute attrA
     Slice: Attribute attrA and its messages

T106 Model: Single class with operation (opA) and lifeline
     Crit:  Operation opA
     Slice: Operation opA

T107 Model: Single operation (opA) with messages referring to it
            Messages originate from and point to arbitrary lifelines
     Crit:  Operation opA 
     Slice: Operation opA and its messages

T108 Model: Single class (Class A) with empty lifeline 
     Crit:  Class A
     Slice: Class A

T109 Model: Single message (msgA) connecting two arbitary lifelines.
     Crit:  Message msgA
     Slice: Message msgA


--- G02 Tests for Recursion ---
(Note: Ill-formed class diagrams may be used in these tests.)

T201 Model: Single lifeline (Lifeline A) with single message (msgA) from it
     Crit:  Message msgA and Lifeline A (in order)
     Slice: Message msgA and Lifeline A

T202 Model: Single lifeline (Lifeline A) with message (msgA) to it 
     Crit:  Message msgA and Lifeline A (in order)
     Slice: Message msgA and Lifeline A

T203 Model: Single lifeline (Lifeline A) with message (msgA) from and to it 
     Crit:  Lifeline A
     Slice: Lifeline A and Message msgA

T204 Model: Single attribute (attrA) with message (msgA) referring to it
            Messages originate from and point to arbitrary lifelines
     Crit:  Message msgA and Attribute attrA (in order)
     Slice: Message msgA and Attribute attrA

T205 Model: Single operation (opA) with message (msgA) referring to it
            Messages originate from and point to arbitrary lifelines
     Crit:  Message msgA and Operation opA (in order)
     Slice: Message msgA and Operation opA


--- G03 Tests for Other Implementation Details ---

T301 Model: Two independent lifelines with the same name (Lifeline A)
     Crit:  Lifeline A (One of the two)
     Slice: Lifeline A (The same one as in the slicing criteria)

T302 Model: Two messages referring to two attributes with same name (attrA)
     Crit:  Attribute attrA (One of the two)
     Slice: Attribute attrA (The same one) and the message it refers to.

T303 Model: Two messages referring to two operations with same name (opA)
     Crit:  Operation opA (One of the two)
     Slice: Operation opA (The same one) and the message it refers to.

T304 Model: Two identical classes (Class A)
     Crit:  Class A (One of the two)
     Slice: Class A (The same one as in the slicing criteria)

T305 Model: Two identical messages (Message msgA)
     Crit:  Message msgA (One of the two)
     Slice: Message msgA (The same one as in the slicing criteria)


--- G04 Tests for Overall Slicing Algorithm ---

T401 Model: A class with everything (lifeline, messages, etc.)
     Crit:  Empty
     Slice: Empty

T402 Model: A class with everything (lifeline, messages, etc.)
     Crit:  Everything
     Slice: Everything
