******************
Quantum algorithms
******************

* amplitude amplification
* period finding


Deutsch-Jozsa algorithm
=======================

The complete version of Deutch algorithm solves the following problem: given a binary function :math:`f` defined on binary strings of :math:`n` digits,

.. math:: f:\{0, 1\}^n \rightarrow \{0, 1\},

with the guarantee that :math:`f` is either constant or balanced (meaning that half of the answer is 0),
determine whether it is constant or balanced.

On a classical computer, we will have to evaluate :math:`2^{n-1}+1` inputs to know the answer.
In contrast, Deutch algorithm needs only one measurement on :math:`n` qubits: an exponential speedup!
For simplicity, I will only consider the :math:`n=1` case.
Generalizing to the :math:`n`-qubit case is somewhat straightforward.
Again, in this simplified situation, classically we need to evaluate two inputs.
With a quantum computer, we only need one readout on one qubit.

The first thing we need to worry about is how to implement :math:`f`.
Obviously it cannot be applied on quantum states directly since its domain is binary strings.
Without much surprise, it is implemented as a controlled unitary gate,
with the action

.. math:: \left|x\right>\left|y\right> \longrightarrow \left|x\right> \left|f(x)\oplus y\right>

where :math:`\oplus` is the :wiki:`XOR gate <XOR_gate>`.
This action is obviously reversible, thus there must be a way to implement it on a quantum computer as a unitary time evolution.
Let's call it :math:`U_f`.
Note that its action on :math:`\left|y\right>` is controlled by the value of :math:`f(x)` instead of the ancilla qubit state directly.
It is a :wiki:`CNOT gate <Controlled_NOT_gate>` gate controlled by the value of :math:`f(x)`.
Let me also assure you that in the :math:`n`-qubit case,
such :math:`U_f` can be implemented on a quantum computer without exponential trouble.
Thus the exponential speed up is real.

With a hardware implementation of :math:`U_f`, we can apply it on a special initial state, i.e.,

.. math:: C(U_f) H\otimes H\left|0\right>\left|1\right>

where the first qubit is the ancilla qubit,
and the controlled qubit is in the eigenstate of the NOT gate (or X-gate since it's the Pauli x matrix) :math:`H\left|1\right>` with eigenvalue :math:`-1`, or equivalently :math:`\phi=\pi`.
After simplification, the ancillar qubit is given by

.. math:: \frac{1}{\sqrt 2}\left(\left|0\right> + (-1)^{f(0) \oplus f(1)}\left|1\right>\right)

Recall that :math:`f` is either constant or balanced.
Thus the phase kickback is either :math:`0` or :math:`\pi`,
which is particularly easy to distinguish since they are eigenstates of :math:`\sigma_x`.
One can measure :math:`\sigma_x` just once to tell them apart,
with only one copy of the input state.
In the quantum computing framework, the equivalent procedure is to first apply [Hadamard gate][h] and then check whether the state is :math:`\left|0\right>` or :math:`\left|1\right>`.

Admittedly, Deutch algorithm is quite artificial.
But it opens up the possibility of exponential speedup on quantum computers.

Quantum Fourier transform (QFT)
===============================


Discrete Fourier transform (DFT)
--------------------------------

Phase estimation algorithm (PEA)
================================



Quantum Approximate Optimization Algorithm (QAOA)
=================================================

Quantum random walk
===================
