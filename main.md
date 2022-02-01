---
# Bibliography
csl: rsc/library/style.csl # See https://www.zotero.org/styles for more styles.
bibliography: rsc/library/references.json

title: 'Regression and Artificial Intelligence'

authors:
    - Raphael Heiberger:
        institute: stuttgart
        email: raphael.heiberger@sowi.uni-stuttgart.de
        correspondence: yes
    - Lukas Erhard:
        institute: stuttgart
        email: lukas.erhard@sowi.uni-stuttgart.de
institutes:
    stuttgart: University of Stuttgart, Seidenstraße 36, 70714 Stuttgart, Germany

date: \today

abstract: 'Hier Vorgang ihm als reiße. Ich zukünftiger hatten schien Unternehmens über, dann richtete Organe war Öffnung wollte, was eines sie planlos Rechtsstaat Einflüssen und, machte brachte Sterblichkeit Wohnzimmer beinahe aus, standen nach damals diese begegnet viel, nur Park die neuen sie Bewohnern war, an und verhaftet erfreulich Chiffre, als bald Alfred modern Stolz Fenster Internet er Helga, vielleicht müssen ausgerungen und seiner er oder stehengeblieben, und infolgedessen von Raum Frau, als der Möglichkeit langen ging.'

keywords: 'regression, artifical intelligence, machine learning'

titlepage: true
toc: false # Table of contents

---

# Introduction

The research in the social sciences has been shifting towards a new era.
In the prior century, the focus laid mainly on variable based, theory and hypothesis driven approaches to give answers to societal questions, the availability of more and more data opens possibilities and creates the need for new forms of analysis.
While classical social science, as practiced since the second half of the last century, is based on a set of well-defined and elaborated rules, the emergence of ever new datasets create the need (and possibility) to approach questions in a new way [@mcfarland:SociologyEraBig.2016].

In this chapter, we will give an overview over some of the new methods, compare them to the approaches used in the 'classical' social social sciences, and point out some key differences and commonalities.
To do this, we will first go into detail on some theoretical basis and show the differences in approach on a practical example with an exemplary analysis on ESS Data [@essround9:EuropeanSocialSurvey.2019].


# Knowledge Acquisition in the Social Sciences

The rising popularity of survey methods in the 1930s and 40s established a new era in the social sciences.
This era was accompanied by new opportunities and the idea of inferential statistics made its way into the social sciences.
It describes a way of generating knowledge about a small part of a population and generalizing this to its entirety [@krzywinski:ImportanceBeingUncertain.2013].

## Inferential statistics

Especially Karl Popper formalized the social sciences in the 1950s as founded on strong theories that are falsifiable \todo{CITE}.
The idea of testing theory-based assumptions plays very well with the concept of inferential statistics.
We can calculate the probabilty of being wrong and define threshholds upon which we accept or reject our assumptions.

Since then, the linear model has become ubiquotous [@abbott:TranscendingGeneralLinear.1988].
Questions around model _validity_ became central for the upcoming new methods.


This approach, however, bears some shortcomings:

1. What if your sample size is large?
    Many of the frequentist approaches are very prone to large sample sizes (e.g., all the chi-squared based test-statistics).
    Testing for significance with very large sample sizes will almost always generate significant results, rendering those tests useless.

2. What if your sample is not independent and identically distributed? <!--% prozessgeneriert -->
    Many new datasets do not oblige to the rules for classical hypothesis testing

3. What if you have data about the entire population? <!--%all tweets, news articles, users of a platform etc. --> Then, running tests for significance becomes completely irrelevant.

4. What if you have no theory, you can derive hypothesis from? This is especially important for social media networks, where the rules of engagement might differ quite substantially from 'normal' social behaviour or where you cannot specify your population.

## Machine Learning


<!--% transcript of McFarland, p. 20 -- rewrite, but basically this:-->
See @mcfarland:SociologyEraBig.2016:

In internet companies there are large assortments of engineers focused solely on improving prediction. For example, a company may have many records on their website’s usage, such as information on clicks, site referrals, posted texts, network positions, as well as time spent on each page, purchasing behavior, and product quality ratings. Most companies ask their engineers to take these data and develop models informing the company when a customer service effort, advertisement, or search result will lead users to purchase more goods, stay on the site longer, or otherwise become an ideal consumer. The engineer typically approaches this problem without any concern for theory and instead applies machine learning (Alpaydin 2004; Bishop 2007).Footnote 6 This proceeds when the engineer takes, say, half the collected data (the “training set”) and identifies a variety of user actions (and their timing) most associated with a desired outcome. In effect, the engineer trains a logit model on an outcome of interest and throws as many features (variables) as possible at it in order to develop highly predictive weights. Then the engineer utilizes these weights to create an algorithm and assesses whether it can accurately predict the desired outcome in the remaining data that were not used for training (the “test set”). When the algorithm reaches certain levels of accuracy, the engineer can use it to determine which users need a “push” so as to proceed in desired directions.

Machine learning is a powerful tool that has assisted companies in many domains with various engineering questions (Talley et al. 2011). In fact, machine learning is the foundation of machine translation: for instance, how Chinese is accurately translated into English. The algorithm proceeds by merely identifying common word sequences across verified translations, and as the “training set” of known translations grows, so does the probability of accurately “predicting” word associations in “test sets” of future text. The “theory” is nothing more than probabilities of word associations as identified by many known translations. There is no linguistic theory of how a language or translation works (in fact, theories are notoriously inaccurate at translation). All that is desired is an accurate translation—utility is paramount, while understanding and explanation are superfluous.

When the machine learning approach is combined with theory and scientific research it can lead to surprising results. The atheoretical perspective of machine learning can reveal patterns a theory did not predict or a new way to formulate the theory that perhaps the analyst had overlooked. However, machine learning on its own (and by design) results in little to no understanding if there is no effort to derive a theory or explanation. In sum, the use of machine learning is atheoretical, but it is potentially powerful when used as an agnostic search for potential explanations. In contrast, theory is a somewhat narrow-minded but powerful tool in that it is a focusing device that identifies which constructs are to be selected and formed from the millions of possible variables (or features) and it afford potential explanations for how features interrelate. As such, the iterative combination of atheoretical induction and theory-led deduction can be quite powerful.
<!--% copy paste McFarland Ende.-->


## How does ML compare to classical approaches?

Many of the algorithms are the same, but the mindset and evaluation strategies differ.

In contrast to frequentist models, ML models usually do not have any usable, that is interpretable, coefficients.
Model evaluation rather works by evaluating its predictive power.

Compare:
- Logistic regression
- PCA vs Factor analysis

# Comparison by example: Immigration in Europe