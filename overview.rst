********
Overview
********

.. _Richard Feynman: https://en.wikipedia.org/wiki/Richard_Feynman

In this chapter, we will focus on two questions:

* What is a quantum computer?
* Why is it of interest?

   The future is already here -- it's just not very evenly distributed.   --- :wiki:`William Gibson<William_Gibson>`

motivations of quantum computing
================================

   Computer science... differs from physics in that it is not actually a science. It does not study natural objects. Neither is it, as you might think, mathematics; although it does use mathematical reasoning pretty extensively. Rather, computer science is like engineering; it is all about getting something to do something, rather than just dealing with abstractions, as in the pre-Smith geology. --- `Richard Feynman`_


simulate quantum systems with quantum systems
---------------------------------------------

In the early 80s, people started to think about simulating quantum systems
using quantum systems, for example

* `Yuri Manin <https://en.wikipedia.org/wiki/Yuri_Manin>`_, Computable and uncomputable (in Russian), Sovetskoye Radio (1980)
* `Richard Feynman`_, Simulating Physics with Computers, IJTP 21, 467 (1982)

This is a very natural idea because simulating a quantum system on a classical computer is very expensive.
To understand this point, let us look at an analogy of quantum two-level systems (:wiki:`qubit <Qubit>`\ s) to coins.


.. _universal quantum computer: https://en.wikipedia.org/wiki/Quantum_Turing_machine

There are two aspects to this difficulty

* the amount of **space** to store the quantum state, either in memory or in disk
* the effort to calculate the time evolution, i.e., the **time** complexity



universal quantum computer
--------------------------

It doesn't take long for the idea of `universal quantum computer`_ to appear, for example

* `David Deutsch <https://en.wikipedia.org/wiki/David_Deutsch>`_, Quantum theory, the Church-Turing principle and the universal quantum computer, Proc. R. Soc. London A 400, 97 (1985)



+----+-----------------------------------+------------------------------+
|    |   classical computer              | quantum computer             |
+====+===================================+==============================+
|bit | bit                               | qubit                        |
|    |                                   |                              |
|    | - two voltage states 0 and 1      | - two quantum basis states   |
|    | - computation unit                | - computation unit           |
|    | - storage unit                    | - storage unit ??            |
+----+-----------------------------------+------------------------------+
|gate| - 1-bit: NOT                      | - 1-qubit:                   |
|    | - 2-bit: AND, OR, XOR, NAND, etc  | - 2-qubit: CNOT, CPHASE, etc |
|    | - 3-bit: Toffoli                  | - 3-qubit: Toffoli           |
+----+-----------------------------------+------------------------------+

implement logic gates as unitary operations
-------------------------------------------

reversible computing that dissipates less heat.

Quantum supremacy
-----------------


:wiki:`quantum supremacy <Quantum_supremacy>`

Although there are still controversies on whether this supremacy happens at 50
qubits, it definitely gives strong incentives for the tech companies to make
50-qubit devices.


classical computer
==================

A classical computer has the following components:

* processor
* memory
* input device
* output device

This layout is known as the :wiki:`Von Neumann architecture <Von_Neumann_architecture>`

software part

* underlying physical processes
* logic gate
* :wiki:`machine code <Machine_code>`
* :wiki:`assembly language<Assembly_language>`
* higher-level languages

For quantum computers,


