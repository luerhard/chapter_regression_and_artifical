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
While the availability of such data opens up new roads and possibilities, it creates the need for new forms of analysis and the need to approach questions in a new way [@mcfarland:SociologyEraBig.2016; @lazerComputationalSocialScience2020].
Along with those new datasets, data sources, and an explosion in available computing power, new techniques for analyzing social phenomena were developed rapidly, often by integrating knowledge from other disciplines into an emerging field of "Computational Social Science" [@heibergerInstallingComputationalSocial2016].

In particular, social scientists increasingly use tools from [!ml], methods that can be described as "a class of flexible algorithmic and statistical techniques for prediction and dimension reduction" [@grimmer:MachineLearningSocial.2021, 396].
Applications of [!ml] comprise some of the most important technological innovations in recent years, for instance, gene prediction or search engines [@jordan:MachineLearning.2015]. 
No problem seems too complex as long as researchers have enough (i.e., very large) data, even previously unsolvable questions might be solved, e.g., how to maintain high-temperature plasma for nuclear fusion [@degraveMagneticControlTokamak2022]. 
Given the already impressive resume and even greater potential of [!ml], is it only a matter of time until it replaces traditional statistics used in social science\todo{traditional statistics als consistent name nehmen und mit TS abkürzen?}?

As we will see, differences of [!ml] and [!ts] are (mostly) grounded in different epistemological perspectives. 
While recent overviews characterize ML-related methods and provide guidance for future research  [@molina:MachineLearningSociology.2019; @grimmer:MachineLearningSocial.2021], our contribution's goal is to point out key differences and commonalities between [!ts] and [!ml]. 
We will illustrate what a typical social scientists' approach might look like and how using ML techniques would change the results.  
For this purpose, we will first elaborate on some theoretical differences and similarities between inferential statistics and [!ml]. 
We will then exemplify those differences by using a well-known database, the [!ess] [@essround9:EuropeanSocialSurvey.2019]\todo{use correct ess version(s)}.
In particular, we will focus on two main parts of any regression\todo[author=LE]{klären, ob wir regression oder classification machen} analysis: estimators and goodness of fit. 
Comparing logistic regressions and two popular [!ml] algorithms \footnote{hier shcon wording klären, was also ML "regression" meint?} (Random Forest, Ridge Regression), we will explain how [!ml] works and, more importantly, how they are typically used by researchers outside the social scientists.
In so doing we will reveal how *epistemological* differences shape the potential usage of [!ml] in the social sciences and discuss the methodological trade-off when it comes to the question of whether to apply [!ml] or [!ts]. 
As is often the case, combining both seems like the most promising way. <!--in besser-->

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
See @mcfarland:SociologyEraBig.2016:\todo{rewrite copy / paste}

In internet companies there are large assortments of engineers focused solely on improving prediction. For example, a company may have many records on their website’s usage, such as information on clicks, site referrals, posted texts, network positions, as well as time spent on each page, purchasing behavior, and product quality ratings. Most companies ask their engineers to take these data and develop models informing the company when a customer service effort, advertisement, or search result will lead users to purchase more goods, stay on the site longer, or otherwise become an ideal consumer. The engineer typically approaches this problem without any concern for theory and instead applies machine learning (Alpaydin 2004; Bishop 2007).Footnote 6 This proceeds when the engineer takes, say, half the collected data (the “training set”) and identifies a variety of user actions (and their timing) most associated with a desired outcome. In effect, the engineer trains a logit model on an outcome of interest and throws as many features (variables) as possible at it in order to develop highly predictive weights. Then the engineer utilizes these weights to create an algorithm and assesses whether it can accurately predict the desired outcome in the remaining data that were not used for training (the “test set”). When the algorithm reaches certain levels of accuracy, the engineer can use it to determine which users need a “push” so as to proceed in desired directions.

Machine learning is a powerful tool that has assisted companies in many domains with various engineering questions (Talley et al. 2011). In fact, machine learning is the foundation of machine translation: for instance, how Chinese is accurately translated into English. The algorithm proceeds by merely identifying common word sequences across verified translations, and as the “training set” of known translations grows, so does the probability of accurately “predicting” word associations in “test sets” of future text. The “theory” is nothing more than probabilities of word associations as identified by many known translations. There is no linguistic theory of how a language or translation works (in fact, theories are notoriously inaccurate at translation). All that is desired is an accurate translation—utility is paramount, while understanding and explanation are superfluous.

When the machine learning approach is combined with theory and scientific research it can lead to surprising results. The atheoretical perspective of machine learning can reveal patterns a theory did not predict or a new way to formulate the theory that perhaps the analyst had overlooked. However, machine learning on its own (and by design) results in little to no understanding if there is no effort to derive a theory or explanation. In sum, the use of machine learning is atheoretical, but it is potentially powerful when used as an agnostic search for potential explanations. In contrast, theory is a somewhat narrow-minded but powerful tool in that it is a focusing device that identifies which constructs are to be selected and formed from the millions of possible variables (or features) and it afford potential explanations for how features interrelate. As such, the iterative combination of atheoretical induction and theory-led deduction can be quite powerful.
<!--% copy paste McFarland Ende.-->

- Supervised vs. unsupervised vs. reinforcement learning, see @jordan:MachineLearning.2015\todo{write}
- Regression vs. classification problems

## How does ML compare to traditional approaches?

It might come as a surprise but often the algorithms used in machine learning are quite similar, if not the same, as in the traditional quantitative social sciences.
Logistic regression, [!ols] regression, and [!pca], for example, are readily used in both camps. 
Even though many of the algorithms are the same, the mindset, practical approach, and evaluation strategies differ.

In contrast to frequentist models, [!ml] models usually do not have any usable, that is interpretable, coefficients.
Model evaluation rather works by evaluating its predictive power.



# A comparison by example: Immigration in Europe

To show some of the differences in mindsets, we will use an exemplary model and approach the problem from both angles.
The chosen model is loosely based on the approach used by @davidov:ExplainingAttitudesImmigration.2012 and others; it has often been implemented in similar ways.
It investigates the effect of human values on attitudes toward immigration.

The explanandum, our dependent variable which we will call _reject_, is a measure that represents _attitudes towards immigration_.
It is a mean index consisting of three variables[^av] which have been shown to load strongly on a single dimension in a confirmatory factor analysis.
To measure human values, we use the theory of basic human values [@schwartz:UniversalsContentStructure.1992] which is captured in the [!ess] surveys.
The theory describes 10 basic values that are structured in two dimensions[^schwartz]: _conservation_ and _self-transcendence_.

<!-- copied from davidov & meuleman 2012 -->
Concrete expectations can be formulated regarding the relation between values and attitudes towards immigration. The motivational goals or preferences embedded in
conservation values may be blocked by the arrival of immigrants (Sagiv and Schwartz 1995).
Immigrants bring along changing traditions and norms and this may hinder pursuing conservation values that include appreciation of stability of society, and respect, commitment and acceptance of the customs and ideas that traditional culture or religion provide. In other words, the arrival of immigrants is coupled with potential societal changes that are opposite to the preferences of conservative individuals. Therefore, we expect conservative individuals to reject immigration. On the other hand, the motivational goals or preferences embedded in self-transcendence values (especially universalism) are promoted by the arrival of immigrants (Sagiv and Schwartz 1995; Davidov et al. 2008a). Self-transcendence values include understanding, appreciation, tolerance and protection for the welfare of people and for nature. The arrival of immigrants provides opportunities for individuals to realise these self- transcendent values. In other words, the arrival of immigrants is coupled with potential societal changes that are in harmony with the preferences of self-transcendent individuals. Thus, we expect self-transcendent individuals to support immigration.\todo{rewrite copy / paste}
<!-- copy ende -->

We control for _income_, which is measured with the variable `hincfel` and asks about the feeling about the household's present income.
This one is chosen over the objective household income to reduce the number of missing values.
Additionally, we control for _age_ (`agea`), _religiosity_ (`rlgdgr`), _education_ (`educyrs`), self-position on a _left-right scale_ (`lrscale`), and _gender_ (`gndr`).

[^av]: The variables used here are asked on a 4-point scale how many immigrants of different groups respondents would like to allow into their country. 1. many/few immigrants of different race/ethnic groups e(as majority) `imdfetn`, 2.  many/few immigrants of same race/ethnic groups (as majority) `imsmetn`, 3. many/few immigrants from poorer countries outside Europe `impcntr`.
All items are recoded so that higher levels indicate more accepted immigrants.

```{.table #tbl:logreg}
---
alignment: LRRRR
caption: Logistic regression on all data.
include: rsc/tables/logreg.csv
markdown: true
---
```

Table @tbl:logreg shows the results of the logistic regression.
Country dummy variables are ommitted for reasons of clarity.
We see highly significant effects for all variables except gender with age, self-placement on the left-right scale, and conservation being positively correlated whereas education, satisfaction with income, religiosity and self-transcendence are negatively correlated with reject_bin, our dichotomous measure for attitudes towards immigration.
Except for the non-significance of gender our results are generally comparable to @davidov:ExplainingAttitudesImmigration.2012.
That said, we use a drastically simplified model and would not advise to draw any substantial conlusions from it.
We use this model only for didactic purposes.

[^schwartz]: The measures are constructed according to the ESS website. All items were recoded so that higher levels indicate more agreement.

## Assessing goodness-of-fit

We have a plethora of pseudo $R^2$ measures to assess goodness-of-fit, or the Akaike / Bayesian information criterion (AIC/BIC) to compare and select models.
The basic idea behind these procedures in the social sciences is always to use all available data to fit the best possible model and to use one of the above-mentioned measures to tell us how well our model fits the underlying data.
Herein lies the probably biggest difference to what machine learners do.
In constraining themselves to rather 'simple' linear models, only including variables (and interaction effects) that do have a strong foundation in theory, [!ts] avoidy a very big problem in the [!ml] realm: _overfitting_.

Overfitting describes a phenomenon where a complex model with a lot of parameters is able to fit the underlying data very well but fails to predict unseen (new) data points.
To overcome this, it has become customary to split the data set into multiple parts and only to use part of the data to train the model and the rest of the data to evaluate the predictive performance.
We call this the _train-test-split_.
It allows us to evaluate if our models only learn the noise (unexplained variance) in our data in a way that it can predict data that it has never seen before.
Once the final model configuration is decided, all data are used to train the final model.
A drawback of this procedure, of course, is that we are not able to evaluate the model on all data and are still at risk of _overfitting_ and there is a trade-off to be made when deciding how large the test set should be.
Larger test sets usually mean higher confidence in the validation results but they come at the price of reduced available data for the training step.
Fortunately, methods exist to ensure predictive power on all data --- one of which is called _K-Fold cross-validation_.
It describes an approach in which the data is split into $K$ equally sized parts where $K-1$ parts are used for training and the remaining part is used for validation.
$K$ is oftentimes $3$ or $5$ in these cases.
This is repeated $K$ times until every part of the data has been the test set exactly once.
Usually, the average overall $K$ model validation metrics is taken, resulting in numbers where all parts of the data are part of the training _and_ the validation step for the computational cost of having to train $K$ models instead of one to validate.

Oftentimes, and we do that in the following examples as well, these two procedures are combined.
We therefore split our data and keep a random sample of $20\%$ of all rows as a test set separate from all other data.
This data will only be used for model inspection and evaluation.

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



### Hyperparameter tuning & Grid Search
Most [!ml] models have so-called _hyperparameters_.
These are parameters that influence the way the models are trained and choosing these can have a great impact on model performance.
Trying combinations of hyperparameters and choosing the ones that result in the highest model performance is called _hyperparameter tuning_.
The [!rf] implementation used here has two hyperparameters to tune: the number of features to be considered at each decision node (`mtry`) [see also, @lantz:MachineLearningDiscover.2015, 369ff.], and `min.node.size`, the minimum size of the terminal nodes in every tree. The latter implicitly defines the maximum depth of our trees.

A common approach to tune hyperparameters is a procedure called _Grid Search cross-validation_.\todo{write GridSearch CV; describe final model, selection based on Acc etc., compare to LogReg (create LogReg model with traning data)}

## Random Forest

[!^rf!] is an algorithm from the family of ensemble methods, meaning it is a compound of multiple simple algorithms called _Decision Trees_.
Ensemble methods exploit the concept of majority voting, where multiple simple models are trained to capture different aspects of the data and the prediction is the outcome most models agree upon [@bonaccorso:MachineLearningAlgorithms.2017, 154].

A Decision Tree is, as one would imagine, a tree of binary decisions on the data.
The order of the decisions and the cutoff points according to which a decision is made are the things that are learned by maximizing an impurity measure like _Gini_[^impurity] or _cross-entropy_.
The trees in a [!rf] a generally much simpler, in a way that they have fewer nodes (one could imagine them more like tree stumps) than a single decision tree.
Interestingly, this has been shown to improve the predictive performance and, most importantly, makes the [!rf] less susceptible to overfitting compared to a single Decision Tree.

We will use 'bagged' trees here.
It is worth mentioning that there exists another group of ensemble trees called 'boosted trees'. 
A very popular member of this relatively new group of algorithms is _AdaBoost_ [@freund:DecisionTheoreticGeneralizationOnLine.1997].
They have shown to be very powerful because Decision Trees are trained sequentially (instead of simultaneously) and trees later in the sequence can learn from the misclassifications of earlier ones.

[^impurity]: We will not go into detail about the differences of impurity measures here and use Gini throughout the rest of this chapter.


###  Interpreting ML models

One basic inspection of a [!rf] model is to look at feature importances.
These reflect the relative influence each feature has on the resulting predictions.
Figure @fig:rf_feature_importance shows the relative feature importances for all predictors in our [!rf] model (excluding the country dummy variables).
These paint a similar picture as our logistic regression with the two human values dimension being the most important predictors, followed by age and education.
Religiosity and self-placement on the left-right scale contribute roughly half as much to the prediction compared to the human values dimensions.


![Feature importances of all non-country features in [!rf].](rsc/images/rf_feature_imp.pdf){#fig:rf_feature_importance .center width="100%"}


The feature importances are easy to compute but have two major drawbacks. First, due to the relativity of the measure, one cannot draw any conclusion about the absolute contribution of each feature to the prediction.
Secondly, it is not possible to determine the direction of the effects on the predicted outcome.
Especially the latter point is the main reason for social scientists to run statistical analyses in the first place and is, in linear models, usually determined by the sign of the coefficients.
Random forests, however, are, due to their inherent nature, highly non-linear, meaning that each feature can have different impacts on the predicted outcome, depending on the actual feature value of an observation.
In [!ts] non-linear effects (often introduced by interaction effects in regression models) are oftentimes visualized using marginal effects.
The same can be done for [!ml] models.
Traditionally, this was done using [!+pdp], which serve exactly this purpose but have a drawback: [!+pdp] tend to show non-sensical effects if the features are correlated.
Therefore, a more advanced technique is the inspection of [!ale] plots [@molnar:InterpretableMachineLearning.2019], which serve the same purpose but are, in contrast to [!+pdp], still correct if the respective features are correlated.


![[!+^ale!] for metrically scaled features in RF.](rsc/images/rf_ale.pdf){#fig:rf_pdp .center width="100%"}

This allows assessing whether the relationship between a selected feature and the outcome is linear, monotonic, or more complex.
Figure @fig:rf_pdp shows the [!+ale] for all numerical features in the [!rf] model.
Compared to the results of the logistic regression earlier (see Table @tbl:logreg), the linear trends of the [!rf] model point in the same directions.
But additionally, we can see some non-linear relationships in our data.
According to our model, self-transcendence and conservation are only changing the predicted outcome once their values become positive.
In a way, it looks like it does not matter too much **how** negative the values are but only **if** they are negative.
A similar effect can be seen when looking at the self-placement on the left-right scale which is starting to increase at roughly the value $4$.
The effect of education seems to be of a more dichotomous fashion, with low values indication more tendencies towards a rejection of immigrations whereas high values indicate the opposite.
Here again, the exact amount does not seem to drive the predictions, but rather whether if someone has received much or litte education is decisive.
The effect of religiosity looks like a slightly skewed inverse u-shape rather rather than being linearly negative, as the logistic regression would suggest, with the highest predicted probabilities for rejection of immigrants at around 5 on the religiosity scale.\todo{nicht-lineare Zusammenhänge finden; hier oder in Discussion mit Bezug auf atheortical, explorative analysis, theory building etc. eingehen.}



## Lasso Regression

# Discussion
Social scientists face a trade-off when it comes to using [!ml]. 
On the downside, features can only be ranked by importance. This stands in contrast to more fine-grained information provided by typical regression coefficients.
On the upside, focusing on models' predictive capabilities shifts the attention to explanations that are closer to scientific reasoning and less prone to mirror common sense [@wattsCommonSenseSociological2014]. 
It is "this potential predictive force which gives scientific explanations its importance" [@hempelStudiesLogicExplanation1948, 138], which is inherently neglected by goodness-of-fit measures solely relying on in-sample observations. 
In contrast, using out-of-sample is a crucial part of any [!sml] procedure (i.e., its test data). 
Integrating this inherent property of [!ml] would at least reduce an important weakness of TS. 

[!ml] is no cheat code, it is all statistics.
Everybody with a professional background in quantitative social science has learned of some [!ml] tools, be it [!uml] like cluster analysis or [!sml] like logistic regressions.
To be sure, how those methods are used (and promoted) in [!ml] contexts, might differ from common social science approaches. 
Regardless of which features drive a model and how an outcome could be explained, the main interest of [!ml] researchers in industry, but also science, is that "it works", i.e., that the model provides good predictions.
This is an important *epistemological* difference. 
It might be helpful to acknowledge that and think about fruitful ways to complement existing regression models. 
Or rather, the way we as social scientists can make use of the [!ml] perspective by … maybe finish by saying that [!uml] helps explore, [!sml] to predict
