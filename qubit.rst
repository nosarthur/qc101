*******************
Quantum bit (qubit)
*******************

A qubit is a quantum object with two states.
It is an abstraction with all hardware implementation details hidden,
just like its classical counterpart of :wiki:`bit <Bit>`.
To be concrete, one can think of the two qubit states to be two states of an atom,
or two sides of a coin.

In this book, I will only deal with pure state.
For qubit, it has the the parametrization

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

where :math:`\alpha,\beta\in \mathbb{C}` and the probability interpretation requires :math:`|\alpha|^2 + |\beta|^2 = 1`.
Two complex numbers with one constraint gives rise to three degrees of freedom.
Without loss of generality, we can let :math:`\alpha` be real,
and reparametrize with only two real values

.. math:: \left|\psi\right> = \cos\frac{\theta}{2}\left|0\right> + e^{i\phi}\sin\frac{\theta}{2}\left|1\right>
    :label: bloch-vector 

where :math:`\theta\in[0, \pi]`, and :math:`\phi\in [0, 2\pi)`.

a geometric picture
-------------------

There is a geometric picture for qubit states, and for quantum two-state systems in general.
It is a must-know for hardware implementations,
but may be less useful for quantum algorithm designs.

The so-called :wiki:`Bloch sphere <Bloch_sphere>` is basically a mapping from the
qubit state :math:`\left|\psi\right>` to three ensemble averages

.. math:: \begin{align}
          x &= \left<\psi|X|\psi\right> = \begin{bmatrix} cos\frac{\theta}{2} & \sin\frac{\theta}{2}e^{-i\phi}\end{bmatrix}
                \begin{bmatrix}0 & 1 \\ 1 & 0\end{bmatrix}
                \begin{bmatrix} cos\frac{\theta}{2} \\ \sin\frac{\theta}{2}e^{i\phi}\end{bmatrix}\\
          y &= \left<\psi|Y|\psi\right> \\
          z &= \left<\psi|Z|\psi\right>
          \end{align}

where

.. math:: \begin{align}X &= \begin{bmatrix} 0 & 1 \\ 1 & 0\end{bmatrix} \\
          Y &= \begin{bmatrix} 0 & -i \\ i & 0\end{bmatrix} \\
          Z &= \begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}
          \end{align}

are :wiki:`Pauli matrices`.
Thus one can visualize a qubit state as a 3D vector,
as in :numref:`bloch-sphere`.

.. _bloch-sphere:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/6/6b/Bloch_sphere.svg

   Bloch sphere

The normalization :math:`\|\alpha\|^2+\|\beta\|^2=1` translate to to :math:`x^2 + y^2 + z^2 = 1`.
In other words, valid (pure) qubit states are on the sphere or radius :math:`1`.
Thus the two parameters in Eq. :eq:`bloch-vector` can be interpreted as polar and azimuthal angles.

This is useful to understand the action of time evolution, and quantum gates.

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

Any qubit state can be visualized as a vector on the Bloch sphere's surface.

time evolution
--------------

.. math:: \left|\psi(t)\right> = e^{-iHt}\left|\psi(0)\right>

