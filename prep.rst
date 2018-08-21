*****************
State preparation
*****************


preprare the :math:`\left|0\right>` state
-----------------------------------------

Most quantum algorithms assume the initial state to be :math:`\left|0\right>^{\otimes n}`,
i.e., all qubits are in the :math:`\left|0\right>` state.
But how do we prepare the qubits in that state?

State prepration is strongly tied to the physical implementation.
For different systems, the qubit states :math:`\left|0\right>` and :math:`\left|1\right>`
mean different things.
For simplicity, let's assume that they corresponds to the ground state and some
excited state of a physical system.
In this case, an easy but potentially expensive way to prepare the :math:`\left|0\right>`
state is to cool the qubit towards :wiki:`absolute zero`, i.e., -273.15 degree Celsius.

20mK :wiki:`dilution refrigerator`


prepare arbitrary state
-----------------------

After getting a high quality :math:`\left|0\right>` state, other states can be
prepared by applying quantum gates.

In practice, this approach has its limitations because

bath engineering

The disadvantage of the previous method is that applying quantum gates is costly.
Current quantum processor can only retain its quantumness for a short period of
time, which translates to a limited number of gates ().

Due to the :wiki:`no-cloning theorem`
It is impossible to copy an unknown quantum state.


quantum teleportation can be seen as state preparation.
