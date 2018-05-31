*********************************
Quantum gates and quantum circuit
*********************************

logic gate -> quantum gate


   The purpose of computing is insight, not numbers. --- :wiki:`Richard Hamming <Richard_Hamming>`


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

emulate logic gates
===================
