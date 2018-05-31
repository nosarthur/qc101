*************
State readout
*************

* von-Neumann measurement

Suppose we do not have any prior information about a quantum state,
it is impossible to know what it is. Take 1-qubit for example, an arbitrary state takes the form

state tomography
================


phase kickback
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

Quantum Fourier transform (QFT)
===============================


Discrete Fourier transform (DFT)
--------------------------------

QFT is closely related to :wiki:`discrete Fourier transform` (DFT),
an important tool in :wiki:`digital signal processing`.
And we will start from there.

As the name indicates, DFT is the discrete version of :wiki:`Fourier transform`.
Most commonly, the input sequence is time series data or spatial samples,
and the output sequence is frequency data, i.e., the Fourier spectrum.
Overall, it is

* a linear map between two sequences of complex numbers;
* a non-degenerate map with an inverse, i.e., the inverse discrete Fourier transform (IDFT);
* a map that's cheap to compute: the :wiki:`fast Fourier transform` (FFT) algorithm has computational complexity :math:`O(N\log N)` (instead of :math:`O(N^2)` for a general linear map)

In practice, DFT is widely used because

* In signal processing, often times the signals are band-limited. Then the Fourier spectrum provides a more succinct representation of the signals;
* In physics problem, often times the symmetry can be more easily utilized in the Fourier domain;
* It is useful for :wiki:`convolution` calculations;
* It is efficient to calculate;
* ...

In 1D, DFT can be defined as

.. math:: X_k = \frac{1}{\sqrt{N}} \sum_{j=0}^{N-1} \omega_N ^{-jk} x_j

where :math:`\omega_N\equiv\exp(2\pi i/N)` is the :math:`N`'th root of unity and :math:`i=\sqrt{-1}`.
And the IDFT is given by

.. math::  x_j = \frac{1}{\sqrt N} \sum_{j=0}^{N-1} \omega_N ^{jk} X_k

Generalization to higher dimensions is straightforward.

Different authors use different normalization conventions for DFT and IDFT.
I have the impression that physicists and engineers prefer to have :math:`1` in DFT and :math:`1/N` in IDFT,
whereas mathematicians prefer this :math:`1/\sqrt{N}` normalization.
For QFT, :math:`1/\sqrt{N}` is better as it normalizes the wave functions correctly.

There is also arbitrariness in the range of the summation index :math:`j`:
any :math:`N` consecutive integers will do.
Sometimes it is more convenient to include both positive and negative values.
To complicate things even more, some authors swap the definitions of DFT and IDFT.
Thus one needs to be very cautious with other people's formulas.

The DFT transformation has explicit matrix form. For example,

.. math:: DFT_2 = \frac{1}{\sqrt 2}\begin{bmatrix}
    1 & 1 \\
    1 & -1 
    \end{bmatrix},\quad DFT_4 = \frac{1}{2}\begin{bmatrix}
    1 & 1 & 1 & 1\\
    1 & -i & -1 & i\\
    1 & -1 & 1 & -1\\
    1 & i & -1 & -i
    \end{bmatrix}

In general, the DFT matrix looks like

.. math::
    DFT_N = \frac{1}{\sqrt N}\begin{bmatrix}
    1 & 1 & 1 & \cdots & 1\\
    1 & \omega_N^{-1} & \omega_N^{-2} & \cdots & \omega_N^{-(N-1)} \\
    1 & \omega_N^{-2} & \omega_N^{-4} & \cdots & \omega_N^{-2(N-1)} \\
    \vdots & \vdots & \vdots & \cdots & \vdots \\
    1 & \omega_N^{-(N-1)} & \omega_N^{-2(N-1)} & \cdots & \omega_N^{-(N-1)(N-1)}
    \end{bmatrix}

You can easily check that the rows are all perpendicular to each other (remember to take complex conjugate).
Thus each component of the DFT output, i.e., :math:`X_k`, is a projection of the input to one of a set of orthogonal directions.
If you visualize the :math:`\omega_N^j` in the complex plane, then each row can be seen as a rotating unit vector with different angular velocity.
And the action of each row is to extract the component of a specific angular velocity.

There are a lot of subtleties in DFT.
For example, given a continuous function (:wiki:`analog signal`),
should I do Fourier transform first, then sample the frequency domain function?
Or sample the continuous function first, and then do DFT on the time domain samples?
My favorite theorem along these lines is the :wiki:`Shannon sampling theorem`, which answers the following questions:

* Does a continuous function have infinite degrees of freedom since there are infinite input values (like in classical field theory)? This is plausible but is also complicated by the continuity requirement.
* If a function is band-limited, does it still have infinite degrees of freedom?

QFT, Hadamard transform, and measurement
----------------------------------------

In fact, QFT is exactly DFT,  with the input/output vectors being probability amplitudes of quantum states.
Thus it is a transformation between quantum states, i.e., a quantum gate.

For quantum computing, the state vector is of dimension :math:`N=2^n` where :math:`n` is the number of qubits.
Following the arguments in the previous section, let's look at two sets of special states, both of which consists of only separable states:

* states corresponds to the rows of the :wiki:`Walsh-Hadamard matrix<Hadamard_transform>`:
  :math:`\prod_{j=0}^{n-1}\otimes\left(\left|0\right>+(-1)^{r_j}\left|1\right>\right)`
* states corresponds to the rows of the :wiki:`IQFT/IDFT matrix<Quantum_Fourier_transform>`:
  :math:`\prod_{j=0}^{n-1}\otimes\left(\left|0\right>+\omega_{2^n}^{jr}\left|1\right>\right)`

where :math:`r=0,1,..,2^n-1` is the row index of the :math:`n`-qubit transform matrix,
:math:`r_j` is the :math:`j`'th digit of :math:`r`'s binary representation,
and :math:`\otimes` denotes tensor product.
This QFT tensor product decomposition can be easily derived from small :math:`n` cases and induction.

Note that the Walsh-Hadamard gate is particularly easy to implement since it can be decomposed as 1-qubit Hadamard gates,
i.e., :math:`H_n = H_1^{\otimes n}`.
In the QFT case, the qubits do not fully decouple (note the coefficient before :math:`\left|1\right>` depends on :math:`r` instead of a single binary digit of :math:`r`),
thus a naive QFT implementation requires :math:`n-1` 1-qubit controlled-phase gate on each qubit,
which is already efficient (:math:`O(n^2)` 1-qubit gates) on a quantum computer.
A more careful examination will reveal that many of them can be avoided.

Recall that classical FFT has complexity :math:`O(N\log N)` where :math:`N=2^n`, i.e., :math:`O(n2^n)`.
Thus it appears that quantum computer can calculate DFT exponentially faster.
This is actually not completely true:
the catch is that the DFT result (i.e., the probability amplitudes)
is not accessible in general due to the measurement/readout problem.
