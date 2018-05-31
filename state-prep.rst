*****************
State preparation
*****************


preprare :math:`\left|0\right>` state
-------------------------------------

Most quantum algorithms assume the initial state to be :math:`\left|0\right>^{\otimes n}`.
But how do we prepare the qubits in that state?

State prepration is strongly tied to the qubit physical implementation.
For different systems, the qubit states :math:`\left|0\right>` and :math:`\left|1\right>`
mean different things.
For simplicity, let's assume that they corresponds to the ground state and some
excited state of a physical system.
In this case, an easy but potentially expensive way to prepare the :math:`\left|0\right>`
state is to cool the qubit towards :wiki:`absolute zero`, i.e., -273.15 degree Celsius.

20mK :wiki:`dilution refrigerator`


After getting a high quality :math:`\left|0\right>` state, other states can be
prepared by applying quantum gates.


prepare an arbitrary state
--------------------------


bath engineering
----------------

The disadvantage of the previous method is that applying quantum gates is costly.
Current quantum processor can only retain its quantumness for a short period of
time, which translates to a limited number of gates ().

quantum teleportation
---------------------

