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

    The time evolution calculation may be the most mathematical section of the
    whole book. Feel free to skip it if needed.

A qubit is a quantum object with two states.
It is an abstraction with all hardware implementation details hidden,
just like its classical counterpart of :wiki:`bit <Bit>`.
To be concrete, one can think of the two qubit states to be two states of an atom,
or two sides of a coin.

In this book, we will almost only deal with pure state.
For qubit, it has the parametrization

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

where :math:`\alpha,\beta` are complex numbers and the probability interpretation
requires :math:`\|\alpha\|^2 + \|\beta\|^2 = 1`.
Two complex numbers with one normalization constraint gives rise to three degrees of freedom.

There is one more dispensable degree of freedom: :math:`\left|\psi\right>` and
:math:`e^{i\eta}\left|\psi\right>` are equivalent for any real-valued :math:`\eta`.
This is because these two states give rise to the same measurement probability
distribution and ensemble averages as seen in Eq. :eq:`avg-qm`.

Without loss of generality, we can let :math:`\alpha` be real and positive,
and parametrize with only two real values
:math:`\theta\in[0, \pi]`, and :math:`\phi\in [0, 2\pi)`:

.. math:: \left|\psi\right> = \cos\frac{\theta}{2}\left|0\right> + e^{i\phi}\sin\frac{\theta}{2}\left|1\right>
    :label: bloch-vector

It may look strange to use :math:`\theta/2` instead of :math:`\theta`.
This choice will become clear in the next section.

a geometric picture and the density matrix
------------------------------------------

There is a geometric picture called :wiki:`Bloch sphere representation <Bloch_sphere>` 
for quantum two-state systems, which may be first formulated in studies of :wiki:`nuclear magnetic resonance`.
It is a must-know for hardware implementations,
but may be less useful for quantum algorithm designs.

The so-called :wiki:`Bloch sphere` is basically a mapping from the
qubit state :math:`\left|\psi\right>` to three ensemble averages

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

Note the normalization :math:`\|\alpha\|^2+\|\beta\|^2=1` translate to to :math:`x^2 + y^2 + z^2 = 1`.
In other words, valid (pure) qubit states are on the sphere or radius :math:`1`.
Thus the two parameters in Eq. :eq:`bloch-vector` can be interpreted as polar and azimuthal angles.
Thus one can visualize qubit state as a 3D vector,
as in :numref:`bloch-sphere`.

.. _bloch-sphere:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/6/6b/Bloch_sphere.svg

   Bloch sphere

There is another way to introduce the Bloch vector, which is tied to a different
way to represent the quantum state, the so-called density matrix.
Instead of writing the quantum state as a complex vector :math:`\left|\psi\right>`,
we could alternatively write it out as a matrix

.. math:: \rho = \left|\psi\right>\left<\psi\right|

If we know :math:`\left|\psi\right>`, it's trivial to get :math:`\rho`.
However, if know :math:`\rho`, we cannot decompose it into a unique :math:`\left|\psi\right>`
because :math:`e^{i\gamma}\left|\psi\right>` with any real-valued :math:`\gamma`
is also valid. This is not a problem since the overall phase factor does not
affect any measurement result.

The diagonal entries of :math:`\rho` denote the probability of the states.
And the off-diagonal entries denote the quantum interference that has no classical counterpart.
We can easily see that the following identity holds

.. math: tr(\rho)\equiv \sum_i \rho_i = 1

where :math:`tr` is the so-called trace operation, which sums the diagonal entries.

For a single qubit, the density matrix can be decomposed as

.. math: \rho = I + x X + y Y + z Z

and the Bloch vector components in Eq. :eq:`xyz` can be expressed as

.. math: \begin{align}
        x &= tr(\rho X) \\
        y &= tr(\rho Y) \\
        z &= tr(\rho Z)
        \end{align}

This can be understand in terms of a linear space of matrices.
The density matrix :math:`\rho` is a Hermitian matrix,
i.e. :math:`\rho^\dagger=\rho`.
All :math:`2\times2` Hermitian matrix can be expanded with the basis set :math:`\{I, X, Y, Z\}`.

The inner product for this linear space is the trace operation :math:`tr`.
Thus two matrices :math:`A, B` are orthogonal if

.. math: tr(AB) = 0

Overall, the density matrix is

* a more succinct representation of the quantum state
    * it automatically gets rid of the global phase factor;
    * it connects to physical observables directly;
* a more general representation that can model the so-called mixed states,
  which will be covered in the obstacle chapter.

time evolution
--------------

Recall from the previous chapter that quantum time evolution has the form of

.. math:: \left|\psi(t)\right> = e^{-iHt}\left|\psi(0)\right>

where :math:`H` is known as the Hamiltonian matrix and it determines how the state vector (probability distribution) changes.
For simplicity, we assume :math:`H` does not depend on time.

For a single qubit, the most general form of :math:`H` is

.. math:: H = a X + b Y + c Z + d I
    :label: single-qubit-H

where :math:`I` is 2-by-2 identity matrix, :math:`X, Y, Z` are :wiki:`Pauli matrices`,
and :math:`a, b, c, d` are real-valued coefficients.
In an experimental setup, one may have control over these coefficients.
Thus by tuning these coefficients as well as time, one controls the time evolution
:math:`U(t) = \exp(-iHt)` of the qubit.

Usually one drops the :math:`I` term because it only gives rise to an overall phase factor
:math:`\exp(idt)`, which has no consequence for measurement.

It is illuminating to see the action of the unitary time evolution in the Bloch sphere representation,
i.e.,

.. math:: \begin{align} x(t) &=\left<\psi(t)\right|X\left|\psi(t)\right> \\
          y(t) &=\left<\psi(t)\right|Y\left|\psi(t)\right> \\
          z(t) &=\left<\psi(t)\right|Z\left|\psi(t)\right> \end{align}

To make the math simple, let's consider Hamiltonians with only one Pauli matrix.
The simplest case is with :math:`Z` since it is already diagonal.

.. math:: \begin{align} e^{icZt} =& \begin{bmatrix} e^{ict} & 0 \\ 0 & e^{-ict}\end{bmatrix} \\
            =& e^{i\frac{\phi_t}{2}} \begin{bmatrix} 1 & 0 \\ 0 & e^{-i\phi_t}\end{bmatrix} \end{align}
    :label: phase-gate

where :math:`\phi_t = 2ct`.

With this time evolution, the state vector becomes

.. math:: \left|\psi(t)\right> = \begin{bmatrix}\cos\frac{\theta}{2} \\ \sin\frac{\theta}{2} e^{i\left(\phi-\phi_t\right)} \end{bmatrix}

Note that I have omitted an overall phase factor of :math:`\exp(i\phi_t/2)`.
In terms of the Bloch vector, 

.. math:: \begin{align} x(t) &= \sin\theta\cos(\phi -\phi_t)\\
          y(t) &= \sin\theta\sin(\phi-\phi_t) \\
          z(t) &= \cos\theta \end{align}

Thus the Bloch vector rotates about the z-axis with angular velocity :math:`2c`.

To calculate the time evolution matrix for the other two cases,
we will need to diagonalize the Hamiltonian first.
Take :math:`X` for example, it has the decomposition

.. math:: \begin{align}X \equiv &\begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix}\\
            = & VZV^\dagger\\
            = & \frac{1}{\sqrt 2} \begin{bmatrix}1 & 1 \\ 1 & -1 \end{bmatrix} \begin{bmatrix} 1 &  0 \\ 0 & -1\end{bmatrix} 
                \frac{1}{\sqrt 2} \begin{bmatrix} 1 & 1 \\ 1 & -1 \end{bmatrix}  \end{align}

One can think of this decomposition as :wiki:`singular-value decomposition`.
Since :math:`X` and any Hamiltonian in general is Hermitian, only one orthonormal basis is needed.

Then the time evolution is given by

.. math:: \begin{align} e^{iaXt} = & V e^{iaZt} V^\dagger \\
                 = & \begin{bmatrix}\cos\frac{\phi_t}{2} & i\sin\frac{\phi_t}{2} \\
                        i\sin\frac{\phi_t}{2} & \cos\frac{\phi_t}{2}
                    \end{bmatrix} \end{align}

The expression of the Bloch vector with this time evolution matrix is quite complicated,
although the underlying interpretation is simple.


.. math:: \begin{align} x(t) &= \sin\theta\cos\phi \\
          y(t) &= \sin\theta\sin(\phi-\phi_t) \\
          z(t) &= \cos\theta \end{align}

I will leave the calculation of :math:`\exp(iYt)` as an exercise for you.

In general, the Hamiltonian in Eq. :eq:`single-qubit-H` causes the Bloch vector
to rotate about the axis of :math:`[a, b, c]` with the angular velocity of
:math:`2t\sqrt{a^2+b^2+c^2}`.

one-qubit quantum gate
----------------------

.. math:: x(t) =\left<\psi(t)\right|X\left|\psi(t)\right>

