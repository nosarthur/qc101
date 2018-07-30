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

As an example of truly two-qubit gates, let's generalize the :wiki:`XOR gate`
in classical computing to the quantum case.
The truth table of XOR gate is

=====  =====  =======
   Inputs     Output
------------  -------
  A      B    A XOR B
=====  =====  =======
0        0     0
0        1     1
1        0     1
1        1     0
=====  =====  =======

In classical computing, three bits are involved in XOR gate: two input bits and
one output bit. In quantum computing, all (single-qubit and multiple-qubit)
gates are unitary matrices that map the input states to the output states.
In other words, the input and output qubits are not different qubits.

Thus to extend XOR gate to the quantum case, we need to expand the output a
two-bit string. The easiest way is to overwrite the output to qubit B and let
qubit A remain its input state.
Writing out explicitly, we have

.. math:: \left|00\right>\rightarrow \left|00\right> \\
          \left|01\right>\rightarrow \left|01\right> \\
          \left|10\right>\rightarrow \left|11\right> \\
          \left|11\right>\rightarrow \left|10\right>

If we choose the representation

.. math:: \left|00\right>  = \begin{bmatrix}1\\0\\0\\0\end{bmatrix},
        \left|01\right>  = \begin{bmatrix}0\\1\\0\\0\end{bmatrix},
        \left|10\right>  = \begin{bmatrix}0\\0\\1\\0\end{bmatrix},
        \left|11\right>  = \begin{bmatrix}0\\0\\0\\1\end{bmatrix},

then the quantum equivalent of the classical XOR gate takes the form

.. math:: CNOT = \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & 0 & 1\\
    0& 0 & 1 & 0
    \end{bmatrix} = \left|0\right>\left<0\right|\otimes I
                    + \left|1\right>\left<1\right|\otimes X
    :label: cnot

In fact, it is an important 2-qubit quantum gate called
:wiki:`Controlled-NOT or CNOT gate <Controlled_NOT_gate>`, and we will see
its usage many times later in this book.
Its name comes from the following interpretation: if the first qubit is in
state :math:`\left|0\right>`, don't do anything on the second qubit; if the
first qubit is in state :math:`\left|1\right>`, flip the second qubit state.

We pick XOR gate as an example because it is a reversible gate.
Other classical two-bit gates such as AND gate and OR gate are irreversible,
and their extension to the quantum region will involve three qubits.
We will see that in the next chapter.

separable states and entangled states
=====================================

Some of the two-qubit states can be constructed from two single-qubit states, i.e.,

.. math::  \left|\psi\right> = \left|\psi_1\right> \otimes \left|\psi_2\right>
   :label: separable-states

These states are called separable states.
The states that cannot be decomposed to tensor product of single-qubit states
are called :wiki:`entangled states <Quantum_entanglement>`.
Recall from the previous chapter that each single-qubit pure state has only two
real parameters. Thus separable states live in a four dimensional subspace of
the six dimensional two-qubit state space.
In other words, there are a lot more entangled states than separable states.

Bell states
-----------

The nominal examples of two-qubit entangled states are the so-called :wiki:`Bell state`\s:

.. math::
   \left|\Phi^+\right> & = \left|00\right> + \left|11\right> \\
   \left|\Phi^-\right> & = \left|00\right> - \left|11\right> \\
   \left|\Psi^+\right> & = \left|01\right> + \left|10\right> \\
   \left|\Psi^-\right> & = \left|01\right> - \left|10\right>
   :label: Bell-states

Here I omit the normalization factor :math:`1/\sqrt{2}` to save typing.
Note that the four Bell states are orthogonal to each other thus form a basis
set other than the computational basis set :math:`\left|00\right>`,
:math:`\left|01\right>`, :math:`\left|10\right>`, :math:`\left|11\right>`.
We will see later that it is a very useful basis set to use.

Two sets of basis sets are connected by the two important gates

.. math:: CNOT \cdot H\otimes I \left|00\right> = \left|\Phi^+\right> \\
        CNOT \cdot H\otimes I \left|01\right> = \left|\Psi^+\right> \\
        CNOT \cdot H\otimes I \left|10\right> = \left|\Phi^-\right> \\
        CNOT \cdot H\otimes I \left|11\right> = \left|\Psi^-\right>

and equivalently,

.. math:: \left|00\right> =H\otimes I \cdot CNOT \left|\Phi^+\right> \\
          \left|01\right> =H\otimes I \cdot CNOT  \left|\Psi^+\right> \\
          \left|10\right> =H\otimes I \cdot CNOT  \left|\Phi^-\right> \\
          \left|11\right> =H\otimes I \cdot CNOT  \left|\Psi^-\right>
          :label: Bell-states-conversion

The significance of the computational bases is that they represent states on
hardware and in reality one can only measure these states.
Thus if we know some computation results in one of the four Bell states, we need
to apply CNOT and Hadamart gate to convert the result to computational basis
states first, and then make the measurement.

Separable state is the quantum analogy of statistical independent random
variables.
Entangled states have the peculiar feature that 

.. seealso::
   Here I only talk about pure state. The identification and quantification of
   entanglement in mixed states is more complicated. In short, a separable
   two-qubit state can be put in the form of

   .. math:: \rho = \sum_i p_i \rho_A \otimes \rho_B

   You can see that it's a much harder problem than the pure state separability,
   since there is no prior knowlege on :math:`\{p_i\}`.

It turns out that entanglement is a useful resource for quantum communication.
I will give two examples here - quantum superdense coding and quantum teleportation.
Usually people think entanglement is also important to get speedup in quantum
algorithms than their classical counterparts. But this topic is a bit controversial.
It turns out that entanglement is not the only non-classical correlation
possessed by qubits (see :wiki:`quantum discord` for example), and there are
quantum algorithms for (artificial) computational tasks that provide
exponential speedup over best-known classical algorithm
and do not contain entanglement.

quantum superdense coding
-------------------------

The purpose of quantum superdense coding is to send one qubit which carries
four messages, i.e., two bits of classical information.

It may appear that one qubit could encode infinite messages since its state space
is continuous (recall the qubit state is a 2D complex vector in terms of wave
function, or a 3D real vector on unit sphere in terms of Bloch vector).
However, encoding messages in non-orthogonal quantum states messes up the
decoding, due to the wave function collapse of measurement.

For example, if we encode four messages in

.. math:: \begin{align}\left|0\right> =& \begin{bmatrix}1 \\ 0 \end{bmatrix} \\
        \left|1\right> =& \begin{bmatrix}0 \\ 1 \end{bmatrix} \\
        \left|+\right> =& \left|0\right> + \left|1\right> \\
        \left|-\right> =& \left|0\right> - \left|1\right> \end{align}

Eq. :eq:`Bell-states-conversion` 

This work is published in

* C. H. Bennett and Stephen J. Wiesner, Phys. Rev. Lett. 69, 2881 (1992)

quantum teleportation
---------------------

The purpose of quantum teleportation is to instantaneously destroy a quantum
state on Alice's side and create it on Bob's side without sending any qubits
between Alice and Bob.
It is a primitive version of the device in the movie :wiki:`The Fly <The_Fly_(1986_film)>`.

entanglement measure
====================

It is simple to verify whether a pure state is separable.

.. math:: \left\{\begin{array}{ll}
    \frac{\alpha_0}{\alpha_2} = \frac{\alpha_1}{\alpha_3}\\
    \frac{\alpha_0}{\alpha_1} = \frac{\alpha_2}{\alpha_3}
    \end{array}
   \right.

Add more? Peres PPT? geometric? von Neumann entropy?


A natural question is ask is: **are some entangled states more entangled than others?**
For example, it seems plausible that the state

.. math:: \left|\psi_\epsilon\right> = \epsilon\left|00\right> + (1-\epsilon)\left|\Psi^- \right>

is less entangled than the Bell state for small :math:`\epsilon`.


