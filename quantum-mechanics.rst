*****************
Quantum mechanics
*****************

.. _Bernoulli distribution: https://en.wikipedia.org/wiki/Bernoulli_distribution
.. _binomial distribution: https://en.wikipedia.org/wiki/Binomial_distribution

This chapter is about the physics background needed for the whole document.
Fortunately, as long as we do not worry about hardware implementations (superconducting circuits, quantum optics, nuclear magnetic resonance, etc), not much physics knowledge is needed.

Specifically, the shortcuts we take include

1. Only :wiki:`quantum two level systems, i.e., qubits <Qubit>`, are considered.
#. Coin tossing is used as analogy/comparison for qubit measurements.
#. All unitary operations are assumed to be efficiently implementable on hardware.
#. :wiki:`Decoherence <Quantum_decoherence>` does not exist, i.e., all quantum gates have perfect fidelities and all quantum states do not degrade.


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


