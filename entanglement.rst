***********************************
Two qubits and quantum entanglement
***********************************


A two-qubit state can be parametrized as

.. math:: \left|\psi\right> = \alpha_0\left|00\right> + \alpha_1\left|01\right> +\alpha_2\left|10\right> +\alpha_3\left|11\right>


The rest are called entangled states.
The nominal examples of two-qubit entangled states are the so-called :wiki:`Bell state`\s:

.. math:: 
   \left|\Phi^+\right> & = \left|00\right> + \left|11\right> \\
   \left|\Phi^-\right> & = \left|00\right> - \left|11\right> \\
   \left|\Psi^+\right> & = \left|01\right> + \left|10\right> \\
   \left|\Psi^-\right> & = \left|01\right> - \left|10\right>


separable states
================

This concept of separability is the quantum analogy of probabilistic independence.


.. math:: \left\{\begin{array}{ll}
    \frac{\alpha_0}{\alpha_2} = \frac{\alpha_1}{\alpha_3}\\
    \frac{\alpha_0}{\alpha_1} = \frac{\alpha_2}{\alpha_3}
    \end{array}
   \right.

entanglement measure
====================

A natural question is ask is: **are some entangled states more entangled than others?**
For example, it seems plausible that the state

.. math:: \left|\psi_\epsilon\right> = \epsilon\left|00\right> + (1-\epsilon)\left|\Psi^+ \right>

is less entangled than the Bell state for small :math:`\epsilon`.
