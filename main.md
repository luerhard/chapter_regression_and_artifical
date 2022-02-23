---
# Bibliography
csl: rsc/library/style.csl # See https://www.zotero.org/styles for more styles.
bibliography: rsc/library/references.json
csquotes: true

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
In the prior century, the focus laid mainly on variable based, theory and hypothesis driven approaches to give answers to societal questions.
Data for such approaches was scarce, hard to come by and very expensive [@grimmer:MachineLearningSocial.2021].
The availability of more and more data opens possibilities and creates the need for new forms of analyses.
While classical social science, as practiced since the second half of the last century, is based on a set of well-defined and elaborated rules, the emergence of ever new datasets create the need (and possibility) to approach questions in a new way [@mcfarland:SociologyEraBig.2016].
Along with those new datasets, data sources, and the explosion in computing power, new analyzing techniques were also developed in a rapid fashion.
Social scientists increasingly use those relatively newly developed techniques called machine learning. 
This describes "a class of flexible algorithmic and statistical techniques for prediction and dimension reduction" [@grimmer:MachineLearningSocial.2021, 396].

In this chapter, we will give an overview over some of the new methods, compare them to the approaches used in the 'classical' social social sciences, and point out some key differences and commonalities.
To do this, we will first go into detail on some theoretical basis and show the differences in approach on a practical example with an exemplary analysis on ESS Data [@essround9:EuropeanSocialSurvey.2019].


# Knowledge Acquisition in the Social Sciences

The rising popularity of survey methods in the 1930s and 40s established a new era in the social sciences.
This era was accompanied by new opportunities and the idea of inferential statistics made its way into the social sciences.
The widely agreed upon approach to social science is mainly based on Karl Poppers formalizations in the 1950s [@popper:LogicScientificDiscovery.2010].
Falsifiable hypotheses, founded on strong theories, build the foundation for the idea of testing theory-based assumptions.
It describes a way of generating knowledge about a small part of a population and generalizing this to its entirety [@krzywinski:Importancebeinguncertain.2013].

## Inferential statistics

We can calculate the probability of being wrong and define thresholds upon which we accept or reject our assumptions.

Since then, the linear model has become ubiquitous [@abbott:TranscendingGeneralLinear.1988].
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


## How does ML compare to traditional approaches?

It might come as a surprise but often times the algorithms used in machine learning are quite similar, if not the same, as in the traditional quantitative social sciences.
Logistic regression, OLS regressions, and principal component analysis, for example, are readily used in both camps. 
Even though many of the algorithms are the same, the mindset, practical approach and evaluation strategies differ.

In contrast to frequentist models, ML models usually do not have any usable, that is interpretable, coefficients.
Model evaluation rather works by evaluating its predictive power.



# A comparison by example: Immigration in Europe

To show some of the differences in mindsets, we will use an exemplary model and approach the problem from both angles.
The chosen model is loosely based on the approach used by @davidov:ExplainingAttitudesImmigration.2012 and others; it has often been implemented in similar ways.
It investigates the effect of human values on attitudes toward immigration.

The explanandum, our dependent variable which we will call _reject_, is a measure which represents _attitudes towards immigration_.
It is a mean index consisting of three variables[^av] which have been shown to load strongly on a single dimension in a confirmatory factor analysis.
To measure human values, we use the theory of basic human values [@schwartz:UniversalsContentStructure.1992] which is captured in the ESS surveys.
The theory describes 10 basic values that are structured in two dimensions[^schwartz]: _conservation_ and _self-transcendence_.

<!-- copied from davidov & meuleman 2012 -->
Concrete expectations can be formulated regarding the relation between values and attitudes towards immigration. The motivational goals or preferences embedded in
conservation values may be blocked by the arrival of immigrants (Sagiv and Schwartz 1995).
Immigrants bring along changing traditions and norms and this may hinder pursuing conservation values that include appreciation of stability of society, and respect, commitment and acceptance of the customs and ideas that traditional culture or religion provide. In other words, the arrival of immigrants is coupled with potential societal changes that are opposite to the preferences of conservative individuals. Therefore, we expect conservative individuals to reject immigration. On the other hand, the motivational goals or preferences embedded in self-transcendence values (especially universalism) are promoted by the arrival of immigrants (Sagiv and Schwartz 1995; Davidov et al. 2008a). Self-transcendence values include understanding, appreciation, tolerance and protection for the welfare of people and for nature. The arrival of immigrants provides opportunities for individuals to realise these self- transcendent values. In other words, the arrival of immigrants is coupled with potential societal changes that are in harmony with the preferences of self-transcendent individuals. Thus, we expect self-transcendent individuals to support immigration.
<!-- copy ende -->

We control for _income_, which which is measured with the variable `hincfel` and asks about the feeling about the household's present income.
This one is chosen over the objective household income to reduce the number of missing values.
Additionally, we control for _age_ (`agea`), _religiosity_ (`rlgdgr`), _education_ (`educyrs`), self-position on a _left-right scale_ (`lrscale`), and _gender_ (`gndr`).

[^av]: The variables used here are ask on a 4-point scale how many immigrants of different groups respondents would like to allow into their country. 1. many/few immigrants of different race/ethnic groups e(as majority) `imdfetn`, 2.  many/few immigrants of same race/ethnic groups (as majority) `imsmetn`, 3. many/few immigrants from poorer countries outside Europe `impcntr`. All items are recoded so that higher levels indicate more accepted immigrants.

[^schwartz]: The measures are construction according to the ESS website. All items were recoded so that higher levels indicate more agreement.

## Assessing model fit

We have a plethora of pseudo $R^2$ measures to assess goodness-of-fit, or the Akaike and Bayesion information criterion to compare and select models.
The basic idea behind these procedures in the social sciences is always to use all available data to fit the best possible model and to use one of the above mentioned measures to tell us  how good our model fits the underlying data.
Herein lies the probably biggest difference to what machine learners do.
