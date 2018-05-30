*******************
Quantum bit (qubit)
*******************

A qubit is a quantum two-level system. It is an abstract concept with all hardware implementation details hidden, just like its classical counterpart :wiki:`bit <Bit>`.

which means measurement gives two potential results.
In that sense, it is similar to coin tossing.
In this document, we will be only talking about qubit in pure state, with the parametrization

.. math:: \left|\psi\right> = \alpha\left|0\right> + \beta\left|1\right>

where :math:`\alpha`, :math:`\beta\in \mathbb{C}` and :math:`|\alpha|^2 + |\beta|^2 = 1`.



a geometric picture
-------------------
:wiki:`Bloch sphere <Bloch_sphere>`


.. figure:: https://upload.wikimedia.org/wikipedia/commons/6/6b/Bloch_sphere.svg

   Bloch sphere

on the sphere
\alpha \beta sum 1 is equivalent to r = 1


tensor product
--------------

time evolution
--------------


.. math:: \left|\psi(t)\right> = e^{-iHt}\left|\psi(0)\right>
