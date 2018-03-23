*****************
Quantum mechanics
*****************

This chapter is about the physics background needed for the whole document.
Fortunately, as long as we do not worry about hardware implementations (superconducting circuits, quantum optics, nuclear magnetic resonance, etc), not much physics knowledge is needed.

Specifically, the shortcuts we take include

1. Only :wiki:`quantum two level systems, i.e., qubits <Qubit>`, are considered.
#. Coin tossing is used as analogy/comparison for qubit measurements.
#. All unitary operations are assumed to be efficiently implementable on hardware.
#. :wiki:`Decoherence <Quantum_decoherence>` does not exist, i.e., all quantum gates have perfect fidelities and all quantum states do not degrade.

We will expand on these simplifications in the :ref:`chapter-next` chapter.

.. _Bernoulli distribution: https://en.wikipedia.org/wiki/Bernoulli_distribution
.. _binomial distribution: https://en.wikipedia.org/wiki/Binomial_distribution

Quantum mechanics in a nutshell
===============================

The predecessor of quantum mechanics is called :wiki:`classical mechanics <Classical_mechanics>`, which was developed between 17th and 19th century.
Here the word ':wiki:`mechanics <Mechanics>`' refers to the time evolution of things.
Beside some formality put in by :wiki:`Lagrange <Joseph-Louis_Lagrange>` and :wiki:`Sir Hamilton <William_Rowan_Hamilton>`,
classical mechanics is essentially :wiki:`Sir Newton <Isaac_Newton>`'s second law:

.. math:: \mathbf F = m \mathbf a

Overall, classical mechanics excels at describing phenomena of our daily experience, but fails at

* very small things such as molecules and atoms
* very cold things even if they are big

One good example is :wiki:`the double-slit experiment <Double-slit_experiment>`, shown in :numref:`double-slit`.
Here we throw electrons to the middle wall with two slits and observe their landing locations on the back screen.
If electrons were to follow classical trajectories, we would observe two landing stripes right behind the slits.
However, we see the same :wiki:`interference pattern <Interference_(wave_propagation)>` as in optics, i.e., electrons are like waves.

On the other hand, electrons also behave like particles.
For example, if we keep lowering the intensity of the :wiki:`electron beam gun <Electron_gun>`,
we can observe the landing of each electron on the back screen.

.. _double-slit:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/c/cd/Double-slit.svg

   Double-split experiment of electrons.

This strange property of electrons, known as :wiki:`wave-particle duality <Wave–particle_duality>`, is common to small things.

There is a :wiki:`correspondence principle <Correspondence_principle>`,
which states that under certain limit, predictions from quantum mechanics should approach result from classical mechanics.

.. seealso::
   There is some weirdness in the electron intereference. In optics, the standard 
   interpretation of the interference pattern is that the light beam going through
   the top slit interferes with the light beam going through the bottom slit.
   The electrons, however, can be thrown onto the middle wall one by one, and
   interference pattern is still observed. There are two equally crazy viewpoint
   on it: either each electron is interfering with itself in a parallel universe,
   or the two potential paths are interfering.

Historically quantum mechanics was motivated by a few experimental observations that cannot be explained with :wiki:`classical mechanics <Classical_mechanics>`.
The foundations of :wiki:`quantum mechanics <Quantum_mechanics>` was laid down between late 19th century and early 20th century by many famous scientists such :wiki:`Heisenberg <Werner_Heisenberg>`, :wiki:`Schrödinger <Erwin_Schrödinger>`, :wiki:`von Neumann <John_von_Neumann>`, :wiki:`Einstein <Albert_Einstein>`, :wiki:`Dirac <Paul_Dirac>`, :wiki:`Bohr <Niels_Bohr>` etc.

**In a very simplified view, measurement of some physical quantity on a big (and/or warm) object gives a continuous range of possible values but that on a small (and/or cold) object gives a few possible values.**
This is what the name 'quantum' refers to.
For example, the so-called :wiki:`rheostat <Potentiometer#Rheostat>` is an electric device of varying resistance by varying the length of some resistive material. Since length is a continuous variable, it appears that one can get any resistance by sliding the contact.

It is difficult theory because many of its features are beyond a person's daily experience.

Although quantum mechanics has a wider domain of applicability, it is not used when classical mechanics suffices.
This is because of its computation complexity increases rapidly as the number of objects under study (i.e., degrees of freedom) increases.

* probabilistic theory
* dynamics

analogy of coin tossing
-----------------------

Each coin toss has two outcomes and their probabilities can be described by a two-component vector :math:`\mathbf p`.
For example, fair coins have

.. math:: \mathbf p = \begin{bmatrix} 0.5 \\ 0.5 \end{bmatrix}

Given such probability vectors, we can easily describe tossing of the same coin many times, or many coins with different biases.
We will focus on the second situation since it is more general.
Take two coins for example, the outcome probability is given by the `tensor product <https://en.wikipedia.org/wiki/Tensor_product>`_ of the individual probability vectors, i.e.,

.. math:: \mathbf p = \mathbf p_1 \otimes \mathbf p_2 \equiv \begin{bmatrix} p_{1H}\mathbf p_2 \\ p_{1T}\mathbf p_2 \end{bmatrix} = \begin{bmatrix} p_{1H}p_{2H} \\ p_{1H}p_{2T} \\ p_{1T}p_{2H} \\ p_{1T}p_{2T} \end{bmatrix}

With :math:`N` different coins, the probabilities can be calculated from :math:`2N` numbers.
This is the product rule of probability since we assume the coin tosses are independent events.

To make the situation more complicated, there are two ways to go:

1. make the coin tosses dependent events: maybe they hit each other as they are tossed (instead of being tossed one by one)
#. make the probability distribution time-dependent: maybe they are being melted

The first complication breaks the product rule and we have to assign one probability to each outcome.
In the two-coin example,

.. math:: \mathbf p = \begin{bmatrix} p_{1H,2H} \\ p_{1H,2T} \\ p_{1T,2H} \\ p_{1T,2T} \end{bmatrix}

With :math:`N` coins, there are :math:`2^N` outcomes.

The second complication adds dynamics to the probabilities distributions.
The simplest description one can give may be the :wiki:`Kolmogorov equation <Master_equation>`:

:math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`

where :math:`R` is a :wiki:`transition rate matrix <Transition_rate_matrix>`.


The description of quantum systems and their dynamics are very similar to that of stochastic processes.

:wiki:`Schrödinger <Erwin_Schrödinger>`

.. table:: Comparison of stochastic process and 

    +------------+--------------------------------------------------+-------------------------------------------------------------+
    |            | stochastic process                               |     quantum mechanics                                       |
    +============+==================================================+=============================================================+
    |state vector|  probabilities  :math:`\mathbf p(t)`             | probability amplitudes :math:`\mathbf c(t)`                 |
    +------------+--------------------------------------------------+-------------------------------------------------------------+
    |            | :wiki:`Kolmogorov equation <Master_equation>`    | :wiki:`Schrödinger equation <Schr%C3%B6dinger_equation>`    |
    |dynamics    |  :math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`|      :math:`i\hbar\frac{d}{dt}\mathbf{c}(t)=H \mathbf{c}(t)`|
    +------------+--------------------------------------------------+-------------------------------------------------------------+



In general, both :math:`R` and :math:`H` can be time-dependent.

Quantum bits (qubits)
=====================

A qubit is a quantum two-level system. It is an abstract concept with all hardware implementation details hidden, just like its classical counterpart :wiki:`bit <Bit>`.

which means measurement gives two potential results.
In that sense, it is similar to coin tossing.
In this document, we will be only talking about qubit in pure state, with the parametrization

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

where :math:`\alpha`, :math:`\beta\in \mathbb{C}` and :math:`|\alpha|^2 + |\beta|^2 = 1`.

:wiki:`Bloch sphere <Bloch_sphere>`


.. figure:: https://upload.wikimedia.org/wikipedia/commons/6/6b/Bloch_sphere.svg

   Bloch sphere

on the sphere
\alpha \beta sum 1 is equivalent to r = 1


Superposition principle
=======================


Schrodinger's cat


entanglement
------------



Measurements
============

There is essentially only one type of measurement in quantum mechanics: the so-called :wiki:`von Neumann measurement <>`,
which is the equivalent of drawing one sample from a probability distribution.

.. math:: \left<\psi\right| A \left|\psi\right>

quantum no-clone theorem
------------------------

It is impossible to copy an unknown quantum state.

quantum teleportation
---------------------

Quantum gates
=============

one-qubit gates
---------------

:wiki:`Hadamard gate <Hadamard_transform>`

.. math::

    H = \frac{1}{\sqrt 2}\begin{bmatrix}
    1& 1 \\
    1& -1
    \end{bmatrix}.


two-qubit gates
---------------

In our two-qubit example, the controlled-unitary gate has an explicit matrix form

.. math::
    C(U) = \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & u_{00} & u_{01}\\
    0& 0 & u_{10} & u_{11}
    \end{bmatrix}

where :math:`u_{ij}` are the matrix components of the single-qubit unitary gate.
Note also that the concept of controlled gate is not new.
For example, the well known `XOR gate`_ in classical logic is a controlled-NOT gate (with only one output bit though, the one being controlled).
In fact, if we keep the control bit as well in the output, we get exactly the same two-qubit :wiki:`Controlled-NOT or CNOT gate <Controlled_NOT_gate>` with matrix form

For classical bits, the input to this CNOT gate can only be one of the four unit vectors, corresponding to state 00, 01, 10, and 11.

.. math::

    \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & 0 & 1\\
    0& 0 & 1 & 0
    \end{bmatrix}



Ancilla qubits and classical logic gates
========================================

There is a gap between universal quantum gates which are low-level  and general unitary operations which are high-level.
This same conceptual gap exists in classical computing as well.
For example, when we think of floating point multiplication (which is high-level), we don't bother to think about its low-level implementation such as

* binary representations of floating point numbers;
* bit by bit multiplications in terms of NOT, AND, OR gates;
* further encodings of the binary strings for error correction in case electronic noises screw up bits here and there.

Obviously, such high-level thinking is essential for any practical project.
This poses an question of how to implement classical high-level operations in terms of quantum gates, or at least in terms of high-level quantum operations (unitary operation). This is of concern because classical operation (even the basic logic operations) are not reversible in general.

In this section, 

NOT gate
--------

.. _reversible computing: https://en.wikipedia.org/wiki/Reversible_computing

The NOT gate is the only non-trivial 1-bit logic gate.
You can easily check that :wiki:`Pauli matrix <Pauli_matrices>` :math:`\sigma_x` does the trick.
It takes the explicit matrix form as follows and its rows are natural basis.

.. math::

    \sigma_x = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}

XOR gate
--------

When it comes to two-bit logic gates, the situation is a little different: there are two input bits and only one output bit.
Thus we can take two approaches

1. overwrite one input bit by the output whereas keep the other input bit intact
1. involve three bits in the computation: keep the input bits intact and write the output to the third bit.

For the XOR gate, the first approach is already sufficient to construct a unitary matrix.
Suppose we order the input and output as 00, 01, 10, 11 (they can be viewed as binary strings for 0, 1, 2, 3), and overwrite the second bit, then we have


In fact, it is an important 2-qubit quantum gate called :wiki:`Controlled-NOT or CNOT gate <Controlled_NOT_gate>`.

AND gate
--------

You can easily check that the first approach doesn't work for the AND gate: the corresponding matrix is rank-deficient because AND gate is not [logically reversible][reverse].
Thus we have to use the second approach.
Note that although there are 8 input states, only 4 are meaningful.
In other words, the initial state of the output bit is arbitrary.
Thus we can always set it to 0 initially in real computations.
This convention will fix 4 rows of the unitary matrix, corresponding to input states 000, 010, 100, and 110.
Here the first two bits are input and the last one is output.

Note that since 110 is turned to 111, 111 has to be turned to 110.
The remaining 3 rows are undetermined.
Since they are not used in real computation, any choice will do as long as it makes the matrix unitary.
The simplest choice is to have these input states map to themselves, i.e.,

.. math:: 
    \begin{bmatrix}
    1& 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
    0& 1 & 0 & 0& 0 & 0 & 0 & 0 \\
    0& 0 & 1 & 0& 0 & 0 & 0 & 0 \\
    0& 0 & 0 & 1& 0 & 0 & 0 & 0 \\
    0& 0 & 0 & 0& 1 & 0 & 0 & 0 \\
    0& 0 & 0 & 0& 0 & 1 & 0 & 0 \\
    0& 0 & 0 & 0& 0 & 0 & 0 & 1 \\
    0& 0 & 0 & 0& 0 & 0 & 1 & 0 \\
    \end{bmatrix}

In fact, this is an important gate in both classical and quantum computing called :wiki:`Controlled-Controlled NOT (CCNOT) or Toffoli gate <Toffoli_gate>`, proposed by :wiki:`Dr. Tommaso Toffoli <Tommaso_Toffoli>` in 1980.
It is known that Toffoli gate is universal for classical computing: any boolean function can be decomposed into Toffoli gates with ancilla bits.
However, to achieve universal quantum computing, extra single-qubit gates are needed.

I will leave the construction of OR gate as an exercise for you.

arbitrary boolean functions
---------------------------

Actually, there is a recipe to make arbitrary boolean functions reversible and the corresponding matrix is unitary.
Without loss of generality, we can consider functions of the form

.. math::
    f: \{0, 1\}^n \longrightarrow \{0, 1\}

where :math:`n` is the length of the input bit string. Boolean functions with multiple bits as output can be broken down into such 1-bit output functions.

The recipe is essentially our second approach, i.e.,:

.. math::

    (x, y) \longrightarrow (x, f(x)\oplus y)

where :math:`x` is the input string and :math:`\oplus` is the XOR gate.
Here the reversibility/unitariness of the gate is explicitly taken care of by the XOR gate.
In real computations we can always set :math:`y=0` then the last bit is simply the output :math:`f(x)`.
Applying this recipe to the AND gate, you will get Toffoli gate.


This trick is often called Controlled-f gate.

* D. Deutsch, Quantum theory, the Church-Turing principle and the universal quantum computer, Proc. R. Soc. London A 400, 97 (1985)

Phase kickback
==============

Its main idea can be demonstrated with two qubits.
Suppose we are given a one-qubit unitary gate :math:`U` (the term 'gate' is interchangable with 'time evolution' or 'operator') and one of its eigenstates :math:`\left|\psi\right>`, i.e.,

.. math:: U\left|\psi\right> = e^{i\phi}\left|\psi\right>

and our task is to find out what :math:`\phi` is (up to :math:`2\pi` wraps).

Note that there are two ways to think of this unitary gate

* white box: :math:`U` is known but too difficult to diagonalize
* black box: :math:`U` is not known but we are given a button to click which applies it on the qubit

The word 'known' is a bit tricky.  Does it mean knowing at high-level what :math:`U` is,
or knowing every entry of the matrix if it has a matrix representation,
or knowing every entry of the corresponding Hamiltonian?
Fortunately, for our purposes, this detail can be omitted.

Recall that pure phase factor on a quantum state is not measurable (commonly known as :math:`U(1)` symmetry),
only relative phase on different states is.
Thus given only the unitary gate and the eigenstate, there is no hope to get :math:`\phi`.
With some extra resources, it becomes possible, and it is exactly the aim of phase kickback.
The three extra resources in phase kickback are

* an extra qubit, commonly known as ancilla (the latin word for 'maid') qubit
* a way to do :wiki:`Hadamard gate <Hadamard_transform>` on the ancilla qubit
* a way to do controlled-unitary gate on the two qubits

In the more general case where :math:`U` acts on multiple qubits, more ancilla qubits may be needed.
If we have a general-purpose quantum computer, all these resources are available.

Before we proceed, we can also think about whether less resources can be used to extract :math:`\phi`.
For example, what if we only have all possible single-qubit gates at hand, i.e., we can render any unitary evolution on :math:`\left|\psi\right>`?
Depending on how much we know about :math:`\left|\psi\right>`, it could be possible to get :math:`\phi`.
I will leave these details to you to think about.

The concept of controlled-unitary gate may also need some explanation.
In our two-qubit example, it is a two-qubit gate whose action on the controlled qubit depends on the state of the control qubit.
Usually, the ancilla qubit (or qubits) is used as control.
If the control qubit is in state :math:`\left|0\right>`, then nothing happens to the controlled qubit.
If the control qubit is in state :math:`\left|1\right>`, then the single-qubit unitary gate is applied to the controlled qubit.
Also if the control qubit is in a superposition state, the superposition of the action happens.
We are only interested in controlled-unitary gates instead of general controlled gates since the time evolution of quantum systems is unitary.

Now we are ready to describe the phase kickback protocol:
start with :math:`\left|0\right>\left|\psi\right>`,
apply the Hadamard gate on the ancilla qubit and then the controlled-unitary gate on the two qubits.
One can easily verify the resultant state as

.. math::

    C(U) H\otimes I\left|0\right>\left|\psi\right> =\frac{\left|0\right>+e^{i\phi}\left|1\right>}{\sqrt 2}\left|\psi\right>

where :math:`I` is the identity matrix, :math:`\otimes` is the :wiki:`tensor product operation <Tensor_product>`, and the one-qubit :wiki:`Hadamard gate <Hadamard_transform>` is 

Note that the overall effect is to add a phase shift to the control (ancilla) qubit.
This is opposite to the common sense that the control bit remains intact and the controlled bit changes.
And this is why it is called phase kickback.

For example, the controlled-unitary gate could be a controlled-phase (CPhase) gate and the eigenstate could be :math:`\left|\psi\right> = \left|1\right>`.
Then we have

.. math:: C_\phi H\otimes I\left|0\right>\left|1\right> =\frac{\left|0\right>+e^{i\phi}\left|1\right>}{\sqrt 2}\left|1\right>

where the quantum gates are given by

.. math::

    C_\phi = \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & 1 & 0\\
    0& 0 & 0 & e^{i\phi}
    \end{bmatrix}

To further extract the phase :math:`\phi` on the ancilla qubit, there are various options.
The most straightforward one is to generate many copies of this state, and keep measuring the three physical observables

.. math::
    \left<\sigma_x\right> = \cos\phi, \quad
    \left<\sigma_y\right> = \sin\phi, \quad
    \left<\sigma_z\right> = 0

where :math:`\sigma_i`'s are the :wiki:`Pauli matrices <Pauli_matrices>`.
This is basically the :wiki:`Bloch sphere representation <Bloch_sphere>` of quantum two-level systems.
Thus in principle :math:`\phi` can be determined as accurate as one wishes.
However, it is not efficient to estimate :math:`\phi` this way (unless in special situations, say :math:`\phi` is known to be one of a few possible values) due to the cost of generating the copies.
There are other **efficient** ways to measure :math:`\phi`, for example, using [quantum Fourier transform].

It turns out that **many quantum algorithms boil down to somehow encode the answer in the phase of the ancilla qubits,
with the help of controlled-unitary gates**.
Thus it is very helpful to think in this phase kickback framework.

