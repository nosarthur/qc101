*******************
Quantum bit (qubit)
*******************

A qubit is a quantum object with two states.
It is an abstraction with all hardware implementation details hidden,
just like its classical counterpart of :wiki:`bit <Bit>`.
To be concrete, one can think of the two qubit states to be two states of an atom.

In this document, we will be only talking about qubit in pure state, with the parametrization

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

where :math:`\alpha,\beta\in \mathbb{C}` and the probability interpretation requires :math:`|\alpha|^2 + |\beta|^2 = 1`.
Two complex numbers with one constraint gives rise to three degrees of freedom.
Without loss of generality, we can let :math:`\alpha` be real,
and reparametrize with only two real values

.. math:: \left|\psi\right> = \cos\frac{\theta}{2}\left|0\right> + e^{i\phi}\sin\frac{\theta}{2}\left|1\right>

where :math:`\theta\in[0, \pi]`, and :math:`\phi\in [0, 2\pi)`.

a geometric picture
-------------------
:wiki:`Bloch sphere <Bloch_sphere>`



.. figure:: https://upload.wikimedia.org/wikipedia/commons/6/6b/Bloch_sphere.svg

   Bloch sphere

on the sphere
The normalization :math:`\alpha \beta` sum 1 is equivalent to :math:`r = 1`.

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

time evolution
--------------

.. math:: \left|\psi(t)\right> = e^{-iHt}\left|\psi(0)\right>

