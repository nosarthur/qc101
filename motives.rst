*******
Motives
*******

simulate quantum systems with quantum systems
=============================================

In the early 80s, people started to think about simulating quantum systems
using quantum systems, for example

* `Yuri Manin <https://en.wikipedia.org/wiki/Yuri_Manin>`_, Computable and uncomputable (in Russian), Sovetskoye Radio (1980)
* `Richard Feynman <https://en.wikipedia.org/wiki/Richard_Feynman>`_, Simulating Physics with Computers, IJTP 21, 467 (1982)

This is a very natural idea because simulating a quantum system on a classical computer is very expensive.
To understand this point, let us look at an analogy of quantum two-level systems (`qubit`_\ s) to coins.

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
The simplest description one can give may be the `Kolmogorov equation`_:

:math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`

where :math:`R` is a `transition rate matrix <https://en.wikipedia.org/wiki/Transition_rate_matrix>`_.


The description of quantum systems and their dynamics are very similar to that of stochastic processes.


+------------+--------------------------------------------------+-------------------------------------------------------------+
|            | stochastic process                               |     quantum mechanics                                       |
+============+==================================================+=============================================================+
|state vector|  probabilities  :math:`\mathbf p(t)`             | probability amplitudes :math:`\mathbf c(t)`                 |
+------------+--------------------------------------------------+-------------------------------------------------------------+
|            | `Kolmogorov equation`_                           | `Schrödinger equation`_                                     |
|dynamics    |  :math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`|      :math:`i\hbar\frac{d}{dt}\mathbf{c}(t)=H \mathbf{c}(t)`|
+------------+--------------------------------------------------+-------------------------------------------------------------+



In general, both :math:`R` and :math:`H` can be time-dependent.


.. _Kolmogorov equation: https://en.wikipedia.org/wiki/Master_equation
.. _qubit: https://en.wikipedia.org/wiki/Qubit
.. _Schrödinger equation: https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation
.. _universal quantum computer: https://en.wikipedia.org/wiki/Quantum_Turing_machine

There are two aspects to this difficulty

* the amount of **space** to store the quantum state, either in memory or in disk
* the effort to calculate the time evolution, i.e., the **time** complexity



universal quantum computer
==========================

It doesn't take long for the idea of `universal quantum computer`_ to appear, for example

* `David Deutsch <https://en.wikipedia.org/wiki/David_Deutsch>`_, Quantum theory, the Church-Turing principle and the universal quantum computer, Proc. R. Soc. London A 400, 97 (1985)



+----+-------------------------+------------------------------+
|    |   classical computer    | quantum computer             |
+====+=========================+==============================+
|bit | bit                     | qubit                        |
|    |                         |                              |
|    | - two states 0 and 1    | - two basis states           |
|    | - computation unit      | - computation unit           |
|    | - storage unit          | - storage unit ??            |
+----+-------------------------+------------------------------+
|gate| - 1-bit: XOR            | - 1-qubit:                   |
|    | - 2-bit: AND, OR, NAND  | - 2-qubit: CNOT, CPHASE      |
|    | - 3-bit: Toffoli        | - 3-qubit: Toffoli           |
+----+-------------------------+------------------------------+

implement logic gates as unitary operations
-------------------------------------------

reversible computing that dissipates less heat.

`quantum supremacy <https://en.wikipedia.org/wiki/Quantum_supremacy>`_
======================================================================



Although there are still controversies on whether this supremacy happens at 50
qubits, it definitely gives strong incentives for the tech companies to make
50-qubit devices.
