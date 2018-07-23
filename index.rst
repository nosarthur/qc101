.. QC101 documentation master file, created by
   sphinx-quickstart on Mon Feb 19 21:48:03 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Quantum computing 101 for non-physicists
----------------------------------------

.. warning::
   This is an unfinished draft.

Quantum computing has become a new buzzword nowadays.
Big tech companies are competing to bring quantum computing services to the market.
More and more startups are funded to to provide quantum computing solution
plans and develop devices.

* Oct.2017
    * `Microsoft released a preview of its quantum computing development kit <https://docs.microsoft.com/en-us/quantum/?view=qsharp-preview>`_
    * `Intel announced 17-qubit processor <https://newsroom.intel.com/news/intel-delivers-17-qubit-superconducting-chip-advanced-packaging-qutech/>`_
    * `IBM demonstrated simulation of 56 qubits on classical computer with 3TB memory cost <https://www.ibm.com/blogs/research/2017/10/quantum-computing-barrier/>`_
    * `Google announced an open source chemistry package called OpenFermion <https://research.googleblog.com/2017/10/announcing-openfermion-open-source.html>`_
* Nov.2017
    * `IBM announced 20-qubit processor for clients and 50-qubit prototype <https://www-03.ibm.com/press/us/en/pressrelease/53374.wss>`_
* Jan.2018
    * `Intel announced 49-qubit processor <https://newsroom.intel.com/news/intel-advances-quantum-neuromorphic-computing-research/>`_
* Mar.2018
    * `Google announced the new Bristlecone quantum processor with 72 qubits <https://ai.googleblog.com/2018/03/a-preview-of-bristlecone-googles-new.html>`_
* Jun.2081
    * `IBM released ACQUA (Algorithms and Circuits for QUantum Applications) library <https://www.ibm.com/blogs/research/2018/06/domain-experts-qiskit-acqua/>`_
* Jul.2018
    * `Google released an open source framework for NISQ algorithms <https://ai.googleblog.com/2018/07/announcing-cirq-open-source-framework.html>`_

Despite the breaking news, quantum computing is mysterious because its
prerequisites, quantum mechanics and computing theory, are only known by the experts.
And most online learning materials are written for physics majors.

The purpose of this book is to introduce quantum computing to non-physicists.
If the quantum computing field is a state park, then this book describes one
trail that shows the rough landscape.

What this book doesn't do:

* It doesn't teach quantum mechanics.
* It doesn't include physical implementations of quantum computation.

The maths are kept easy and analogies/comparisons are often used.
The reader is assumed to know linear algebra and probability theory.
Specifically, the following equations should look familiar

* :math:`\mathbf f = m\mathbf a`
* :math:`\frac{d}{dt}\mathbf p = R\mathbf p`
* :math:`A \mathbf x = \lambda \mathbf x`
* :math:`e^{i\theta} = \cos\theta + i\sin\theta`

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
   state-prep
   readout
   algo
   obstacles
   next
