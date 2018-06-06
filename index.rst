.. QC101 documentation master file, created by
   sphinx-quickstart on Mon Feb 19 21:48:03 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Quantum computing 101 for non-physicists
----------------------------------------

This is a gentle introduction to quantum computing for someone with technical background but not physics background.
Specifically, I hope to get the readers familiar with the jargons in this field.

Fortunately, as long as we do not worry about hardware implementations
(superconducting circuits, quantum optics, nuclear magnetic resonance, etc),
not much physics background is needed to get some sense of quantum computing.
The same thing is true for classical computing.
In fact, most computer scientists and programmers are not familiar with transistors, the basic building block of classical bit.

However, the reader is assumed to be familiar with

* linear algebra
* probability theory

Specifically, the following equations should look familar

* :math:`\mathbf f = m\mathbf a`
* :math:`\frac{d}{dt}\mathbf p = R\mathbf p`

It is not essential to remember what each symbol denotes,
as long as you are not afraid of differential equations.

As for notation, I use upper case letter for matrix,
bold and lower case letter for vector,
and lower case letter for scalars.
For notational simplicity, :wiki:`Planck constant` is ommited in all formulas.

The book should be read in linear order.

While preparing the materials, I follow the following principles to keep my sanity

* Concise is better than verbose.
* Concrete is better than abstract.
* Task-oriented is better than rambling.
* Comprehensive is better than referencing.

In my experience, making analogy is very helpful in learning new things.
Thus I will use it whenever possible.

Choices of the materials are biased to my interest.
Please email me if you find errors in the document: zhou.dong@gmail.com
or simply create a pull request on GitHub with your revision.


.. seealso::
   I will use these boxes to include information that is not essential to this
   document, but too interesting to dismiss.


.. toctree::
   :maxdepth: 2
   :caption: Contents:

   overview
   qm-nutshell
   qubit
   entanglement
   gate-and-circuit
   state-prep
   readout
   algo
   next
