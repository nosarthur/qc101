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

.. math:: \begin{align}X\otimes X =& \begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix}\otimes
                    \begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix} \\
            =& \begin{bmatrix} 0 & 0 & 0 & 1\\ 0 & 0 & 1 & 0\\
                0 & 1 & 0 & 0 \\ 1 & 0 & 0 & 0\end{bmatrix}\end{align}

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
In other words, the input and output qubits are the same qubits.

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

.. math:: \begin{align} CNOT =& \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & 0 & 1\\
    0& 0 & 1 & 0
    \end{bmatrix}\\ =& \left|0\right>\left<0\right|\otimes I
                    + \left|1\right>\left<1\right|\otimes X \end{align}
    :label: cnot

In fact, it is an important 2-qubit quantum gate called
:wiki:`Controlled-NOT or CNOT gate <Controlled_NOT_gate>`, and it will be used
many times later in this book.
Its name comes from the following interpretation: if the first qubit is in
state :math:`\left|0\right>`, don't do anything to the second qubit; if the
first qubit is in state :math:`\left|1\right>`, flip the second qubit state.

Here we pick XOR gate as an example because it is a reversible gate.
Other classical two-bit gates such as AND gate and OR gate are irreversible,
and their extension to the quantum region will involve three qubits.
We will see that in the next chapter.

CNOT gate belongs to an important class of quantum gates: the controlled-unitary gates.
In the two-qubit case, controlled-unitary gates have an explicit matrix form

.. math::
    C(U) = \begin{bmatrix}
    1& 0 & 0 & 0\\
    0& 1 & 0 & 0\\
    0& 0 & u_{00} & u_{01}\\
    0& 0 & u_{10} & u_{11}
    \end{bmatrix}

where :math:`u_{ij}` are the matrix components of the single-qubit unitary gate.

separable states and entangled states
=====================================

Some of the two-qubit states can be constructed from two single-qubit states, i.e.,

.. math::  \left|\psi\right> = \left|\psi_1\right> \otimes \left|\psi_2\right>
   :label: separable-states

These states are called separable states.
The states that cannot be decomposed to tensor product of single-qubit states
are called :wiki:`entangled states <Quantum_entanglement>`.
Recall from the previous chapter that each single-qubit pure state has only two
real parameters. Thus two-qubit separable states live in a four dimensional
subspace of the six dimensional two-qubit state space.
In other words, there are a lot more entangled states than separable states.

.. seealso::
   Here I only talk about pure state. The identification and quantification of
   entanglement in mixed states is more complicated. In short, a separable
   two-qubit state can be put in the form of

   .. math:: \rho = \sum_{i=1}^K p_i \rho_A \otimes \rho_B

   for some :math:`K` and :math:`\{p_i\}`. You can see that it's a much harder
   problem than the pure state separability, because of the extra parameters
   :math:`\{p_i\}`.

   * Schmacher 

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
set. We will see later that it is a very useful basis set to use.

Bell states can be transformed to the computational basis states :math:`\left|00\right>`,
:math:`\left|01\right>`, :math:`\left|10\right>`, :math:`\left|11\right>`
by two gate operations

.. math:: \left|00\right> =H\otimes I \cdot CNOT \left|\Phi^+\right> \\
          \left|01\right> =H\otimes I \cdot CNOT  \left|\Psi^+\right> \\
          \left|10\right> =H\otimes I \cdot CNOT  \left|\Phi^-\right> \\
          \left|11\right> =H\otimes I \cdot CNOT  \left|\Psi^-\right>
          :label: Bell-states-conversion

and equivalently,

.. math:: CNOT \cdot H\otimes I \left|00\right> = \left|\Phi^+\right> \\
        CNOT \cdot H\otimes I \left|01\right> = \left|\Psi^+\right> \\
        CNOT \cdot H\otimes I \left|10\right> = \left|\Phi^-\right> \\
        CNOT \cdot H\otimes I \left|11\right> = \left|\Psi^-\right>

The significance of the computational bases is that they represent states on
hardware and in reality one can only measure these states.
Thus if we know some computation results are in one of the four Bell states,
we can apply CNOT and Hadamart gate to convert the results to computational
basis states first, and then make the measurement.

Separable state is the quantum analogy of statistical independent random
variables.
Entangled states have the peculiar feature that the total system is less
complex than the subsystems.
To fully understand this statement, one needs to know the concept of
:wiki:`entropy <Entropy_(information_theory)>` in classical information theory.
For simplicity, I will use :math:`\left|\Phi^+\right>` as example.

If we measure :math:`\left|\Phi^+\right>` in the two-qubit computational bases,
the measurement outcome follows :wiki:`Bernoulli distribution` with :math:`p=0.5`,
just like tossing a fair coin.

.. seealso::
  Here is a short introduction to entropy. **The essense of entropy is state
  counting. The more states the bigger the entropy.** And entropy quantifies
  the amount of information, or uncertainty, or possibilities. Suppose the
  system could be in :math:`N` states with equal probability, then its entropy is

  .. math:: S = \log N.

  Here the logrithm function is a historical convention, any monotonic function
  could be used. Its base is also arbitrary as long as used consistently. In
  classical information theory, :math:`N=2` is of special importance because
  that is the number of states for a :wiki:`bit`. In that case, base 2 is used
  and we have :math:`S=\log_2 2= 1`, i.e., one bit of information. This is also
  the entropy of a fair coin.

  What if the coin is not fair? Here we cannot count the states directly since
  they are not of equal probability. Instead, we can count something else that

  * both characterizes the coin bias and
  * is made of individual events of equal probabilities.

  This quantity is the number of configurations with certain heads given a fixed
  number of coin tosses. For example, suppose we make four tosses and focus on
  configurations with two heads. There are six such configurations: HHTT, HTHT,
  HTTH, THHT, THTH, TTHH. Here HTHT means the first and third tosses end up with
  heads. Note that these configurations are of the same probability, no matter
  what the coin bias is.

  There are still the questions of how many tosses to do and how many heads to
  focus on. Obviously any finite number of tosses doesn't make sense. And the
  :wiki:`law of large numbers` automatically fixes the head counts for us, i.e.,
  with :math:`M` tosses, the number of heads is

  .. math:: M_H = Mp_H

  in the limit of large :math:`M`, and :math:`p_H` is the head probability.
  This is where the coin bias enters the picture.

  This idea can be expressed as

  .. math::
     S = \lim_{M\rightarrow \infty} \frac{\log_2 C(M, M_H)}{M}

  where :math:`C(n, k)` is the :wiki:`n-choose-k function <Binomial_coefficient>`,
  and the denominator is there to prevent the numerator to blow up.

  Using :wiki:`Stirling's approximation`,

  .. math:: \log M! = M\log M  -M + O(\log M)

  we get the :wiki:`binary entropy function`

  .. math:: S = -p_H\log p_H - p_T\log p_T

  It is consistent with the fair coin case. Also the fair coin case has the
  largest entrpoy, which is :math:`1`.

It turns out that entanglement is a useful resource for quantum communication.
I will give two examples here - quantum superdense coding and quantum teleportation.
Usually people think entanglement is also important to get speedup in quantum
algorithms than their classical counterparts. But this topic is a bit controversial.
It turns out that entanglement is not the only non-classical correlation
possessed by qubits (see :wiki:`quantum discord` for example), and there are
quantum algorithms providing exponential speedup over best-known classical
algorithms and the computation processes do not contain entanglement.

quantum superdense coding
-------------------------

The purpose of quantum :wiki:`superdense coding` is to send one qubit which carries
four messages, i.e., two bits of classical information.
This work is published in

* C. H. Bennett and Stephen J. Wiesner, Phys. Rev. Lett. 69, 2881 (1992)


It may appear that one qubit could encode infinite messages since its state space
is continuous (recall the qubit state is a 2D complex vector in terms of wave
function, or a 3D real vector on unit sphere in terms of Bloch vector).
However, encoding messages in non-orthogonal quantum states messes up the
decoding, due to the wave function collapse of measurement.

For example, suppose we encode four messages in

.. math:: \begin{align}\left|0\right> =& \begin{bmatrix}1 \\ 0 \end{bmatrix} \\
        \left|1\right> =& \begin{bmatrix}0 \\ 1 \end{bmatrix} \\
        \left|+\right> =& \left|0\right> + \left|1\right> \\
        \left|-\right> =& \left|0\right> - \left|1\right> \end{align}

and we receive an encoded qubit from someone. No matter how we measure it, we
won't be sure about which state it is in.
In fact, there is a so-called :wiki:`Holevo's bound <Holevo%27s_theorem>` which
says one qubit can at most carry the information of one classical bit.

The trick of quantum superdense coding is to first share a Bell state before
transmitting the message-carrying qubit. For example,
share :math:`\left|\Psi^-\right>` between Alice and Bob.

The encoding can be done by applying one of the four gates :math:`\{I, X, Y, Z\}`
on Alice's qubit,

.. math:: \begin{align} I \left|\Psi^-\right> =& \left|\Psi^-\right> \\
             X \left|\Psi^-\right> =& \left|\Phi^-\right> \\
             Y \left|\Psi^-\right> =& i\left|\Phi^+\right> \\
             Z \left|\Psi^-\right> =& \left|\Psi^+\right> \\
             \end{align}

Then Alice can send her qubit to Bob, and Bob can decode the message by
converting the Bell state to computational basis state as in
Eq. :eq:`Bell-states-conversion` and making a measurement.

Note that quantum superdense coding does not break Holevo's bound because two
qubits are sent. It's just that one qubit can be sent at an earlier time and it
alone does not carry information.

quantum teleportation
---------------------

The purpose of :wiki:`quantum teleportation` is to instantaneously destroy a
quantum state on Alice's side and create it on Bob's side without sending any
qubits between Alice and Bob.
This work is published in

* C. H. Bennett, G. Brassard, C. Crépeau, R. Jozsa, A. Peres, W. K. Wootters
  Teleporting an Unknown Quantum State via Dual Classical and
  Einstein-Podolsky-Rosen Channels, Phys. Rev. Lett. 70, 1895 (1993).

Again, the prerequisite is to have Alice and Bob share an entangled state, say
:math:`\left|\Phi+\right>`. The initial state can be written as

.. math:: \left|\xi\right>_A\otimes\left(\left|0\right>_A\left|0\right>_B
            + \left|1\right>_A\left|1\right>_B \right) =
            (a\left|0\right> + b\left|1\right>)_A \otimes
        \left(\left|0\right>_A\left|0\right>_B
            + \left|1\right>_A\left|1\right>_B \right)

where the subscripts denote the qubits ownership.

Expressing Alice's two qubits in Bell state basis, we get

.. math:: \begin{align}&\left|\Psi^+\right>_A \otimes (a\left|0\right> + b \left|1\right>)_B\\
        +& \left|\Psi^-\right>_A \otimes (a\left|0\right> - b \left|1\right>)_B \\
        +& \left|\Phi^+\right>_A \otimes (b\left|0\right> + a \left|1\right>)_B\\
        + &\left|\Phi^-\right>_A \otimes (-b\left|0\right> + a \left|1\right>)_B\end{align}

Thus by measuring her qubits in the Bell state basis, Alice can project Bob's
qubit into one of the four states. So if Alice further informs Bob about her
measurement result, say from classical communication such as phone call, Bob
can recover the original state :math:`\left|\xi\right>_A`.
For example, if Alice's measurement result is :math:`\left|\Psi-\right>`, then
Bob can apply :math:`Z` gate on his qubit.

One may wonder why not sending :math:`\left|\xi\right>` directly. One potential
usage of teleportation is to send half of the Bell state when quantum
communication cost is low and when the cost is high, one can use cheap classical
communication to effectively transfer quantum state.

entanglement measure
====================

Since quantum entanglement can be used as communication resource, it is of
practical interest to quantify entanglement.

For two-qubit pure states, verifying whether a state is separable is simple.
Given state in Eq. :eq:`two-qubit-state`, we can check the validity of the
following equalities

.. math:: \left\{\begin{array}{ll}
    \frac{\alpha_0}{\alpha_2} = \frac{\alpha_1}{\alpha_3}\\
    \frac{\alpha_0}{\alpha_1} = \frac{\alpha_2}{\alpha_3}
    \end{array}
   \right.

A natural question to ask is: **are some entangled states more entangled than others?**
For example, it seems plausible that the state

.. math:: \left|\psi_\epsilon\right> = \epsilon\left|00\right> + (1-\epsilon)\left|\Psi^- \right>

is less entangled than the Bell state and more entangled than :math:`\left|00\right>`.

There are a lot of open questions in entanglement measure.
And many interesting results exist for small systems: two-qubits (dimension 4),
qubit-qutrit (dimension 6), three-qubits (dimension 8).
Since this is an introductory book, maybe I stop here.


* `Quantum entanglement, Ryszard Horodecki, Pawel Horodecki, Michal Horodecki, Karol Horodecki, Review of Modern Physics, 81, 865-942 (2009) <https://arxiv.org/abs/quant-ph/0702225>`_
