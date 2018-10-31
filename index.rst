.. QC101 documentation master file, created by
   sphinx-quickstart on Mon Feb 19 21:48:03 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Quantum computing 101 for non-physicists
----------------------------------------

.. warning::
   This is an unfinished draft.

Quantum computing has become a buzzword nowadays.
Both big tech companies and startups are competing to bring quantum computing
services to the market.
Despite the increasing R&D effort in industry and academia, quantum computing
is mysterious because both
quantum mechanics and computing theory are lesser-known topics.
And most online materials are written for physics majors.

The purpose of this book is to introduce quantum computing to non-physicists.
I try to focus on the principles and ideas to the best of my knowledge, and not
get trapped too much in detailed calculations.
If the quantum computing field is a state park, then this book is a map of a
trail.

The maths are kept easy and analogies/comparisons are often used.
The reader is assumed to know linear algebra and probability theory.
Specifically, the following equations should look familiar

* :math:`\mathbf f = m\mathbf a`
* :math:`\frac{d}{dt}\mathbf p = R\mathbf p`
* :math:`A \mathbf x = \lambda \mathbf x`
* :math:`e^{i\theta} = \cos\theta + i\sin\theta`

What this book doesn't do:

* It doesn't teach quantum mechanics systematically.
* It doesn't describe physical implementations of quantum computers.

As for notation, I use upper case letter for matrix,
bold and lower case letter for vector, and lower case letter for scalars.
For simplicity, :wiki:`Planck constant` is omitted in all formulas.

.. note::
   I use these boxes to give heads up.

.. seealso::
   I use these boxes for optional materials.

The book should be read in linear order.

While preparing the materials, I follow several principles to keep my sanity

* Concise is better than verbose.
* Concrete is better than abstract.
* Goal-oriented is better than rambling.
* Comprehensive is better than referencing.

Please email me if you find errors, or have comments and suggestions.
Feel free to create pull requests on GitHub with revision too.

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   overview
   qm-nutshell
   qubit
   entanglement
   gate-and-circuit
   prep
   readout
   algo
   obstacles
   next
   news
