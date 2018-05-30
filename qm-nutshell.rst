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

Overall, its difference from classical mechanics can be summarized as

#. Possible states are finite.
#. Superposition of different states is allowed.
#. Measurement collapses superposition.
#. Dynamics (i.e., transitions between possible states) is probabilistic.

absorption spectrum
-------------------

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

Interestingly, the overall shape of this spetrum reveals the temperature of the Sun.
There is a formula relating the light intensity to the light frequency and the temperature of the object,
proposed by :wiki:`Max Plank` in 1900 and known as :wiki:`Plank's law`.
It can also be used to estimate the temperature of a light bulb, or human body.
In fact, the derivation of Plank's law requires quantum mechanics,
and it is one of the pioneering work to demonstrate the validity of quantum mechanics.
Classical physics actually gives a non-sensible result in this case,
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
Thus by looking at these lines, we can tell the composition of the Sun and even their abundance.

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
gravitational attraction, it is still unclear why only a finite number of stable orbits can exist.
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
-----------------------

Quantum mechanics is intrinsically a probabilistic theory,
that is, if one repeats an experimental procedure in an idealized situation
(no human mistake, no machine error, no noise) with a measurement at the end,
the measurement results could still differ from different trials.
At a superficial level, it is similar to probability theory where some information is not available.


Each coin toss has two outcomes and their probabilities can be described by a two-component vector :math:`\mathbf p`.
For example, fair coins have

.. math:: \mathbf p = \begin{bmatrix} 0.5 \\ 0.5 \end{bmatrix}

Given such probability vectors, we can easily describe tossing of the same coin many times, or many coins with different biases.
We will focus on the second situation since it is more general.
Take two coins for example, the outcome probability is given by the `tensor product <https://en.wikipedia.org/wiki/Tensor_product>`_ of the individual probability vectors, i.e.,

.. math:: \mathbf p = \mathbf p_1 \otimes \mathbf p_2 \equiv \begin{bmatrix} p_{1H}\mathbf p_2 \\ p_{1T}\mathbf p_2 \end{bmatrix} = \begin{bmatrix} p_{1H}p_{2H} \\ p_{1H}p_{2T} \\ p_{1T}p_{2H} \\ p_{1T}p_{2T} \end{bmatrix}

With :math:`N` different coins, the probabilities can be calculated from :math:`2N` numbers.
This is the product rule of probability since we assume the coin tosses are independent events.

To make the situation more complicated, there are two ways to go:

1. make the coin tosses dependent events: maybe they hit each other as they are tossed (instead of being tossed one by one)
#. make the probability distribution time-dependent: maybe they are being deformed as they are tossed

The first complication breaks the product rule and we have to assign one probability to each outcome.
In the two-coin example,

.. math:: \mathbf p = \begin{bmatrix} p_{1H,2H} \\ p_{1H,2T} \\ p_{1T,2H} \\ p_{1T,2T} \end{bmatrix}

With :math:`N` coins, there are :math:`2^N` outcomes.

The second complication adds dynamics to the probabilities distributions.
The simplest description one can give may be the :wiki:`Kolmogorov equation <Master_equation>`:

:math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`

where :math:`R` is a :wiki:`transition rate matrix <Transition_rate_matrix>`.
For simplicity, let's assume that :math:`R` is time-independent.
Then we have a formal solution

:math:`\mathbf p(t) = e^{Rt}\mathbf p(0).`

The description of quantum systems and their dynamics are very similar to that of stochastic processes.
A side-by-side comparison of quantum mechanics and stochastic processes is shown in :numref:`qm-sp`.

.. _qm-sp:
.. table:: Comparison of stochastic process and quantum mechanics

    +------------+--------------------------------------------------+-------------------------------------------------------------+
    |            | stochastic process                               |     quantum mechanics                                       |
    +============+==================================================+=============================================================+
    |state vector|  probabilities  :math:`\mathbf p(t)`             | probability amplitudes :math:`\mathbf c(t)`                 |
    +------------+--------------------------------------------------+-------------------------------------------------------------+
    |            | :wiki:`Kolmogorov equation <Master_equation>`    | :wiki:`Schrödinger equation <Schr%C3%B6dinger_equation>`    |
    |dynamics    |  :math:`\frac{d}{dt}\mathbf{p}(t)=R\mathbf{p}(t)`|      :math:`i\frac{d}{dt}\mathbf{c}(t)=H \mathbf{c}(t)`     |
    +------------+--------------------------------------------------+-------------------------------------------------------------+
    |solution    |:math:`\mathbf p(t) = e^{Rt}\mathbf p(0)`         |:math:`\mathbf c(t)=e^{-iHt}\mathbf c(0)`                    |
    +------------+--------------------------------------------------+-------------------------------------------------------------+



In general, both :math:`R` and :math:`H` can be time-dependent and the solution can be very complicated.


Superposition principle and quantum measurement
-----------------------------------------------

:wiki:`superposition principle`


Schrodinger's cat


entanglement
============




There is essentially only one type of measurement in quantum mechanics: the so-called :wiki:`von Neumann measurement <>`,
which is the equivalent of drawing one sample from a probability distribution.

.. math:: \left<\psi\right| A \left|\psi\right>

quantum no-clone theorem
========================

It is impossible to copy an unknown quantum state.

:wiki:`no-clone theorem<No-cloning_theorem>`


