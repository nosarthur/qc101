**************************
Quantum information theory
**************************

entropy as information measure
==============================

At high level, entropy measures the complexity of a system.
Specifically, complexity consists of two aspects

* diversity
* spread-out

Diversity is related to the number of possible outcomes whereas spread-out is related to the likelihood of the outcomes. For example, uniform distribution is more spread-out than Gaussian distribution.

The term "system" deserves some clarification too.
Typically, it refers to a physical entity whose property can be observed in a repeated manner and statistics can be collected.
For example,

* a coin can be tossed repeatedly and the probability of getting head can be computed
* a particle can be traced over time and its probability of being at certain location and having certain velocity can be computed
* a group of quantum mechanical spins can be prepared in some initial state and their total spin can be measured after a fixed time span. This prepare-wait-measure procedure can be repeated many times to obtain the statistics of the total spin distribution.

Specifically, a system contains two parts

* state space
* probability distribution

State space is the set of all possible outcomes and probability distribution is the assignment of probability to each outcome.
Taking coin tossing for example, if we are interested in tossing one coin, then the state space is {H, T} where H denotes head and T denotes tail.
If we study two coins, then the state space is {HH, HT, TH, TT}.

Note that a larger state space does not guarantee a larger entropy.
Suppose the system of interest consists of two very biased coins.
Although there are 4 possible outcomes,
the "effective state space" contains close to 1 outcome, say HH.
On the other hand, if the system is a fair coin, there are 2 outcomes,
both of which occur often.
Thus intuitively, the complexity of the fair coin tossing should be bigger than the biased two-coin tossing.

In my opinion, entropy captures more or less this concept of "effective state space" cardinality.

a tale of two definitions
-------------------------

The confusion of entropy originates from its two definitions

.. math:: S \equiv \log \Gamma \\ S \equiv - \sum_i p_i \log p_i

Here :math:`S` is entropy, :math:`\Gamma` is the number of states (state space cardinality), and :math:`p_i` is the probability to be in state :math:`i`.
I also omit the Boltzmann constant :math:`k_B` to save typing (computer scientists do not include it either).
Note also that :math:`\Gamma` is not the `partition function <https://en.wikipedia.org/wiki/Partition_function_(statistical_mechanics)>`_.

definition 1
^^^^^^^^^^^^

The first definition is very intuitive.
It is the state space cardinality in logarithmic unit.
The choice of logarithm in the definition is due to two of its convenient properties:

* :math:`\log 1 = 0`: the system has 0 entropy if there is only 1 outcome
* :math:`\log mn = \log m + \log n`: entropy of independent subsystems can be added

This definition of entropy considers diversity but not spread-out.
It is thus a rough measure of complexity.
In information theory, it is called information capacity.
In physics, it is only used when all outcomes occur with equal probability, i.e., the so-called micro-canonical ensemble.

Although definition 1 is a simple definition to measure state space cardinality, it plays important role in both physics and information theory. 
In physics, it is related to what temperature is.
In information theory, it is related to how many bits are needed to store or transmit information.

Each computer bit has two states, 0 and 1.
Thus one bit is enough to store the result of a coin tossing, i.e., :math:`\log_2 2 = 1`.
With two coins, the number of bits needed is :math:`\log_2 2\times2 = 2`.
Thus entropy has the concrete meaning of number of bits needed to store the observation outcomes.

definition 2
^^^^^^^^^^^^

The second definition includes both the diversity and the spread-out.

Admittedly, the formula looks a little strange.
Let's go over an example of coin tossing to see how to transition from definition 1 to definition 2.

Suppose we have a coin whose head and tail probabilities are :math:`p_H` and :math:`p_T`, with :math:`p_H+p_T=1`.
The essence of definition 1 is state counting.
To reconcile state counting with probability distributions,
we need to generalize the state space: instead of tossing the coin once and using {H, T} as state space,
we can toss it :math:`N` times and the state space expands to :math:`\Gamma=2^N` outcomes.

With :math:`N` approaches infinity, the number of heads approaches :math:`N_H=p_HN`
and there are :math:`C(N, N_H)` ways to achieve that, where :math:`C(n,k)` is the
`n-choose-k function <https://en.wikipedia.org/wiki/Binomial_coefficient>`_.
Thus the entropy can be defined as

.. math:: S = \lim_{N\rightarrow\infty}\frac{\log_2 C(N,N_H)}{N}

Here the numerator is in the form of definition 1, but is extended to :math:`N` observations such that probability distribution can be taken into account.
The :math:`N` in the denominator is for normalization purpose since the numerator obviously increases with :math:`N`.
It can be seen as :math:`\log_2 2^N` which is the information capacity of tossing :math:`N` coins.

.. _Stirling's approximation: https://en.wikipedia.org/wiki/Stirling's_approximation
.. _Helmholtz free energy: https://en.wikipedia.org/wiki/Helmholtz_free_energy

Using `Stirling's approximation`_

.. math:: N!\simeq N\log N -N + O(\log N)

we end up with the `binary entropy function <https://en.wikipedia.org/wiki/Binary_entropy_function>`_

.. math:: S = -p_H\log p_H - p_T\log p_T

I also stole a plot from wikipedia in Figure 1, where the vertical axis can be seen as :math:`S(p_H)` and horizontal axis as :math:`p_H`.
Note that it achieves its maximum of 1 when the coin is fair and drops to 0 when the coin is fully biased.

.. image:: https://upload.wikimedia.org/wikipedia/commons/2/22/Binary_entropy_plot.svg

In my impression, physicists are less concerned with entropy than with other thermodynamic quantities because

* it is usually not experimentally measurable
* it is tricky to calculate
* it is less useful than `Helmholtz free energy`_ (could be my bias)

On the other hand, entropy (in definition 2) has concrete meaning in information theory.
It is called the information content,
which is the minimum average capacity to store information (recall the effective state space cardinality!).
It is essential in applications like data compression, encoding, etc.

For example, if the coin tossing always gives head, we don't need to store any information of the outcome or transmit it over a communication channel,
which matches up with its 0 entropy.
If the coin is biased to head with :math:`p_H=0.999` and we toss it 1000 times.
Instead of recording the outcomes of the 1000 tosses as :math:`HTTH\ldots HH` which requires 1000 bits,
we can record only the indices of the tosses with tail outcome.
On average there is only 1 index to record thus it only costs :math:`\log_2 1000 \simeq 10` bits.
Dividing this 10 by the number of tosses 1000, we basically get the entropy of this biased coin.



