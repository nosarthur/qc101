*********
Obstacles
*********

So far we have been pretending that qubits are two-level artificial atoms.
In reality, they are implemented from

* superconducting circuits
* atoms or molecules
* :wiki:`quantum dot`\ s
* :wiki:`ion trap`\ s
* :wiki:`photons`\ s (light particles)

and many other systems.

Most of these qubits have more than two states.
Thus using them as qubits are like using two sides of a die to do coin flipping.
Sooner or later, we will see the other four sides.
This is a problem known as the qubit going outside the computational states.

The second problem is the imperfection of quantum control, which manifests both
in the state preparation and gate implementation.

The third and probably the most damaging problem is decoherence.
This is an umbrella term for the irreversible change of the qubits
even if the experimentalist does not do anything.
For example, suppose a qubit is implemented by an atom and the two qubit states
correspond to two energy states of the atom.
The higher energy state has some probability to spontaneous lose energy and drop
to the lower energy state.

Another common scenario is that the experimentalist does not know or have
control over certain interactions between the qubit and its environment.

.. seealso::
   Density matrix :math:`\rho` and other types of equations for dynamics are
   needed to describe decoherence process.
   Wave function :math:`\left|\psi\right>` and Schrodinger's equation is not
   sufficient in the situtation because they only describe reversible dynamics.

DiVincenzo criteria
===================

Back in the 90's, Dr. Daniel Loss and Dr. David DiVincenzo proposed five
criteria for a quantum system to be eligible for quantum computer.
It is commonly known as the :wiki:`DiVincenzo's criteria`.

* `D. Loss and D. P. DiVincenzo, Quantum computation with quantum dots, Phys. Rev. A 57, 120 (1998) <https://journals.aps.org/pra/abstract/10.1103/PhysRevA.57.120>`_

The criteria are

#. A scalable physical system with well characterized qubits.
#. The ability to initialize the state of the qubits to a simple fiducial state.
#. Long relevant decoherence times.
#. A universal set of quantum gates.
#. A qubit-specific measurement capability.


* :wiki:`quantum decoherence`: This is about how things could go wrong and it is
  the reason why we don't have an awesome quantum computer yet.
* :wiki:`quantum error correction`: This is the counterpart of classical error correction and it is meant to fight decoherence.


* decoherence

* scalability
* gate fidelity
* state prep
