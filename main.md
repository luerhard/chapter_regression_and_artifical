---
# Bibliography
csl: rsc/library/style.csl # See https://www.zotero.org/styles for more styles.
bibliography: rsc/library/references.json
csquotes: true

title: 'Regression and Artificial Intelligence'

authors:
    - Lukas Erhard:
        institute: stuttgart
        email: lukas.erhard@sowi.uni-stuttgart.de
    - Raphael Heiberger:
        institute: stuttgart
        email: raphael.heiberger@sowi.uni-stuttgart.de
        correspondence: yes
    
institutes:
    stuttgart: University of Stuttgart, Seidenstraße 36, 70714 Stuttgart, Germany

date: \today

abstract: 'Hier Vorgang ihm als reiße. Ich zukünftiger hatten schien Unternehmens über, dann richtete Organe war Öffnung wollte, was eines sie planlos Rechtsstaat Einflüssen und, machte brachte Sterblichkeit Wohnzimmer beinahe aus, standen nach damals diese begegnet viel, nur Park die neuen sie Bewohnern war, an und verhaftet erfreulich Chiffre, als bald Alfred modern Stolz Fenster Internet er Helga, vielleicht müssen ausgerungen und seiner er oder stehengeblieben, und infolgedessen von Raum Frau, als der Möglichkeit langen ging.'

keywords: 'regression, artifical intelligence, machine learning'

titlepage: true
toc: false # Table of contents

---

# Introduction

Research in the social sciences has been shifting towards a new era.
In the prior century, the focus laid mainly on variable-based, theory and hypothesis-driven approaches to give answers to societal questions.
Data for such approaches was scarce, hard to come by, and expensive [@grimmer:MachineLearningSocial.2021].
The internet changed that. 
Digital data is comprehensive, ubiquitous, and, in general, cheap to retrieve.
While the availability of such data opens up new roads and possibilities, it creates the need for new forms of analysis and the need to approach questions in a new way [@mcfarlandSociologyEraBig2016; @lazerComputationalSocialScience2020].
Along with those new datasets, data sources, and an explosion in available computing power, new techniques for analyzing social phenomena were developed in a rapid fashion, often by integrating knowledge from other disciplines into an emerging field of "Computational Social Science" [@heibergerInstallingComputationalSocial2016].

In particular, social scientists increasingly use tools from machine learning (ML), methods that can be described as "a class of flexible algorithmic and statistical techniques for prediction and dimension reduction" [@grimmer:MachineLearningSocial.2021, 396].
Applications of ML comprise some of the most important technological innovations in recent years, for instance, gene prediction or search engines [@jordanMachineLearningTrends2015]. 
No problem seems too complex as long as researchers have enough (i.e., very large) data, even previously unsolvable questions might be solved, e.g., how to maintain high-temperature plasma for nuclear fusion [@degraveMagneticControlTokamak2022]. 
Given the already impressive resume and even greater potential of ML, is it only a matter of time until it replaces traditional statistics used in social science\todo{traditional statistics als consistent name nehmen und mit TS abkürzen?}?

As we will see, differences of ML and TS are (mostly) grounded in different epistemological perspectives. 
While recent overviews characterize ML-related methods and provide guidance for future research  [@molina:MachineLearningSociology.2019; @grimmer:MachineLearningSocial.2021], our contribution's goal is to point out key differences and commonalities between TS and ML. 
We will illustrate how a typical social scientists' approach might look like and how using ML techniques would change the results.  
For this purpose, we will first elaborate some theoretical differences and similarities between inferential statistics and ML. 
We will then exemplify those differences by using a well-known database, the ESS [@essround9:EuropeanSocialSurvey.2019]\todo{use correct ess version(s)}.
In particular, we will focus on two main parts of any regression analysis: estimators and goodness of fit. 
Comparing logistic regressions and two popular ML algorithms \footnote{hier shcon wording klären, was also ML "regression" meint?} (Random Forest, Ridge Regression), we will explain how ML work and, more importantly, how they are typically used by researchers outside the social scientists.
In so doing :) we will reveal how *epistemological* differences shape the potential usage of ML in the social sciences and discuss the methodological trade-off when it comes to the question whether to apply ML or TS. 
As it is often the case, combining both seems like the most promising way.%in besser

# Knowledge Acquisition in the Social Sciences

The rising popularity of survey methods in the 1930s and 40s established a new era in the social sciences.
This era was accompanied by new opportunities and the idea of inferential statistics made its way into the social sciences.
The widely agreed-upon approach to social science is mainly based on Karl Popper's formalizations in the 1950s [@popper:LogicScientificDiscovery.2010]\todo{sinnvolle engl. Edition finden}.
Falsifiable hypotheses, founded on strong theories, build the foundation for the idea of testing theory-based assumptions.
It describes a way of generating knowledge about a small part of a population and generalizing this to its entirety [@krzywinski:Importancebeinguncertain.2013].

## Inferential statistics

We can calculate the probability of being wrong and define thresholds upon which we accept or reject our assumptions.

Since then, the linear model has become ubiquitous [@abbott:TranscendingGeneralLinear.1988].
Questions around model _validity_ became central for the upcoming new methods.

This approach, however, bears some shortcomings:

1. What if your sample size is large?
    Many of the frequentist approaches are very prone to large sample sizes (e.g., all the chi-squared-based test-statistics).
    Testing for significance with very large sample sizes will almost always generate significant results, rendering those tests useless.

2. What if your sample is not independent and identically distributed? <!--% prozessgeneriert -->
    Many new datasets do not oblige to the rules for classical hypothesis testing

3. What if you have data about the entire population? <!--%all tweets, news articles, users of a platform, etc. --> Then, running tests for significance becomes completely irrelevant.

4. What if you have no theory, you can derive hypotheses from? This is especially important for social media networks, where the rules of engagement might differ quite substantially from 'normal' social behavior or where you cannot specify your population.

## Machine Learning


<!--% transcript of McFarland, p. 20 -- rewrite, but basically this:-->
See @mcfarland:SociologyEraBig.2016:

In internet companies there are large assortments of engineers focused solely on improving prediction. For example, a company may have many records on their website’s usage, such as information on clicks, site referrals, posted texts, network positions, as well as time spent on each page, purchasing behavior, and product quality ratings. Most companies ask their engineers to take these data and develop models informing the company when a customer service effort, advertisement, or search result will lead users to purchase more goods, stay on the site longer, or otherwise become an ideal consumer. The engineer typically approaches this problem without any concern for theory and instead applies machine learning (Alpaydin 2004; Bishop 2007).Footnote 6 This proceeds when the engineer takes, say, half the collected data (the “training set”) and identifies a variety of user actions (and their timing) most associated with a desired outcome. In effect, the engineer trains a logit model on an outcome of interest and throws as many features (variables) as possible at it in order to develop highly predictive weights. Then the engineer utilizes these weights to create an algorithm and assesses whether it can accurately predict the desired outcome in the remaining data that were not used for training (the “test set”). When the algorithm reaches certain levels of accuracy, the engineer can use it to determine which users need a “push” so as to proceed in desired directions.

Machine learning is a powerful tool that has assisted companies in many domains with various engineering questions (Talley et al. 2011). In fact, machine learning is the foundation of machine translation: for instance, how Chinese is accurately translated into English. The algorithm proceeds by merely identifying common word sequences across verified translations, and as the “training set” of known translations grows, so does the probability of accurately “predicting” word associations in “test sets” of future text. The “theory” is nothing more than probabilities of word associations as identified by many known translations. There is no linguistic theory of how a language or translation works (in fact, theories are notoriously inaccurate at translation). All that is desired is an accurate translation—utility is paramount, while understanding and explanation are superfluous.

When the machine learning approach is combined with theory and scientific research it can lead to surprising results. The atheoretical perspective of machine learning can reveal patterns a theory did not predict or a new way to formulate the theory that perhaps the analyst had overlooked. However, machine learning on its own (and by design) results in little to no understanding if there is no effort to derive a theory or explanation. In sum, the use of machine learning is atheoretical, but it is potentially powerful when used as an agnostic search for potential explanations. In contrast, theory is a somewhat narrow-minded but powerful tool in that it is a focusing device that identifies which constructs are to be selected and formed from the millions of possible variables (or features) and it afford potential explanations for how features interrelate. As such, the iterative combination of atheoretical induction and theory-led deduction can be quite powerful.
<!--% copy paste McFarland Ende.-->

- Supervised vs. unsupervised vs. reinforcement learning, see @jordan:MachineLearning.2015\todo{write}
- Regression vs. classification problems

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

The explanandum, our dependent variable which we will call _reject_, is a measure that represents _attitudes towards immigration_.
It is a mean index consisting of three variables[^av] which have been shown to load strongly on a single dimension in a confirmatory factor analysis.
To measure human values, we use the theory of basic human values [@schwartz:UniversalsContentStructure.1992] which is captured in the ESS surveys.
The theory describes 10 basic values that are structured in two dimensions[^schwartz]: _conservation_ and _self-transcendence_.

<!-- copied from davidov & meuleman 2012 -->
Concrete expectations can be formulated regarding the relation between values and attitudes towards immigration. The motivational goals or preferences embedded in
conservation values may be blocked by the arrival of immigrants (Sagiv and Schwartz 1995).
Immigrants bring along changing traditions and norms and this may hinder pursuing conservation values that include appreciation of stability of society, and respect, commitment and acceptance of the customs and ideas that traditional culture or religion provide. In other words, the arrival of immigrants is coupled with potential societal changes that are opposite to the preferences of conservative individuals. Therefore, we expect conservative individuals to reject immigration. On the other hand, the motivational goals or preferences embedded in self-transcendence values (especially universalism) are promoted by the arrival of immigrants (Sagiv and Schwartz 1995; Davidov et al. 2008a). Self-transcendence values include understanding, appreciation, tolerance and protection for the welfare of people and for nature. The arrival of immigrants provides opportunities for individuals to realise these self- transcendent values. In other words, the arrival of immigrants is coupled with potential societal changes that are in harmony with the preferences of self-transcendent individuals. Thus, we expect self-transcendent individuals to support immigration.
<!-- copy ende -->

We control for _income_, which is measured with the variable `hincfel` and asks about the feeling about the household's present income.
This one is chosen over the objective household income to reduce the number of missing values.
Additionally, we control for _age_ (`agea`), _religiosity_ (`rlgdgr`), _education_ (`educyrs`), self-position on a _left-right scale_ (`lrscale`), and _gender_ (`gndr`).

[^av]: The variables used here are asked on a 4-point scale how many immigrants of different groups respondents would like to allow into their country. 1. many/few immigrants of different race/ethnic groups e(as majority) `imdfetn`, 2.  many/few immigrants of same race/ethnic groups (as majority) `imsmetn`, 3. many/few immigrants from poorer countries outside Europe `impcntr`. All items are recoded so that higher levels indicate more accepted immigrants.

[^schwartz]: The measures are constructed according to the ESS website. All items were recoded so that higher levels indicate more agreement.

## Assessing goodness-of-fit

We have a plethora of pseudo $R^2$ measures to assess goodness-of-fit, or the Akaike / Bayesian information criterion (AIC/BIC) to compare and select models.
The basic idea behind these procedures in the social sciences is always to use all available data to fit the best possible model and to use one of the above-mentioned measures to tell us how well our model fits the underlying data.
Herein lies the probably biggest difference to what machine learners do.
In constraining themselves to rather 'simple' linear models, only including variables (and interaction effects) that do have a strong foundation in theory, traditional statistics avoids a very big problem in the machine learning realm: _overfitting_.

### Splitting data

Overfitting describes a phenomenon where a complex model with a lot of parameters is able to fit the underlying data very well but fails to predict unseen (new) data points.
To overcome this, it has become customary split the data set into multiple parts and only to use part of the data to train the model and the rest of the data to evaluate the predictive performance.
We call this the _train-test-split_.
It allows us to evaluate if our models only learns the noise (unexplained variance) in our data in a way that it is able to predict data that it has never seen before.
Once the final model configuration is decided, all data are used to train the final model.
A drawback of this procedure, of course, is that we are not able to evaluate the model on all data and are still at risk of _overfitting_ and there is a trade-off to be made when deciding in how large the test set should be.
Larger test sets usually mean higher confidence in the validation results but they come at the price of reduced available data for the training step.
Fortunately, methods exist to ensure predictive power on all data --- one of which is called _K-Fold Cross-Validation_.
It describes an approach in which the data is split into $K$ equally sized parts where $K-1$ parts are used for training and the remaining part is used for validation.
$K$ is often times $3$ or $5$ in these cases.
This is repeated $K$ times until every part of the data has been the test set exactly once.
Usually, the average over all $K$ model validation metrics is taken, resulting in numbers where all parts of the data are part of the training _and_ the validation step for the computational cost of having to train $K$ models instead of one in order to validate.

### Evaluation metrics

$$
Accuracy = \frac{TP + TN}{TP + FP + FN + TN}
$$

$$
Precision = \frac{TP}{TP + FP}
$$
$$
Recall = \frac{TP}{TP + FN}
$$

$$
F1 = 2 * \frac{Precision * Recall}{Precision + Recall}
$$



- confusion matrix
- specificity / sensitivity ? 

## Lasso Regression

## Random Forest

# Discussion
Social scientists face a trade-off when it comes to using ML. 
On the downside, features can only be ranked by importance. This stands in contrast to more-fine grained information provided by typical regression coefficients.
On the upside, focusing on models' predictive capabilities shifts the attention to explanations that are closer to scientific reasoning and less prone to mirror common sense [@wattsCommonSenseSociological2014]. 
It is "this potential predictive force which gives scientific explanations its importance" [@hempelStudiesLogicExplanation1948, 138], what is inherently neglected by goodness of fit measures solely relying on in-sample observations. 
In contrast, using out-of-sample is a crucial part of any SML procedure (i.e., its test data). 
Integrating this inherent property of ML, would at least reduce an important weakness of TS. 

ML is no cheat code, it is all statistics.
Everybody with a professional background in quantitative social science has learned of some ML tools, be it UML like cluster analysis or SML like logistic regressions.
To be sure, how those methods are used (and promoted) in ML contexts, might differ from common social science approaches. 
Regardless which features drives a model and how an outcome could be explained, the main interest of ML researchers in industry, but also in science, is that "it works", i.e., that the model provides good predictions.
This is an important *epistemological* difference. 
It might be helpful to acknowledge that and think about fruitful ways to complement existing regression models. 
Or rather, the way we as social scientists can make use of the ML perspective by … maybe finish by saying that UML helps explore, SML to predict

# References
     
<div id="refs">
</div>
