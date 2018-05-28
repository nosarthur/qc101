*******************************
Quantum mechanics in a Nutshell
*******************************

.. _Bernoulli distribution: https://en.wikipedia.org/wiki/Bernoulli_distribution
.. _binomial distribution: https://en.wikipedia.org/wiki/Binomial_distribution

This chapter is about the physics background needed for the whole document.
Fortunately, as long as we do not worry about hardware implementations (superconducting circuits, quantum optics, nuclear magnetic resonance, etc), not much physics knowledge is needed.

Specifically, the shortcuts we take include

1. Only :wiki:`quantum two level systems, i.e., qubits <Qubit>`, are considered.
#. Coin tossing is used as analogy/comparison for qubit measurements.
#. All unitary operations are assumed to be efficiently implementable on hardware.
#. :wiki:`Decoherence <Quantum_decoherence>` does not exist, i.e., all quantum gates have perfect fidelities and all quantum states do not degrade.


Quantum mechanics in a nutshell
===============================

The predecessor of quantum mechanics is called :wiki:`classical mechanics <Classical_mechanics>`, which was developed between 17th and 19th century.
Here the word ':wiki:`mechanics <Mechanics>`' refers to the time evolution of things.
Beside some formality put in by :wiki:`Lagrange <Joseph-Louis_Lagrange>` and :wiki:`Sir Hamilton <William_Rowan_Hamilton>`,
classical mechanics is essentially :wiki:`Sir Newton <Isaac_Newton>`'s second law:


Overall, classical mechanics excels at describing phenomena of our daily experience, but fails at

* very small things such as molecules and atoms
* very cold things even if they are big

One good example is :wiki:`the double-slit experiment <Double-slit_experiment>`, shown in :numref:`double-slit`.
Here we throw electrons to the middle wall with two slits and observe their landing locations on the back screen.
If electrons were to follow classical trajectories, we would observe two landing stripes right behind the slits.
However, we see the same :wiki:`interference pattern <Interference_(wave_propagation)>` as in optics, i.e., electrons are like waves.

On the other hand, electrons also behave like particles.
For example, if we keep lowering the intensity of the :wiki:`electron beam gun <Electron_gun>`,
we can observe the landing of each electron on the back screen.

.. _double-slit:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/c/cd/Double-slit.svg

   Double-split experiment of electrons.

This strange property of electrons, known as :wiki:`wave-particle duality <Wave–particle_duality>`, is common to small things.

There is a :wiki:`correspondence principle <Correspondence_principle>`,
which states that under certain limit, predictions from quantum mechanics should approach result from classical mechanics.

.. seealso::
   There is some weirdness in the electron intereference. In optics, the standard 
   interpretation of the interference pattern is that the light beam going through
   the top slit interferes with the light beam going through the bottom slit.
   The electrons, however, can be thrown onto the middle wall one by one, and
   interference pattern is still observed. There are two equally crazy viewpoint
   on it: either each electron is interfering with itself in a parallel universe,
   or the two potential paths are interfering.

Historically quantum mechanics was motivated by a few experimental observations that cannot be explained with :wiki:`classical mechanics <Classical_mechanics>`.
The foundations of :wiki:`quantum mechanics <Quantum_mechanics>` was laid down between late 19th century and early 20th century by many famous scientists such :wiki:`Heisenberg <Werner_Heisenberg>`, :wiki:`Schrödinger <Erwin_Schrödinger>`, :wiki:`von Neumann <John_von_Neumann>`, :wiki:`Einstein <Albert_Einstein>`, :wiki:`Dirac <Paul_Dirac>`, :wiki:`Bohr <Niels_Bohr>` etc.

**In a very simplified view, measurement of some physical quantity on a big (and/or warm) object gives a continuous range of possible values but that on a small (and/or cold) object gives a few possible values.**
This is what the name 'quantum' refers to.
For example, the so-called :wiki:`rheostat <Potentiometer#Rheostat>` is an electric device of varying resistance by varying the length of some resistive material. Since length is a continuous variable, it appears that one can get any resistance by sliding the contact.

It is difficult theory because many of its features are beyond a person's daily experience.

Although quantum mechanics has a wider domain of applicability, it is not used when classical mechanics suffices.
This is because of its computation complexity increases rapidly as the number of objects under study (i.e., degrees of freedom) increases.

* probabilistic theory
* dynamics


