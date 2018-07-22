********
Overview
********

.. note::
   The goal of this chapter is to introduce the idea of quantum computing and
   quantum computer without equations. 

.. _Richard Feynman: https://en.wikipedia.org/wiki/Richard_Feynman
.. _universal quantum computer: https://en.wikipedia.org/wiki/Quantum_Turing_machine

   The future is already here -- it's just not very evenly distributed.   --- :wiki:`William Gibson<William_Gibson>`

motivations of quantum computing
--------------------------------

simulate quantum systems with quantum systems
=============================================

In the early 80s, people started to think about simulating quantum systems
using quantum systems, for example

* `Yuri Manin <https://en.wikipedia.org/wiki/Yuri_Manin>`_, Computable and uncomputable (in Russian), Sovetskoye Radio (1980)
* `Richard Feynman`_, Simulating Physics with Computers, IJTP 21, 467 (1982)

This is a very natural idea because simulating a quantum system on a classical computer is expensive.
There are two aspects to this expense:

* the amount of **space** to store the quantum state, either in memory or in disk
* the effort to calculate the time evolution, i.e., the **time** complexity

In the most straightforward implementation, the number of bits needed to describe a quantum system on a classical computer grows exponentially with the number of atoms.
For example, if 10 states are needed to describe an atom, then a 100-atom system would require a vector of size :math:`10^{100}` components.
Note that the :wiki:`number of atoms in the whole universe<Observable_universe#Matter_content>` is estimated to be about :math:`10^{80}`.

Time evolution of quantum systems is computed using :wiki:`matrix manipulations<Matrix_(mathematics)>`.
On classical computers, straightforward implementation of :wiki:`matrix multiplication` has computational complexity :math:`O(n^3)`,
where :math:`n` is the matrix size.
It is possible to make it slightly more efficient but not much: definitely not :math:`O(n^2)`.
Going back to our 100-atom system example,
calculating its dynamics would then have time complexity :math:`O(10^{300})` in the worst case.

Thus in practice, such straightforward implementation on classical computers,
the so-called :wiki:`full configuration interaction` approach, can only be used to study very small molecules.
Many approximated methods have been developed to deal with medium sized molecules with less computational burden.
For large molecules such as proteins which can easily have more than 100,000 atoms, it is still extremely challenging if not impossible to simulate them.

On the other hand, if we have a simulator which is itself quantum mechanical,
Nature will take care of the time evolution calculation:
no more matrix multiplications.
All we need to do is to set up the `Hamiltonian <https://en.wikipedia.org/wiki/Hamiltonian_(quantum_mechanics)>`_
of the system (i.e., describe how atoms interact),
and then wait for the desired end time of the simulation.
For example, if we use the quantum system of interest to 'simulate' itself and we are interested in the result at 1 second, then we just wait for 1 second and look at the system.

Nowadays there is a vague notion of :wiki:`quantum supremacy`
at 50 qubits.
It basically says that a quantum computer with 50 qubits has more computational power than any classical computer.
If we just count the size of the state space, 50 qubit amounts to a state vector with size :math:`2^{50}\simeq 10^6 G`.
Matrix multiplications on such vectors is indeed daunting.
There are still controversies on whether this supremacy happens at 50 qubits.
But it definitely gives strong incentives for the tech companies to make 50-qubit devices.

general-purpose quantum computer
================================

It doesn't take long for the idea of `universal quantum computer`_ to appear, for example

* `David Deutsch <https://en.wikipedia.org/wiki/David_Deutsch>`_, Quantum theory, the Church-Turing principle and the universal quantum computer, Proc. R. Soc. London A 400, 97 (1985)

The goal here is to build a universal machine that can do all possible calculations, instead of building a specialized machine for each computational task.
In terms of quantum simulators, it means that one would have a device that can simulate all possible quantum systems at least with some approximations.
This line of thought is a direct analogy of the classical :wiki:`Church-Turing thesis`.

comparison to classical computing
---------------------------------

A classical computer has the following components:

* processor
* memory
* input device: switches, keyboard, mouse, etc
* output device: light bulbs, speaker, screen, etc



This layout is known as the :wiki:`Von Neumann architecture`.

Currently, the so-called quantum computers on the market are more of the nature
of quantum processors, where the computation process is a quantum time evolution
of the quantum bits.
As far as I know, 'quantum memory' does not exist. Thus calculations need to be
read out immediately.

For classical computing, increasing level of abstraction

* underlying physical processes
* logic gate
* :wiki:`machine code <Machine_code>`
* :wiki:`assembly language<Assembly_language>`
* higher-level languages

Fortunately, as long as we do not worry about hardware implementations
(superconducting circuits, quantum optics, nuclear magnetic resonance, etc),
not much physics background is needed to get some sense of quantum computing.
The same thing is true for classical computing.
In fact, most computer scientists and programmers are not familiar with transistors, the basic building block of classical bit.



.. _quantum-classical:
.. table:: Comparison of classical and quantum computer

    +-----------+-----------------------------------+------------------------------+
    |           |   classical computer              | quantum computer             |
    +===========+===================================+==============================+
    |   bit     | bit                               | qubit                        |
    |           |                                   |                              |
    |           | - two voltage states 0 and 1      | - two quantum basis states   |
    |           | - computation unit                | - computation unit           |
    |           | - storage unit                    | - storage unit ??            |
    +-----------+-----------------------------------+------------------------------+
    |   gate    | - 1-bit: NOT                      | - 1-qubit: X, Y, Z, etc      |
    |           | - 2-bit: AND, OR, XOR, NAND, etc  | - 2-qubit: CNOT, CPHASE, etc |
    |           | - 3-bit: Toffoli                  | - 3-qubit: Toffoli           |
    +-----------+-----------------------------------+------------------------------+
    |math       |:wiki:`Boolean algebra`            | :wiki:`Lie algebra`,         |
    |foundations|                                   | :wiki:`Lie group`            |
    +-----------+-----------------------------------+------------------------------+

Nowadays, the quantum computing industry all adopted the :wiki:`cloud based quantum computing`.
Thus a quantum programmer designs some kind of machine code or assembly-like language, uploads to the cloud.
Due to the peculiar nature of quantum mechanics, initializing the quantum bits
and reading out their states are hard.
And I have dedicated chapters for them later.

For quantum computing, one still needs to work on lower levels.
The optimal protocols, or even the best hardware implementations are not settled yet.

   Computer science... differs from physics in that it is not actually a science. It does not study natural objects. Neither is it, as you might think, mathematics; although it does use mathematical reasoning pretty extensively. Rather, computer science is like engineering; it is all about getting something to do something, rather than just dealing with abstractions, as in the pre-Smith geology. --- `Richard Feynman`_


