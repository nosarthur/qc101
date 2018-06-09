*******************************
Quantum mechanics in a Nutshell
*******************************

The precursor of quantum mechanics, known as classical mechanics,
is a deterministic theory. Time evolution is described by differential
equations such as Newton's second law

.. math:: \mathbf F = m \mathbf a \equiv m \frac{d^2}{dt^2}\mathbf x

where :math:`\mathbf F` is force, :math:`m` is mass, :math:`\mathbf a` is
acceleration, and :math:`\mathbf x` is position of an object of interest, say
a projectile.
Given initial conditions of position and velocity, one can calculate the object's
position at any future time (or even past time).

Although classical mechanics is a successful theory to describe 'big' (the physicists' jargon is macroscopic) objects,
its prediction often fails on 'small' (microscopic) objects such as molecules and atoms.
With the effort of many physicists, quantum mechanics was established in early 20'th century.
It is intrinsically a probabilistic theory and is considered bizarre even by the experts.
Yet it is a successful theory that seems to have no reported failures on experimental observations.

Overall, its difference from classical mechanics can be summarized as follows

#. State space could be finite.
#. Superposition of different states is allowed.
#. Measurement collapses superposition.
#. Dynamics (i.e., transitions between possible states) is probabilistic.

To be concrete, I will use atom as the prototypical quantum object.

.. note::
    The scope of the chapter includes what quantum mechanics is like and how it
    differs from classical probability theory and stochastic process. I won't explain
    why it works (does such explanation exists?) or how it was discovered historically.

absorption spectrum
===================

To illustrate the first difference, let's revisit
:wiki:`Newton's prism experiment originally recorded in the 17'th century <Prism>`,
where a beam of white :wiki:`sunlight` passes through a prism and becomes a rainbow of colors,
see :numref:`prism-refraction`.
From classical optics, we know that light is a wave phenomenon and its color is determined by the wave's wavelength
(or equivalently, its frequency, the speed of light is the same for light of all colors
and the light speed is equal to the product of its wavelength and frequency).
For example, red light has frequency about 700 nm (460THz),
and blue light has frequency about 470 nm (640THz).

.. _prism-refraction:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/f/f5/Light_dispersion_conceptual_waves.gif

   Newton's prism experiment.

This simple refraction experiment contains the basic idea of :wiki:`spectroscopy`.
The plot of light intensity versus light wavelength (or frequency) is called spectrum.
An example of the sunlight spectrum is shown in :numref:`solar-spectrum`.

.. _solar-spectrum:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/b/b5/Spectrum_of_blue_sky.svg

   Solar spectrum. The absorption lines are denoted by arrows.

Interestingly, the overall shape of this spectrum reveals the temperature of the Sun.
There is a formula relating the light intensity to the light frequency and the temperature of the object,
proposed by :wiki:`Max Plank` in 1900 and known as :wiki:`Plank's law`.
It can also be used to estimate the temperature of a light bulb, or human body.
In fact, the derivation of Plank's law requires quantum mechanics,
and it is one of the pioneering work to demonstrate the validity of quantum mechanics.
Classical physics gives a non-sensible result in this case,
commonly known as the :wiki:`ultraviolet catastrophe` of :wiki:`black-body radiation` (here black-body simply means a hot object).
It predicts that the light intensity approaches infinite at high frequency, for any temperature of the object.

I will not explain Plank's law here. Instead I would like to draw your attention
to some ugly dips in the sunlight spectrum, as denoted by arrows in :numref:`solar-spectrum`.
These dips are known as :wiki:`Fraunhofer lines`.
A different view of them is shown in :numref:`Fraunhofer-lines`.
What happens here is that some of the light is absorbed by various atoms and molecules in the Sun's atmosphere
(actually for stars, it's called :wiki:`photosphere`),
causing deviations to Plank's formula.
Interestingly, these absorption lines happens at special frequencies.
In fact, they are characteristic of the material.
For example, the lines for iron and the lines of oxygen molecules look nothing like each other.
Thus by looking at these lines, we can deduce the composition of the Sun and even their abundance.

.. _Fraunhofer-lines:
.. figure:: https://upload.wikimedia.org/wikipedia/commons/2/2f/Fraunhofer_lines.svg

   Solar spectrum with Fraunhofer lines.

But what does it mean that iron (or any other atoms or molecules) has multiple absorption lines?
One hypothesis could be that iron atom has multiple states and each state corresponds to one particular line.
This is actually not too far from the full story.
It was puzzling to the 19'th century classical physicists how an atom could only be in a finite number of states.
By that time, physicists already knew that atoms are made of nucleus with positive charge and electrons with negative charge.
If one makes the analogy that nucleus is the Sun, an electron is a planet,
and the attractive force between positive and negative charges plays the role of
gravitational attraction, it is unclear why only a finite number of stable orbits exist.
Again the full explanation require quantum mechanics.

.. seealso::
   Spectroscopy is likely the most important experimental technique in modern science.


I don't known any convincing explanation about why microscopic objects often assume discrete states.
For example, these atomic states are not energy minimums of some cost function.
However, the evidence of them are quite strong, thus a successful theory has to incorporate them.
As a result, quantum theory is bizarre.

   All models are wrong; some are useful. --- :wiki:`George E. P. Box`

.. seealso::

   The discovery of quantum mechanics is quite interesting.
   At the end of 19'th century, only a handful experiments cannot be explained by
   classical physics.


analogy of coin tossing
=======================

Quantum mechanics is intrinsically a probabilistic theory,
that is, if one repeats an experimental procedure in an idealized situation
(no human mistake, no machine error, no noise) with a measurement at the end,
the measurement results could still differ from different trials.
At a superficial level, it is similar to probability theory where some information is not available.

The simplest quantum system has two states and the classical analogy is a coin with two sides.
A coin toss has two outcomes: head and tail, and is represented by :wiki:`Bernoulli distribution`:

.. math:: \mathbf p = \begin{bmatrix} p_H \\ p_T \end{bmatrix}, \text{ with } p_H + p_T = 1.

Each coin toss has two outcomes and their probabilities can be described by a two-component vector :math:`\mathbf p`.
For example, fair coins have

.. math:: \mathbf p = \begin{bmatrix} 0.5 \\ 0.5 \end{bmatrix}

Given such probability vectors, we can easily describe the tossing of the same coin many times,
or more generally, the tossing of many coins with different biases.
Take two coins for example, the outcome probability is given by the :wiki:`tensor product` of the individual probability vectors, i.e.,

.. math:: \mathbf p = \mathbf p_1 \otimes \mathbf p_2 \equiv \begin{bmatrix} p_{1H}\mathbf p_2 \\ p_{1T}\mathbf p_2 \end{bmatrix} = \begin{bmatrix} p_{1H}p_{2H} \\ p_{1H}p_{2T} \\ p_{1T}p_{2H} \\ p_{1T}p_{2T} \end{bmatrix}

With :math:`n` different coins, there are :math:`2^n` possible states.
However, the probabilities can be calculated from :math:`2n` numbers.
This is the product rule of probability since we assume the coin tosses are independent events.

To make the situation more complicated, there are two ways to go:

1. make the coin tosses dependent events: maybe they hit each other as they are tossed (instead of being tossed one by one)
#. make the probability distribution time-dependent: maybe they are being deformed as they are tossed

The first complication breaks the product rule and we have to assign one probability to each outcome.
In the two-coin example,

.. math:: \mathbf p = \begin{bmatrix} p_{1H,2H} \\ p_{1H,2T} \\ p_{1T,2H} \\ p_{1T,2T} \end{bmatrix}

and no decomposition is possible anymore.

The second complication adds dynamics to the probabilities distributions.
The simplest description one can give may be the :wiki:`Kolmogorov equation <Master_equation>`:

:math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`

where :math:`R` is a :wiki:`transition rate matrix <Transition_rate_matrix>`.


For simplicity, let's assume that :math:`R` is time-independent.
Then we have a formal solution

:math:`\mathbf p(t) = e^{Rt}\mathbf p(0).`

'quantum' coin tossing
======================

If we magically force a coin to obey quantum mechanics,
some of its behavior would appear identical to the classical coin.
For example, if we 'toss' the quantum coin, there will still be only two outcomes, head or tail,
just like the classical coin.
This 'quantum' coin tossing is called :wiki:`von Neumann measurement <Wave_function_collapse>` in quantum mechanics,
which is the equivalent of drawing one sample from a probability distribution.
If we toss many quantum coins with identical states, the outcomes of head or tail also follow Bernoulli distribution.

Before we proceed to the difference between quantum coin and classical coin,
let's first prepare ourselves with the notation for describe quantum states,
i.e., the Dirac notation.

Dirac notation
--------------

The state of the quantum coin is described by a 2D complex vector

.. math:: \left|\psi\right> = c_H\left|H\right> + c_T\left|T\right>
   :label: quantum-coin

where :math:`c_H, c_T\in \mathbb{C}` and they are called probability amplitudes.
Here :math:`\left|H\right>` and :math:`\left|T\right>` are called basis states,
and :math:`\left|\psi\right>` is known as the :wiki:`wave function`.

If we tossing the quantum coin many times, the probabilities to get head or tail are
given by :math:`\|c_H\|^2` and :math:`\|c_T\|^2`.
And we have the normalization :math:`\|c_H\|^2 + \|c_T\|^2 = 1`.

Here the half bracket notation is called the :wiki:`Dirac notation<Bra-ket_notation>`.
In this example, they correspond to 2D vectors:

.. math:: \left|H\right> = \begin{bmatrix} 1 \\ 0\end{bmatrix}, 
          \left|T\right> = \begin{bmatrix} 0 \\ 1\end{bmatrix}, 
          \left|\psi\right> \equiv \mathbf c = \begin{bmatrix} c_H \\ c_T\end{bmatrix}. 

These states with right bracket are called ket(s).
:wiki:`Paul Dirac` also defined the complex conjugate of these vectors

.. math:: \left<\psi\right| \equiv \mathbf c^\dagger = \begin{bmatrix} c_H^* & c_T^*\end{bmatrix}. 

Such states with left bracket are called bra(s).
And overall Dirac notation is also called bra-ket notation.
With this notation, probability normalization can be written succinctly as

.. math:: \left<\psi|\psi\right> = 1

One could argue that it is not really more convenient than :math:`\mathbf c^\dagger \mathbf c=1`,
which I agree.
I think its power is slightly more evident when there are uncountable infinite possible states.
In the end, it is just a notation that physicists are used to.

For multiple quantum coins, their state vector is also tensor product of the individual ones.
Take the two coin case for example,

.. math:: \left|\psi\right> = \left|\psi_1\right> \otimes \left|\psi_2\right> = 
          \begin{bmatrix} c_{1H}\mathbf c_2 \\ c_{1T}\mathbf c_2 \end{bmatrix}
          = \begin{bmatrix} c_{1H}c_{2H} \\c_{1H}c_{2T} \\ c_{1T}c_{2H} \\ c_{1T}c_{2T} \end{bmatrix}

Again, if the two quantum coins are somehow coupled together,
such decomposition is not possible,

.. math::  \left|\psi\right> =
           \begin{bmatrix} c_{1H, 1T} \\ c_{1H,2T} \\ c_{1T,2H} \\ c_{1T,2T} \end{bmatrix}

If we go back to the absorption spectrum example, :math:`\left|\psi_1\right> \otimes \left|\psi_2\right>`
represent two atoms, each of which has two internal states.
Thus at most two absorption lines can be observed.
On the other hand, the state of coupled coins could also model an atom with four internal states.
In that case at most :math:`C(4, 2)=6` absorption lines can be observed.

Now if we identify :math:`p_i = c_i^*c_i`, then it appears the quantum case maps to the classical case exactly.
And it seems unnecessary to use complex numbers instead of real numbers.
This superficial similarity will be examined more closely in the following sections.

superposition principle and quantum measurement
-----------------------------------------------

Before going to the time evolution of quantum mechanics, let me first reveal the
differences between classical probability theory and quantum mechanics in static situations.

The analogy between probability theory and quantum mechanics is summarized in :numref:`qm-prob`.
Both the :wiki:`superposition principle` and von Neumann measurement differ from
their probabilistic counterpart at fundamental level.

.. _qm-prob:
.. table:: Analogy between probability theory and quantum mechanics.

    ==================================  ========================
    probability theory                  quantum mechanics
    ==================================  ========================
    multiple possible states            superposition principle
    drawing sample from a distribution  von Neumann measurement
    ==================================  ========================

The peculiarities of the superposition principle are

#. Different states can be linearly superimposed.
#. The coefficients of such superposition are complex numbers.

In probability theory, statistics, or ensemble average, is calculated as

.. math:: \left<f\right>\equiv \sum_i p_i f_i
    :label: avg-classical

where :math:`f_i` is some numerical value assigned to the state.
For example, we can assign :math:`f` to :math:`1` for head, and :math:`-1` for tail.

In the same spirit, a quantum ensemble average could take the same form

.. math:: \left<\psi\right|f \left|\psi\right>= \sum_i p_i f_i = \sum_i c_i^* f_i c_i
    :label: avg-semi-qm

The acute reader may find Eq. :eq:`avg-semi-qm` puzzling.
In the coin example, :math:`\left|\psi\right>` is a 2-by-1 vector,
thus it appears that :math:`f` should be a 2-by-2 matrix.
This is indeed true. Since I use capital letters to denote matrix, the quantum
ensemble average should take the form of

.. math:: \left<\psi\right|F \left|\psi\right>= \sum_{ij} c_i^* F_{ij} c_j
    :label: avg-qm

where :math:`F_{ii}` may correspond to :math:`f_i`.
But what is the meaning of the off diagonal terms :math:`F_{ij}`?
Actually they don't have classical correspondence in probability theory.
They are put in there to model :wiki:`wave interference`, which takes care of
the discrepancy to the predictions of classical mechanics.
It is an intrinsic nature of quantum mechanics (note that quantum mechanics is
also known as wave mechanics and the state vector is known as wave function).

**These off-diagonal terms together with the** :math:`c_i` **being complex numbers
provide more degrees of freedom to explain experimental observations that deviate
from classical expectations in** Eq. :eq:`avg-classical`.
Note that I didn't explain why the quantum ensemble takes the form of Eq. :eq:`avg-qm`.
In fact, I don't know any high-level plausible ideas why it should be,
except that the formalism works.

There is controversy of whether complex numbers are physical
(i.e., whether they can be measured from an experiment) or they are only
mental constructions to simplify notations (I tend to take the latter view).
For the sake of argument, let's assume that measurement can only yield real numbers.
This requirement puts on extra constraint on the form of :math:`F` since
:math:`\left<\psi\right|F \left|\psi\right>` has to be real for any vector :math:`\left|\psi\right>`.
The qualified class is called :wiki:`Hermitian matrix`.

As a summary, the main difference introduced in the :wiki:`superposition principle` is the
off-diagonal terms in the observation, which models interference.

Measurement in quantum mechanics is radically different:
**after a quantum coin toss, the coin's probability amplitude (thus probability distribution) changes**.

Suppose the coin is in state of Eq. :eq:`quantum-coin` before the measurement.
After the measurement, its state changes to either :math:`\left|H\right>` or :math:`\left|T\right>` with the corresponding probability.
Any subsequent measurement gives deterministic result.
In other words, tossing the same quantum coin multiple times doesn't work because
the quantum coin is not the same after a toss (unless it's in one of the basis states to start with).
This phenomenon is known as :wiki:`wave function collapse`.
In our analogy, we could also call it probability distribution collapse.

On the other hand, if we toss an ensemble of quantum coins with identical state
(i.e., probability amplitude or probability distribution), we will observe the same head and tail counts as in probability theory.
In general, if we want to observe some physical quantity as in Eq. :eq:`avg-qm`,
an ensemble of quantum states is needed.
This ensemble can be generated either by repeatedly preparing and measuring the same quantum object,
or preparing the same state for many quantum objects and measuring them.


dynamics
--------

There are two 

* von Neumann measurement
* time evolution

the mathematics to describe the coin will change quite dramatically.



.. math:: i\frac{d}{dt}\mathbf{c}(t)=H \mathbf{c}(t)

Similar to the classical case, in the case when :math:`H` is time independent,
Schrodinger equation has explicit solution

.. math:: \mathbf c(t)=e^{-iHt}\mathbf c(0)

In general, the solution can be very complicated when the Hamiltonian is time dependent.

.. math:: \mathbf c(t)=U(t)\mathbf c(0)

where :math:`U(t)` absorbs all the complications in it and is simply called the time evolution.

Probability conservation :math:`\mathbf c^\dagger \mathbf c=1` puts on requirement on the time evolution matrix

.. math:: U^\dagger U = 1

This type of matrices are called :wiki:`unitary matrix`.

The simplest time-dependent Hamiltonian may be one that is piecewise constant.
Suppose during time interval :math:`\Delta t_i`, the Hamiltonian is :math:`H_i`,
then we have

.. math:: U(t) = \Pi_i e^{-iH_i\Delta t_i} = e^{-iH_1\Delta t_1}e^{-iH_2\Delta t_2}\cdots

This is a common scheme to build time evolution out of a handful Hamiltonians.
Here the control variables are the ordering of the available Hamiltonians and their time intervals.



A side-by-side comparison of quantum mechanics and stochastic processes is shown in :numref:`qm-stochastic`.

.. _qm-stochastic:
.. table:: Comparison of stochastic process and quantum mechanics.
    Here :math:`R` and :math:`H` are assumed to be time-independent to allow simple solutions.

    +---------------+--------------------------------------------------+-------------------------------------------------------------+
    |               | stochastic process                               |     quantum mechanics                                       |
    +===============+==================================================+=============================================================+
    |state vector   |  probabilities  :math:`\mathbf p`                | probability amplitudes :math:`\mathbf c`                    |
    +---------------+--------------------------------------------------+-------------------------------------------------------------+
    |normailization |      :math:`\|\mathbf p\|_1 = 1`                 | :math:`\mathbf c^\dagger \mathbf c   =1`                    |
    +---------------+--------------------------------------------------+-------------------------------------------------------------+
    |               | :wiki:`Kolmogorov equation <Master_equation>`    | :wiki:`Schrödinger equation <Schr%C3%B6dinger_equation>`    |
    |dynamics       |  :math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`|      :math:`i\frac{d}{dt}\mathbf{c}(t)=H \mathbf{c}(t)`     |
    +---------------+--------------------------------------------------+-------------------------------------------------------------+
    |solution       |:math:`\mathbf p(t) = e^{Rt}\mathbf p(0)`         |:math:`\mathbf c(t)=e^{-iHt}\mathbf c(0)`                    |
    +---------------+--------------------------------------------------+-------------------------------------------------------------+





