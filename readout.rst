*************
State readout
*************

* von-Neumann measurement
* phase kick back
* state tomography


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

