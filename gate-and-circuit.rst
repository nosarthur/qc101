*********************************
Quantum gates and quantum circuit
*********************************

   The purpose of computing is insight, not numbers. --- :wiki:`Richard Hamming <Richard_Hamming>`

quantum circuit
===============

So far we have seen several important one-qubit and two-qubit gates, such
as X gate (the equivalent of NOT gate), :wiki:`Hadamard gate <Hadamard_transform>`,
and :wiki:`CNOT gate <Controlled_NOT_gate>` (the equivalent of XOR gate)

.. math::

    X = \begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix},

    H = \frac{1}{\sqrt 2}\begin{bmatrix}
    1& 1 \\
    1& -1
    \end{bmatrix},

    CNOT =\begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & 0 & 1\\
    0& 0 & 1 & 0
    \end{bmatrix}.

A quantum circuit is built with many qubit and many quantum gates.
To reveal the inner working of quantum circuit, graphic representations are created for quantum gates.
For example, the Hadamard gate and CNOT gate are denoted by

.. image:: https://upload.wikimedia.org/wikipedia/commons/1/1a/Hadamard_gate.svg

.. image:: https://upload.wikimedia.org/wikipedia/commons/4/4e/CNOT_gate.svg

Here the horizontal lines denote qubits, just like the classical case.
For the CNOT gate, or any controlled-U gate, the black dot denotes the controlling
qubit.

With a finite set of quantum gates, we can build all unitary operation on any number of qubits,
just like in the classical computing, NOT, AND, OR gates are enough to construct
any :wiki:`Boolean function`

.. math:: f: \{0, 1\}^{\times n} \longrightarrow \{0, 1\}

.. seealso::
   In classical computing, one gate is complete.
   It could be either NAND, or NOR gate.
   It could also be a three-bit gate called Toffli gate, which is Controlled-Controlled-NOT gate.

It's easy to show that quantum computer can do all what classical computer can do,
and we will start from there.

ancilla qubits and classical logic gates
========================================

There is a gap between universal quantum gates which are low-level and general unitary operations which are high-level.
This same conceptual gap exists in classical computing as well.
For example, when we think of floating point multiplication, which is high-level,
we don't bother to think about its low-level implementation such as

* binary representations of floating point numbers;
* bit by bit multiplications in terms of NOT, AND, OR gates;
* further encodings of the binary strings for error correction in case electronic noises screw up bits here and there.

Obviously, such high-level thinking is essential for any practical project.
This poses an question of how to implement classical high-level operations in terms of quantum gates,
or at least in terms of high-level quantum operations (unitary operation).
This is of concern because classical operation (even the basic logic operations) are not reversible in general.

When it comes to two-bit logic gates, the situation is a little different:
there are two input bits and only one output bit. Thus we can take two approaches

1. overwrite one input bit by the output whereas keep the other input bit intact
1. involve three bits in the computation: keep the input bits intact and write the output to the third bit.

As shown in the previous chapter (put in link), the first approach is sufficient
to construct a unitary matrix for the XOR gate.
Suppose we order the input and output as 00, 01, 10, 11 (they can be viewed as binary strings for 0, 1, 2, 3),
and overwrite the second bit, then we have the CNOT gate.

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

.. math:: \begin{bmatrix}
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

quantum no-cloning theorem
==========================

There is an important theorem in quantum computing that reveals fundamental
limitations to quantum state manipulations such as state preparation and state readout.
The so-called :wiki:`no-cloning theorem` says that
**it is impossible to copy an unknown quantum state**.

At high-level, this theorem appears obvious because copying is not a reversible
operation, thus cannot be implemented as a unitary operation.
However, copying is a valid logic operation, thus can be implemented as a unitary
matrix using the controlled-f gate trick. Is there a contradiction?

Using the trick of controlled-f gate, classical state copy can be written as

.. math:: (p, q) \longrightarrow (p, q\oplus p)

To copy bit :math:`p` to bit :math:`q`, we initialize bit :math:`q` in the 0 state.
The corresponding matrix is the CNOT gate.

Applying CNOT gate to the quantum initial state

.. math:: CNOT  (\alpha\left|0\right> + \beta\left|1\right> )\otimes \left|0\right> = \alpha\left|00\right> + \beta\left|11\right>

Note that the result of cloning is

.. math:: (\alpha\left|0\right> + \beta\left|1\right> ) \otimes (\alpha\left|0\right> + \beta\left|1\right> ).

Thus the action of CNOT gate creates entanglement in the qubits, but does not
fulfill quantum cloning.
There is no contradiction here because the controlled-f gate trick provides
unitary matrices whose action on the classical bit space fulfills the classical
logic operations.
It does not guarantee the same operation to work on a general quantum state,
which has no classical analogy.

quantum parallelism
===================

The power of quantum computer can be demonstrated in a simple setup.
Suppose we are interested in a Boolean calculation on :math:`n` bits

.. math:: f: \{0, 1\}^{\times n} \longrightarrow \{0, 1\}^{\times m}

and the corresponding controlled-f version on quantum computer is :math:`U_f`.

We can prepare a special input state

.. math:: \begin{align} H^{\otimes n}\left|0\right>^{\otimes n}
        = & \left(\left|0\right> + \left|1\right>\right)^{\otimes n}\\
        = & \left|0\right>  +\left|1\right> + \left|2\right> + \cdots +\left|2^n -1\right>
        \end{align}

Here I mix two notations and :math:`\left|0\right>` and :math:`\left|1\right>`
refer to either single qubit or :math:`n` qubit states.
The interesting properties of this input state include

* It includes all input states of :math:`n` bits.
* It is not an entangled state.

Then one application of :math:`U_f` gate gives rise to all output states of the
classical Boolean calculation. If one were to compute them classically, :math:`2^n`
application of :math:`f` gate would be needed. Thus there appears to be an
exponential speedup in the quantum case.
This feature is called quantum parallelism.

However, the superimposed output state is not directly useful because the
readout collapses the output state on the computational basis.
Only special computational task can fully utilize this exponential speedup,
and sometimes the exponential speedup becomes quadratic speedup.
We will see examples in the algorithm chapter and state readout chapter.

quantum gate design
===================

Finally I will talk about how one designs quantum gate in reality.

There are many qubit implementations nowadays and their Hamiltonians are all
somewhat different (recall that Hamiltonian is a matrix to describe a quantum
system's dynamics). Thus the gate implementation differs on different hardware
platforms. Even for the same hardware, it is possible to implement the same
quantum gate using different strategies.

Typically part of the Hamiltonian can be controlled. And quantum gate design
is formulated as an optimization problem. Suppose the controllable degrees of
freedoms are denoted as :math:`\mathbf\lambda(t)`, then we have

.. math:: argmin_{\mathbf \lambda(t)} \|U(t) - U_{\text gate} \|

where :math:`U_{\text gate}` is the desired gate.

For a time-dependent Hamiltonian :math:`H(t)`, it is tricky to calculate its
time evolution :math:`U(t)`.
Note that the formula :math:`U(t) = \exp(-iHt)` only works when :math:`H` is
time-independent.
The full treatment of the problem requires quantum control theory.
A simplified view is to discretize the time into small intervals, and assume
constant Hamiltonian within each interval.
The interested reader could start from the following paper of the GRAPE algorithm

* `Navin Khaneja, Timo Reiss, Cindie Kehlet, Thomas Schulte-Herbrügge, Steffen J. Glaser, Optimal control of coupled spin dynamics: design of NMR pulse sequences by gradient ascent algorithms, Journal of Magnetic Resonance 172(2), 296 (2005) <http://www.org.ch.tum.de/glaser/94(GRAPE_JMR_05).pdf>`_
GRAPE paper
