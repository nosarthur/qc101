***********************************
Two qubits and quantum entanglement
***********************************

A two-qubit state can be parametrized as

.. math:: \left|\psi\right> = \alpha_0\left|00\right> + \alpha_1\left|01\right>
                    +\alpha_2\left|10\right> +\alpha_3\left|11\right>
    :label: two-qubit-state

where :math:`\alpha_i` are complex numbers.
The probabilistic interpretation requires :math:`\sum_i \|\alpha_i\|^2=1`.
And again we can get rid of the overall phase factor by requiring
:math:`\alpha_0` to be real.
Thus there are six independent real parameters for two-qubit pure states.

Often times, the binary state labels are converted to decimal labels to
simplify the notation

.. math:: \left|\psi\right> = \alpha_0\left|0\right> + \alpha_1\left|1\right>
                    +\alpha_2\left|2\right> +\alpha_3\left|3\right>

This is helpful when we deal with many qubits.

two-qubit gates
===============

It's possible to make two-qubit gates out of single-qubit gates. For example,

.. math:: X\otimes X = \begin{bmatrix} 0 & 0 & 0 & 1\\ 0 & 0 & 1 & 0\\
                0 & 1 & 0 & 0 \\ 1 & 0 & 0 & 0\end{bmatrix}

where :math:`X` is the Pauli X gate. However, such gates are less interesting
than the ones that cannot be expressed as tensor products, because they don't
bring the two qubits into interaction.

As an example, let's generalize the XOR gate in classical computing to the quantum case.

.. math:: \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & 0 & 1\\
    0& 0 & 1 & 0
    \end{bmatrix}
    :label: cnot


In fact, it is an important 2-qubit quantum gate called :wiki:`Controlled-NOT or CNOT gate <Controlled_NOT_gate>`.


separable states and entangled states
=====================================

Some of the two-qubit states can be constructed from two single-qubit states, i.e.,

.. math::  \left|\psi\right> = \left|\psi_1\right> \otimes \left|\psi_2\right>
   :label: separable-states

These states are called separable states. The rest are called entangled states.
Recall from the previous chapter that each single-qubit pure state has only two
real parameters. Thus separable states live in a four dimensional subspace of
the six dimensional two-qubit state space.
In other words, there are a lot more entangled states than separable states.

The states that cannot be decomposed to tensor product of single-qubit states
are called :wiki:`entangled states <Quantum_entanglement>`.
The nominal examples of two-qubit entangled states are the so-called :wiki:`Bell state`\s:

.. math::
   \left|\Phi^+\right> & = \left|00\right> + \left|11\right> \\
   \left|\Phi^-\right> & = \left|00\right> - \left|11\right> \\
   \left|\Psi^+\right> & = \left|01\right> + \left|10\right> \\
   \left|\Psi^-\right> & = \left|01\right> - \left|10\right>
   :label: Bell-states


Separable state is the quantum analogy of statistical independent random variables.

It is simple to verify whether a pure state is separable.

.. math:: \left\{\begin{array}{ll}
    \frac{\alpha_0}{\alpha_2} = \frac{\alpha_1}{\alpha_3}\\
    \frac{\alpha_0}{\alpha_1} = \frac{\alpha_2}{\alpha_3}
    \end{array}
   \right.

Peres PPT? geometric? von Neumann entropy?

.. seealso::
   Here I only talk about pure state. The identification and quantification of
   entanglement in mixed states is more complicated.

superdense code
---------------

quantum teleportation
---------------------

entanglement measure
====================

A natural question is ask is: **are some entangled states more entangled than others?**
For example, it seems plausible that the state

.. math:: \left|\psi_\epsilon\right> = \epsilon\left|00\right> + (1-\epsilon)\left|\Psi^- \right>

is less entangled than the Bell state for small :math:`\epsilon`.


