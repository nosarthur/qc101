*******************
Quantum bit (qubit)
*******************

.. note::
   The goal of this chapter includes

   * introducing 3 different ways to represent a qubit state

     * wave function :math:`\left|\psi\right>` as a 2D complex vector
     * Bloch vector :math:`[x, y, z]^T` as a 3D real vector
     * density matrix :math:`\rho` as a :math:`2\times2` matrix with complex entries

   * calculting time evolution (i.e., quantum gate) using time-independent Hamiltonian


A qubit is a quantum two-state system.
It is an abstraction with all hardware implementation details hidden,
just like its classical counterpart of :wiki:`bit <Bit>`.
To be concrete, one can think of the two qubit states to be two states of an
atom, or two sides of a coin.

The single-qubit wave function has the parametrization

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

where :math:`\alpha,\beta` are complex numbers and the probability interpretation
requires :math:`\|\alpha\|^2 + \|\beta\|^2 = 1`.
Two complex numbers with one normalization constraint gives rise to three degrees of freedom.

There is one more dispensable degree of freedom: :math:`\left|\psi\right>` and
:math:`e^{i\eta}\left|\psi\right>` are equivalent for any real-valued :math:`\eta`.
This is because these two states have the same measurement probability
distribution (:math:`p_0=\|\alpha\|^2` and :math:`p_1=\|\beta\|^2`) and ensemble
averages in Eq. :eq:`avg-qm`, as

.. math:: \left<\psi\right|e^{-i\eta} F e^{i\eta}\left|\psi\right>
   =\left<\psi\right|F \left|\psi\right>

Without loss of generality, we can let :math:`\alpha` be real and positive,
and parametrize the wave function with only two real values
:math:`\theta\in[0, \pi]`, and :math:`\phi\in [0, 2\pi)`:

.. math:: \left|\psi\right> = \cos\frac{\theta}{2}\left|0\right> + e^{i\phi}\sin\frac{\theta}{2}\left|1\right>
    :label: bloch-vector

It may look strange to use :math:`\theta/2` instead of :math:`\theta`.
This choice will be convenient later.

a geometric picture and the density matrix
------------------------------------------

There is a geometric picture called :wiki:`Bloch sphere` representation
for quantum two-state systems, which may be first formulated in studies of
:wiki:`nuclear magnetic resonance`.
It is a must-know for hardware implementations,
but may be less useful for quantum algorithm designs.

There are only three ensemble averages for a single-qubit state:

.. math:: \begin{align}
          x &= \left<\psi|X|\psi\right>\\
          y &= \left<\psi|Y|\psi\right> \\
          z &= \left<\psi|Z|\psi\right>
          \end{align}
    :label: xyz

where :math:`X, Y, Z` are :wiki:`Pauli matrices`:

.. math:: \begin{align}X &= \begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix} \\
          Y &= \begin{bmatrix} 0 & -i \\ i & 0\end{bmatrix} \\
          Z &= \begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}
          \end{align}

This three dimensional real vector is called Block vector.
Note also that the Pauli matrices are :wiki:`Hermitian <Hermitian_matrix>` and :wiki:`traceless <Trace_(linear_algebra)>`.

Plugging the state Eq. :eq:`bloch-vector`, we have

.. math:: \begin{align}
          x &= \begin{bmatrix} \cos\frac{\theta}{2} & \sin\frac{\theta}{2}e^{-i\phi}\end{bmatrix}
                \begin{bmatrix}0 & 1 \\ 1 & 0\end{bmatrix}
                \begin{bmatrix} \cos\frac{\theta}{2} \\ \sin\frac{\theta}{2}e^{i\phi}\end{bmatrix}
                = \sin\theta\cos\phi \\
          y &= \sin\theta\sin\phi \\
          z &= \cos\theta
          \end{align}

This is the same parametrization of a vector on the sphere of radius :math:`1`
(thanks to our judicious choice of :math:`\theta/2`).
The two parameters :math:`\theta` and :math:`\phi` in Eq. :eq:`bloch-vector`
can be interpreted as polar and azimuthal angles.
And one can visualize qubit state as a 3D vector, as in :numref:`bloch-sphere`.

.. _bloch-sphere:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/6/6b/Bloch_sphere.svg

   Bloch sphere representation of single qubit states. Pure states are on the
   unit sphere, whereas mixed states are inside the unit sphere.

Another way to introduce the Bloch vector is via the so-called density matrix.
Instead of writing the quantum state as a complex vector :math:`\left|\psi\right>`,
we could write out a matrix

.. math:: \rho = \left|\psi\right>\left<\psi\right|
    :label: pure-state-density-matrix

If we know :math:`\left|\psi\right>`, it's trivial to get :math:`\rho`.
However, if know :math:`\rho`, we cannot get a unique :math:`\left|\psi\right>`
because :math:`e^{i\eta}\left|\psi\right>` with any real-valued :math:`\eta`
is also valid. Again, this is not a problem since the overall phase factor does
not affect any measurement result.

The diagonal entries of :math:`\rho` denote the probability of the states.
And the off-diagonal entries denote the quantum interference that has no classical counterpart.
We can easily see that the following identity holds

.. math:: tr(\rho)\equiv \sum_i \rho_i = 1
    :label: tr1

where :math:`tr` is called the trace operation, which sums the diagonal entries.

For a single qubit, the density matrix can be decomposed as

.. math:: \rho = \frac{1}{2}(I + x X + y Y + z Z)

and the Bloch vector components in Eq. :eq:`xyz` can be expressed as

.. math:: \begin{align}
        x &= tr(\rho X) \\
        y &= tr(\rho Y) \\
        z &= tr(\rho Z)
        \end{align}
    :label: xyz_tr

It will be helpful to check the Bloch vector components in Eq. :eq:`xyz` and
Eq. :eq:`xyz_tr` are equal. In fact, it is possible to show that

.. math:: tr(\left|\psi\right>\left<\psi\right|F) =
    \left<\psi\right|F\left|\psi\right>

for arbitrary matrix :math:`F`.

This can be understand in terms of a linear space of matrices.
From Eq. :eq:`pure-state-density-matrix` the density matrix :math:`\rho` is a
Hermitian matrix, i.e. :math:`\rho^\dagger=\rho`.
And any :math:`2\times2` Hermitian matrix can be expanded with the basis set
:math:`\{I, X, Y, Z\}`.
The inner product for this linear space is the trace operation :math:`tr`,
i.e., two matrices :math:`A, B` are orthogonal if

.. math:: tr(AB) = 0

And the Bloch vector components are coefficients with respect to this basis set.
Note that the coefficient of the identity matrix is fixed by Eq. :eq:`tr1`.

Overall, the density matrix is a more succinct representation of the quantum state.
It automatically gets rid of the global phase factor and
connects to physical observables directly.

.. seealso::
  Eq. :eq:`pure-state-density-matrix` is not the most general form of a quantum
  state. For example, if a colleage asks a quantum state from us repeated, and
  we accidentally give him the wrong state half of the time, then the average
  state he gets can be described as

  .. math:: \rho = \sum_i p_i \left|\psi_i\right>\left<\psi_i\right|

  These states are called mixed states and the ones described by
  Eq. :eq:`pure-state-density-matrix` are called pure states.
  Besides being result of mistakes, mixed states emerges in physical
  implementations whenever imprefection occurs. In other words, pure states are
  idealizations that almost never occur in real life.

  For mixed states,

  .. math:: tr(\rho^2) \neq tr(\rho)

  For a single qubit, one can show that :math:`tr(\rho^2)=1` is equivalent to
  the Bloch vector has unit length. Thus mixed states are represented by
  vectors inside the unit ball, as in :numref:`bloch-sphere`.

time evolution
--------------

Recall from the previous chapter that quantum time evolution has the form of

.. math:: \left|\psi(t)\right> = e^{-iHt}\left|\psi(0)\right>

where :math:`i=\sqrt{-1}`, :math:`H` is the Hamiltonian matrix and
it determines how the state vector (probability distribution) changes.
For simplicity, we have assumed that :math:`H` is time-independent.

For a single qubit, the most general form of :math:`H` is

.. math:: H = a X + b Y + c Z + d I
    :label: single-qubit-H

where :math:`I` is 2-by-2 identity matrix, :math:`X, Y, Z` are :wiki:`Pauli matrices`,
and :math:`a, b, c, d` are real-valued coefficients.
In an experimental setup, one may have control over these coefficients.
Thus by tuning these coefficients as well as time, one controls the time evolution
:math:`U(t) = \exp(-iHt)` of the qubit.

Usually one drops the :math:`I` term because it only gives rise to an overall
phase factor :math:`\exp(-idt)`, which has no consequence for measurement.

It is illuminating to see the action of the unitary time evolution in the Bloch
sphere representation, i.e.,

.. math:: \begin{align} x(t) &=\left<\psi(t)\right|X\left|\psi(t)\right> \\
          y(t) &=\left<\psi(t)\right|Y\left|\psi(t)\right> \\
          z(t) &=\left<\psi(t)\right|Z\left|\psi(t)\right> \end{align}

To make the math simple, let's consider Hamiltonians with only one Pauli matrix.

Z rotation
==========

The simplest case is to have only the :math:`Z` term in the Hamiltonian,
since it is already diagonal.

.. math:: \begin{align}U(t) =& e^{-icZt} \\
        =& \begin{bmatrix} e^{-ict} & 0 \\ 0 & e^{ict}\end{bmatrix} \\
        =& e^{-\frac{i\phi_t}{2}}
            \begin{bmatrix} 1 & 0 \\ 0 & e^{i\phi_t}\end{bmatrix} \end{align}
  :label: phase-gate

where :math:`\phi_t = 2ct`.

With this time evolution, the state vector becomes

.. math:: \left|\psi(t)\right>  = U(t)\left|\psi(t=0)\right> =
   \begin{bmatrix}\cos\frac{\theta}{2} \\ \sin\frac{\theta}{2} e^{i\left(\phi+\phi_t\right)} \end{bmatrix}

Here I have omitted the overall phase factor of :math:`\exp(-i\phi_t/2)`.
In terms of the Bloch vector,

.. math:: \begin{align} x(t) &= \sin\theta\cos(\phi +\phi_t)\\
          y(t) &= \sin\theta\sin(\phi+\phi_t) \\
          z(t) &= \cos\theta \end{align}

Thus the Bloch vector rotates about the z-axis with angular velocity :math:`2c`.

X and Y rotation
================

The time evolution matrix :math:`U(t)=\exp(-iHt)` for the other two cases is
more difficult to calculate since :math:`H` is not diagonal.
We will need to diagonalize the Hamiltonian first.
Take :math:`X` for example, it has the decomposition

.. math:: \begin{align}X \equiv &\begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix}\\
            = & VZV^\dagger\\
            = & \frac{1}{\sqrt 2} \begin{bmatrix}1 & 1 \\ 1 & -1 \end{bmatrix} \begin{bmatrix} 1 &  0 \\ 0 & -1\end{bmatrix}
                \frac{1}{\sqrt 2} \begin{bmatrix} 1 & 1 \\ 1 & -1 \end{bmatrix}  \end{align}

One can think of this decomposition as :wiki:`singular-value decomposition`.
Since :math:`X` and all Hamiltonian matrices are Hermitian,
only one orthonormal basis is needed.

Then the time evolution is given by

.. math:: \begin{align} U(t) =& e^{-iaXt} \\
                 = & V e^{iaZt} V^\dagger \\
                 = & \begin{bmatrix}\cos\frac{\phi_t}{2} & -i\sin\frac{\phi_t}{2} \\
                        -i\sin\frac{\phi_t}{2} & \cos\frac{\phi_t}{2}
                    \end{bmatrix} \end{align}

The expression of the Bloch vector with this time evolution matrix is
unfortunately quite a mess, although the underlying interpretation is simple.
The answer is given by

.. math:: \begin{align} x(t) &= \sin\theta\cos\phi \\
          y(t) &= \sin\theta\sin\phi\cos\phi_t -\cos\theta\sin\phi_t \\
          z(t) &= \sin\theta\sin\phi\sin\phi_t +\cos\theta\cos\phi_t \end{align}

In fact, it is more illuminating to avoid the calculation of the Bloch vector
and calculate the time evolution matrix on the Bloch vector instead.

Using eq. :eq:`xyz_tr`, we have

.. math:: \begin{align} x(t) =& tr\left(\rho(t)X\right) \\
            =& tr\left(U(t)\rho_0 U^\dagger(t) X \right) \\
            =& \frac{1}{2} tr\left(x_0 UXU^\dagger X + y_0UYU^\dagger X
                                    + z_0UZU^\dagger X \right)
          \end{align}

Here the subscript 0 denotes :math:`t=0`. And the other two Bloch vector
components can be calculated similarly.

Further simplification comes from the realization that

.. math:: U(t) = \cos\frac{\phi_t}{2}I -i\sin\frac{\phi_t}{2}X

Putting various terms together, we have

.. math:: \begin{bmatrix} x(t)\\y(t)\\z(t)\end{bmatrix} = \begin{bmatrix}
            1 & 0 & 0 \\ 0  & \cos\phi_t & -\sin\phi_t \\
                0 & \sin\phi_t& \cos\phi_t\end{bmatrix}
            \begin{bmatrix} x_0\\y_0\\z_0\end{bmatrix}

It is obvious that the quantum dynamics with only the Pauli :math:`X` term gives
rise to 3D rotation on the Bloch vector along the x-axis.

I will leave the calculation of Y-rotation as an exercise for you.

arbitrary rotation
==================

As you may have guessed, the general Hamiltonian in Eq. :eq:`single-qubit-H`
causes the Bloch vector to rotate about the axis of :math:`[a, b, c]` with the
angular velocity of :math:`2t\sqrt{a^2+b^2+c^2}`.

one-qubit quantum gate
----------------------

In the chapter, we have seen a few important single-qubit gates.

The Pauli X matrix is actually a gate since it is unitary
(actually all Pauli matrices are both Hermitian and unitary, thus could be gates)

.. math:: X = \begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix}

It is the equivalent of NOT gate in classical computing.

The Z rotation essentially gives rise to the so-called phase shift gate

.. math:: U_\phi = \begin{bmatrix} 1 & 0 \\
                    0 & e^{i\phi}\end{bmatrix}

When we diagonalize the Pauli :math:`X` matrix, the auxiliary :math:`V` matrix
is a very useful gate called :wiki:`Hadamard gate <Quantum_logic_gate#Hadamard_(H)_gate>`.
Conventionally it is denoted as

.. math:: H = \frac{1}{\sqrt 2}\begin{bmatrix}1 & 1 \\ 1 & -1 \end{bmatrix} 

Its common usage is to turn :math:`\left|0\right>` to
:math:`\frac{1}{2}\left(\left|0\right> + \left|1\right>\right)`.

We will see these gates over and over again in later chapters.
