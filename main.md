---
# Bibliography
csl: rsc/library/apa-6th-edition.csl # See https://www.zotero.org/styles for more styles.
bibliography: rsc/library/references.json
csquotes: true

title: Regression and Machine learning

authors:
  - Lukas Erhard:
      institute: stuttgart
      email: lukas.erhard@sowi.uni-stuttgart.de
      correspondence: yes
  - Raphael Heiberger:
      institute: stuttgart
      email: raphael.heiberger@sowi.uni-stuttgart.de

institutes:
  stuttgart: University of Stuttgart, Seidenstraße 36, 70714 Stuttgart, Germany

date: \today

abstract: Machine learning (ML) techniques have become one of the most successful scientific tools and changed the everyday life of people around the globe (e.g., search engines). A vast amount of digital data sources on human behaviour has emerged due to the rise of the internet and opened the door for computer scientists to apply ML on social phenomena. In the social sciences, however, the adoption of ML has been less enthusiastic. To investigate the relation of traditional statistics and ML, this paper shows how ML might be used as regression analysis. For that purpose, we illustrate what a typical social science approach might look like and how using ML techniques could contribute additional insights when it comes to estimators (non-linearity) or the assessment of model fit (predictive power). In particular, we reveal how epistemological differences shape the potential usage of ML in the social sciences and discuss the methodological trade-off of applying ML compared to traditional statistics.

keywords: regression analysis, machine learning, ess, ridge regression, random forest

titlepage: true
toc: false # Table of contents
---

\listoftodos
\newpage

<!--
TODOs für LE vor Einreichung:
- convert footnotes to endnotes
- fix all tables in word
- provide high-res images
- check publisher locations for books

Notes to editors:
- changed citation style from APA7 to APA6
- used single quotes where applicable
- changed spellings to BE
-->

# Introduction

Research in the social sciences has been shifting towards a new era.
In the prior century, the focus laid mainly on variable-based, hypothesis-driven approaches to give answers to societal questions.
Data for such approaches was scarce, hard to come by, and expensive [@grimmer:MachineLearningSocial.2021].
The internet changed that.
Digital data is comprehensive, ubiquitous, and, in general, cheap to retrieve.
While the availability of such data opens up new roads and possibilities, it also creates the necessity for adequate forms of analysis [@mcfarland:SociologyEraBig.2016; @lazerComputationalSocialScience2020].
Along with those new data sets, data sources, and an explosion in available computing power, new techniques for analysing social phenomena developed rapidly, often by integrating knowledge from other disciplines into an emerging field of computational social science (CSS) [@heibergerInstallingComputationalSocial2016, see also Kashyap et al. in this volume].

Social scientists increasingly use tools from CSS [@lazerComputationalSocialScience2020] and, in particular, [!ml].
Methods subsumed under [!ml] can be described as 'a class of flexible algorithmic and statistical techniques for prediction and dimension reduction' [@grimmer:MachineLearningSocial.2021, 396].
Applications of [!ml] comprise some of the most important technological innovations in recent years, for instance, gene prediction or search engines [@jordan:MachineLearning.2015].
No problem seems too complex as long as researchers have enough (i.e., very large) data.
Even previously unsolvable questions might be solved, e.g., how to maintain high-temperature plasma for nuclear fusion [@degraveMagneticControlTokamak2022].
Thus we ask: given the already impressive resume and even greater potential of [!ml], is it only a matter of time until it replaces [!ts] as used in social science?

As we will see, differences of [!ml] and [!ts] are (mostly) grounded in different epistemological perspectives.
While recent overviews characterize ML-related methods and provide outlines for future research [@molina:MachineLearningSociology.2019; @grimmer:MachineLearningSocial.2021], our chapter's goal is to point out key differences and commonalities between [!ts] and [!ml].
We will illustrate what a typical social scientists' approach might look like and how using [!ml] techniques could potentially contribute additional insights.
For that purpose, we will first elaborate some general differences and similarities between [!ts] and [!ml].
We will then exemplify those differences by using a well-known data set, the [!ess].
In particular, we will focus on two main parts of any regression analysis: estimators and goodness of fit.
By comparing logistic regressions and two popular [!ml] algorithms ('Random Forest' and 'Ridge Regression'), we will explain how [!ml] works and, more importantly, how they are typically used by researchers outside the social sciences[^git].
In so doing we will reveal how _epistemological_ differences shape the potential usage of [!ml] in the social sciences and discuss the methodological trade-off when it comes to the question of whether (and how) to apply [!ml] or [!ts].

[^git]: All code and descriptions to use the ESS are available on [https://github.com/luerhard/chapter_regression_and_artifical](https://github.com/luerhard/chapter_regression_and_artifical.git).

# Traditional statistics and digital data

Statistics became widely employed in the landscape of all social sciences from the 1950s onward [@plattHistorySociologicalResearch1998].
Platt’s [-@plattHistorySociologicalResearch1998] historical account of sociological methods argues that studies from 1920 to 1940 lacked external funding and were mainly qualitative by design (interviews, ethnography).
In the following decades, this changed as surveys and statistics became the main instruments for social scientists [@converseSurveyResearchUnited2009].
The quantification and numeric measurement of social phenomena through surveys, the subsequent approximation of complex concepts in variables, together with increasing computing power, can be seen as a 'watershed moment' of empirical social research.
The paramount of research activities shifted during this process from ethnographic community studies to an individualistic perspective which was inherent to survey questions [@porterModernSocialSciences2003].

Reflecting changes in methods, new theoretical programs came into fashion.
For instance, rational choice theory with its methodological individualism was well-suited to explain variable-centred research questions and became a prevalent taste of many sociologists [@colemanFoundationsSocialTheory1990].
The usage of surveys, the resulting availability of a new kind of data, and easier access and higher acceptance of causal models occurred in other social sciences as well. In psychology and economics, for instance, the general methodological subfields of psychometrics and econometrics respectively emerged [@rafteryStatisticsSociology19502001].
In the wake of variable-driven data retrieval came the advent of regression models, factor analysis, and other statistical techniques in sociology, although those methods were considered 'esoteric expertise' [@abbottSystemProfessions1988, 147] until the late 1960s.

Thus, the shift to quantitative research was fueled by fundamental changes in research content (survey), techniques (regressions), and technology (computers).
Social scientists face a similar situation today.
The flux of research fashions and increasing diversity of the field has picked up steam as a new era of big data and super-computing has arrived [@mcfarland:SociologyEraBig.2016].
For more than a decade, the internet has changed the lives of most people in industrialized countries providing the means to use all sorts of digital traces (e.g., connections, profiles, or communications) as data on social behaviours and systems.

Compared to computer scientists and engineers who have embraced the analysis of large social data and actively developed research programs to 'conquer' this domain [@conteManifestoComputationalSocial2012], social scientists have been rather slow to utilize the possibilities of new data and computational methods [@heibergerInstallingComputationalSocial2016].
Part of the explanation may be sought in the underlying research program of [!ts] that dominates quantitative research in the social sciences.
It builds on inferential statistics and Karl Popper's formalisations [@popper:LogicScientificDiscovery.1968], i.e., testing falsifiable hypotheses, derived from (general) theories.
This foundation of testing theory-based assumptions describes a way of generating knowledge about a small part of a population and generalizing it to its entirety [@krzywinski:Importancebeinguncertain.2013].
One main pillar of this approach is to calculate the probability of this generalization being wrong (like the probability of a false-positive or alpha error as represented by the p-value).
Hence, social scientists rely heavily on thresholds upon which we accept or reject hypotheses, most often considered to be at the conventional but arbitrary significance level of 5 per cent.

While this frequentist approach is well-suited for carefully conducted surveys, it bears some significant shortcomings for digital data.
One severe methodological challenge is tied to _sample characteristics_.
Most of the frequentist approaches are driven by or depend on sample size (e.g., all chi-squared-based test-statistics).
Testing for significance with very large sample sizes will almost always generate statistically significant results, rendering those tests meaningless.
This problem is amplified by the source of many popular digital data, e.g., social media platforms like Twitter.
Inferences and significance levels are then, at best, possible for the underlying population, hence, the platform's users [@lewisThreeFallaciesDigital2015].
Most often, however, we do not know much about users' characteristics, or how they relate to (parts of) the general population [@hargittaiPotentialBiasesBig2020].
In addition, the efficient estimation and interpretation of regression coefficients rely on non-independent and identically distributed observations.
This is often not the case for samples from digital data, e.g., when it comes to all data gathered on social networks (of which dependency is an inherent property).

Another important challenge for [!ts] analysing digital data relates to the ubiquity of _linear_ models [@abbott:TranscendingGeneralLinear.1988].
Even if the predictor is non-linearly related to the outcome as in, for instance, logistic regressions ($log(y) = b0 + b1*x1$), almost all [!ts] models assume "linearity-in-the-predictor".
The advantage of linear predictors is that it facilitates the interpretation, yet, it also obscures potential non-linear relationships. 
Social scientists only rarely formulate models with complex, non-linear predictors like $f(y) = b0/sqrt(b1*x1)*b2^x2$.
A circumstance that is astonishing, given the complexity of social phenomena.
Some argue that is because of the omission of counterfactual language [@pearlBookWhyNew2018, 329-35], while others may point to the problem of overfitting when introducing polynomial terms in linear regressions [@molina:MachineLearningSociology.2019].
As a consequence, theories and results in social sciences almost never consider non-linear relations in the above sense.
One of the great promises of [!ml] is to offer ways to measure such non-linear effects.
Modelling non-linearity is actually inherent to many [!ml] techniques, making it feasible to consider complex relationships between variables without prior knowledge of the shape of these relations. 
We will exemplify this down below by presenting the properties of Random Forests, a popular instance of [!ml] tools.

# Machine Learning in the social sciences {#sec:ml_in_soc}

[!ml] summarizes statistical methods in which computers learn from data and extract information.
While [!ml] represents a breakthrough in computer sciences, its adoption in the social sciences is less enthusiastic [@molina:MachineLearningSociology.2019].
In contrast to the usage of inferential statistics, the application of [!ml] does not (yet) rest on as established methodological principles and assumptions as in [!ts].

In general, we can distinguish two paradigms when it comes to [!ml]: _[!sml!]_ and _[!uml!]_ [e.g., @jordan:MachineLearning.2015].
[!^sml] uses _labelled_ data. We speak of labelled data if the values of the dependent variable (DV) are known.
That is the case for all typical regression analyses in the social sciences: trying to relate predictors to the values of a DV. 
The difference in [!slm] is then that the statistical models are then fit to predict *previously unseen* data of which we know the predictors, but not the DV.
These techniques are, in computer sciences, grouped into  "regressions" (for a continuous DV) and "classifications" (for categorical DV).

In contrast, [!uml] uses _unlabelled_ data, that is, data where the 'correct' answer cannot be learned from known observations.
It instead derives patterns of (unlabelled) observations by exploiting the statistical properties of the data.
Common groups of [!uml] techniques are dimension reduction (e.g., Principal Component Analysis) or clustering (e.g., K-Means clustering).
[!uml], in essence, aims to create categorization schemes or typologies.
In social sciences, most people would refer to this as "inductive exploration". 
Researchers so inductively define types along derived dimensions and represent each case relative to the types given its underlying values.
Resulting (ideal-)types are arguably among the most important methodological tools of social scientists and have been used for a long-time.
[!uml]’s main purpose is therefore to explore data and reduce its complexity.
Researchers might then use the output of [!uml] as input for further analysis [@heibergerFacetsSpecializationIts2021] or to develop theoretical models [e.g., @hallIntroductionVarietiesCapitalism2001].

Those exploratory techniques are by no means new to social sciences.
However, [!uml] does provide novel ways to analyse large amounts of text and social networks, both kinds of data often associated with the digital age and computational social science [@heibergerInstallingComputationalSocial2016].
In particular, the 'automatic' categorization of large corpora has found many applications to social phenomena [@evans:MachineTranslationMining.2016].
Topic models, for instance, represent one of the most used [!nlp] tools in the social sciences [@mcfarland:DifferentiatingLanguageUsage.2013; @heibergerFacetsSpecializationIts2021].
In addition, the detection of communities in networks resembles prominent ideas of social groups [@fortunato:CommunityDetectionGraphs.2010].

The importance of [!uml] notwithstanding, our chapter's focus is on [!sml].
Many people might first think of [!sml] when it comes to [!ml].
Methods under the umbrella of [!sml] also witnessed the largest performance boost due to increases in the availability of digital data.
Methodologically speaking, almost all instances of [!ai] are [!sml], i.e., models intended to predict an outcome with a given set of features.
That is the same principle as when social scientists speak of estimating a dependent variable by the means of independent variables.

Thus, how does [!sml] actually compare to [!ts]?
There are two main answers to that, in our view, crucial question, one is epistemological, the other practical.
While [!ts] infers models that _explain_ how an outcome is generated with unbiased and consistent estimators, [!sml] does not care about interpretability.
While the coefficients are the most interesting part of regressions for social scientists, the features are of little to no interest for typical [!ml] use cases (cf. Section @sec:ml_in_soc).
Instead, the main goal of [!sml] is how to best forecast the outcome.
Thus, [!sml] models do not need to care about meaningful interpretations or unbiased estimators.
This is a crucial epistemological difference and yields many practical consequences.

Foremost, the prioritization of predictions affords 'out-of-sample' testing, i.e., the ability of models to predict unknown observations.
Thus, unlike most social scientists using _one_ data set for modelling efforts, SML consists of at least two data sets: training and test data.
The former is used to develop the model, the latter to test its predictive capacity on out-of-sample data.
Often, the train and test sets are randomly sampled from the same data set which is split, e.g., 50/50.
That means properties like autocorrelation or multicollinearity are merely treated as features, not as problems like in inferential statistics.

This approach stems from its practical success in many commercial applications.
Engineers of almost all large companies focus on improving the prediction of customer behaviour.
Of course, firms with digital business models profit most from [!sml<]'s predictive power.
Consider, for instance, a company that sells wine online.
Given a certain record of orders and a large enough customer base, the company can use the characteristics of their data (e.g., price, grape, origin, quality, vineyard, etc.) to make recommendations for further purchases.
Those suggestions might also be based on information about what other customers might have bought.
In any case, the wine shop will mostly be interested to develop models 'that work', i.e., engineers or consultants might typically approach this task without any concern for theory or explain _why_ somebody bought something in the sense that previous choices of grapes are two times as important for current choices than the vineyard.
In other words, the strength and direction of coefficients are of no importance, it suffices to make suitable recommendations (i.e., predictions) to improve sales.

Given the priority of prediction, many restrictions of [!ts] are no longer concerns of [!ml] researchers.
If interpretation (or explanation) is not the aim, the use of powerful “black-boxes” like multi-layer neural networks or higher-order interaction effects becomes an attractive option.
Almost all deep-learning efforts rest on such black boxes, which are only of limited use for social scientists.
The same is true for using thousands of (potentially co-linear) variables in a model.
This practical approach also allows regularisation of variance [^regularisation] (cf. Section @sec:shrinkage) and empirical tuning of parameters [@mullainathanMachineLearningApplied2017].
Instead of being prone to overfitting (like [!ts] models), [!sml] uses the training data and tunes regularisers to fit the data at hand (number and effect differing by algorithm).

We will illustrate such a typical [!sml] workflow by using two examples in the remainder of this contribution.
We will focus on illustrating the use of [!ml] for 'classifications' instead of 'regressions' in order to keep the analysis as comprehensible as possible.[^language]
In particular, confusion matrices (see below) for binary outcomes have the advantage to yield relatively simple indicators for model performance.
Nevertheless, those are among the most common concepts of [!ml] and provide a useful case for the purposes of this contribution.
All derived conclusions, however, do apply for 'regressions' (in the [!ml] sense) too.

[^regularisation]: Regularisation in [!ml] helps researchers to dea with the noise in training data, i.e., it tunes down correlations that are not representative of the data's true properties. More technically, this is done by using loss functions like the residual sum of squares during the fitting procedure. The coefficients are chosen in such a way that the loss function is minimized and "penalizes", for instance, high coefficients.
[^language]: In the language of [!ml], this translates into using a categorical, often binary, dependent variable (i.e., solving a 'classification' problem), while employing 'regressions' refers to techniques that use continuous outcomes. This might be a bit confusing for social scientists at first.

# A comparison by example: Immigration in Europe

It might come as a surprise for some readers, but often the algorithms used in machine learning are quite similar if not even the same, as in traditional quantitative social sciences.
Logistic regression, [!ols] regression, and [!pca], for example, are readily used in both camps.
Even though many of the algorithms are the same, the epistemological and practical approaches, as well as evaluation strategies, differ.
First, and in stark contrast to [!ts] models, [!ml] models usually do not have any usable, that is interpretable, coefficients.
Secondly, model evaluation works by assessing its predictive power.

To illustrate the epistemological differences, we will use an exemplary model and approach the problem from both angles.
The chosen model is loosely based on the approach by @davidov:ExplainingAttitudesImmigration.2012 and has been used by others in a similar way [e.g., @sagiv:Valueprioritiesreadiness.1995].
The model investigates the well-known effect of human values on attitudes toward immigration.

Our data comes from the first round [-@ESS.2002] of the European Social Survey (ESS).
The explanandum, our dependent variable which we will call _reject_, is a measure that represents **attitudes towards immigration**.
It is constructed as a mean index consisting of three variables[^av] which have been shown to load strongly on a single dimension in a confirmatory factor analysis [@davidov:ExplainingAttitudesImmigration.2012, 764].
To show the [!ml] workflow in its simplest form, binary classification, the resulting variable is dichotomized at the scale's mean value so that 1 indicates negative attitudes towards immigration (simply put: "rejecting immigration").
To measure human values, we use the theory of basic human values [@schwartz:UniversalsContentStructure.1992] which is captured in the [!ess] surveys.
The theory describes 10 basic values that are structured in two dimensions[^schwartz]: _conservation_ and _self-transcendence_.

Some theoretically founded expectations of this model can be formulated.
Conservation values 'that include appreciation of stability of society, and respect, commitment and acceptance of the customs and ideas that traditional culture or religion provide. In other words, the arrival of immigrants is coupled with potential societal changes that are opposite to the preferences of conservative individuals' [@davidov:ExplainingAttitudesImmigration.2012, 761].
Therefore, more conservative individuals are expected to reject immigration.
In contrast, 'self-transcendence values include understanding, appreciation, tolerance and protection for the welfare of people and for nature. The arrival of immigrants provides opportunities for individuals to realise these self-transcendent values. In other words, the arrival of immigrants is coupled with potential societal changes that are in harmony with the preferences of self-transcendent individuals' [@davidov:ExplainingAttitudesImmigration.2012, 761].
Hence, we expect more self-transcendent people to support immigration.

We control for _income_, which is measured by a variable measuring respondents' feeling about the household's present income (four-point scale from 1 'Living comfortably' to 4 'very difficult' on present income).
Subjective income is chosen over the objective household income for the pragmatic reason of reducing the number of missing values.
Additionally, we control for _age_ (in years), _religiosity_ (11-point scale from 0 'not at all religious' to 10 'very religious'), years of full-time _education_, self-position on a _left-right scale_ (11-point scale from 0 'left' to 10 'right'), _gender_ (dummy variable coded 0 for male and 1 for female), and country via dummy variables.
See Table @tbl:desc (appendix) for descriptive statistics on variables.

[^av]:
    The variables used here are asked on a 4-point scale how many immigrants of different groups respondents would like to allow into their country. 1. many/few immigrants of different race/ethnic groups e(as majority) `imdfetn`, 2. many/few immigrants of same race/ethnic groups (as majority) `imsmetn`, 3. many/few immigrants from poorer countries outside Europe `impcntr`.
    All items are recoded so that higher levels indicate more accepted immigrants.


## Analysis using traditional statistics

Table @tbl:logreg reveals the results of the logistic regression.
We see highly significant effects for all variables except gender with age, self-placement on the left-right scale, and conservation being positively correlated whereas education, satisfaction with income, religiosity, and self-transcendence are negatively correlated with the rejection of immigration.
Except for the non-significance of gender, our results are similar to @davidov:ExplainingAttitudesImmigration.2012.
That said, we use a drastically simplified model and would not advise drawing any substantial conclusions from it.
We use this model only for didactic purposes to compare methods of [!ts] to [!ml].

```{.table #tbl:logreg}
---
alignment: LRRRR
caption: Logistic regression of dichotomised attitudes towards immigration (log-odds coefficients).
include: rsc/tables/logreg.csv
markdown: true
---
```

[^schwartz]: The measures are constructed according to the ESS website. All items were recorded so that higher levels indicate more agreement.

## Evaluating model performance {#sec:model_performance}

Social scientists use a plethora of (pseudo) $R^2$ measures to assess the goodness of fit of a model, or the Akaike / Bayesian information criterion (AIC/BIC) to compare and select models at their disposal.
The basic idea behind these procedures is always the same: utilize all data available to optimize the model and tell us how well our model fits the underlying data.
Herein lies probably the biggest difference to machine learners' aims.
While [!ml] needs to _predict_, social scientists tend to _overfit_ their models.
We speak of overfitting when a model is fit very well to the underlying data, but fails to predict unseen examples.
It therefore has learned random _noise_ instead of the true correlations in the data set at hand. 
As a consequence, overfitted models can only rarely be replicated in other samples (i.e., are bad in predicting unseen data), because they fit the data 'too good' and are prone to 'p-hacking'.[^phack]
That creates considerable uncertainty about such models' merits and casts considerable doubts if those explanations should be even considered as scientific [@wattsCommonSenseSociological2014].

[^phack]: _P_-hacking is when a researcher looks at many relationships to find a statistically significant result (p < .05), and then only reports significant findings.

To overcome the obstacle of overfitting, it has become customary to split the data set into multiple parts and only to use part of the data to train the model and the rest of the data to evaluate the predictive performance.
We call this the _train-test-split_, with the _training set_ being the former and the _test set_ being the latter subset of our data.
This procedure allows us to evaluate whether our models only learn the noise (unexplained variance) in our data or if they are able to predict data that they have not seen before.
A drawback of this procedure, of course, is that we are not able to evaluate the model on the whole data set, so there is a trade-off to be made when deciding on how large the test set should be.
Hence, the need for "Big Data".
Larger test sets usually mean higher confidence in the validation results but they come at the price of reduced available data for the training step.
In the case at hand, 20\% of the data (5432 cases of an overall number of 27,164 cases) is separated into the test set.
This data will only be used for model inspection and evaluation.
The remaining 80\% will be used as the training set.

Classification models are evaluated using a so-called _confusion matrix_.
A confusion matrix compares the predicted values from a model to the actual (true) values from our test data.
Table @tbl:confmat depicts its formal representation for binary classifications.

```{.table #tbl:confmat}
---
alignment: LCC
width: [0.1, 0.2, 0.2]
caption: Formal representation of a confusion matrix for binary classification.
markdown: true
---
, predicted 0, predicted 1
true 0, TN (true negative), FP (false positive)
true 1, FN (false negative), TP (true positive)
```

[!+^tn] represent the number of correct predictions for the 'negative class' (e.g., the absence of a class, most often 0; in our case, if somebody is having no negative attitudes against immigration).
[!+tp] is the number of correct predictions for the positive class (in our case: if somebody is having negative attitudes against immigration), respectively.
[!+^fn] show the number of incorrect predictions for the negative class, whereas [!+fp] depict the number of incorrect positive predictions.
Many important goodness-of-fit metrics can be derived from this matrix.
We will illustrate two of the most common measures: **accuracy** and the **F1-score**.
Both metrics range from 0 to 1, with higher values indicating better models.

_Accuracy_ denotes the ratio of correctly classified data instances to the total number of data instances:

$$
Accuracy = \frac{TP + TN}{TP + FP + FN + TN}
$$

Accuracy is a valuable measure if the data contains roughly equal amounts of [!tp] and [!tn], but it is very susceptible to **class imbalance** (meaning that one category of our categorical variable, in [!ml] terms usually referred to as 'classes', has a higher prevalence in the actual data than the other).
Take, for example, a data set containing a rare outcome with $TN = 90$ and $TP = 10$; a model that only predicts $0$ would achieve an accuracy of .9 as it will predict 90\% of all cases correctly, even though it is most certainly not a very good model.

Hence, there is a need for metrics that take imbalanced classes into account.
Most commonly, the literature refers to two distinct measures, the first being _precision_:

$$
Precision = \frac{TP}{TP + FP}
$$

Precision (also called _positive predictive value_) describes the proportion of correct positive predictions over all positive predictions.
Hence, it answers the question: 'how many of my positive predictions are actually correct?'.
This metric is commonly supplemented by another: _recall_ which is defined as:

$$
Recall = \frac{TP}{TP + FN}
$$

Recall (also known as _sensitivity_) describes the fraction of correct positive predictions over all cases for which a positive prediction would have been correct.
It thereby answers the question: 'how many positive predictions did I miss?'.

Both measurements are usually merged into one metric, the _F1-score_.
It is defined as the harmonic mean of both and therefore penalizes extremely low values in either:

$$
F1 = 2 * \frac{Precision * Recall}{Precision + Recall}
$$

To be comparable to the models presented below, we reran the logistic regression from above on the training data set (80\% of the initial data set) and evaluated it on the test set (20\% of the initial data set).
The results are shown in the confusion matrix in Table @tbl:logregconfmat.

```{.table #tbl:logregconfmat}
---
alignment: LCCR
width: [0.1, 0.2, 0.2, 0.1]
caption: Confusion matrix for logistic regression.
markdown: true
---
, 0, 1,  **sum**
 0, 2299, 1022, **3321**
 1, 670, 1441, **2111**
**sum**, **2969**, **2463**, **5432**
```

From this data, we can compute an accuracy of .6885, meaning that we were able to predict 68.85\% of all cases in the test set correctly.
Additionally, we can calculate a recall of .7743.
This indicates that we were able to identify 77.43\% of all cases in our test set that have negative attitudes towards immigrants (that is, a value of 1 in our dependent variable).
Furthermore, the precision of .6923 tells us the proportion of correct positive predictions. 
Thus, we predict 69.23\% of all positive predictions correctly.
The harmonic mean of precision and recall, the F1-score, is .731. This has no special interpretation but is often used for a comprehensive model comparison considering precision and recall.
Typically, these numbers are compared across different models (or model setups) in our to find the most predictive model.
We exemplify this below with our example. 

## Penalized Regression

Common applications in [!ml] have not only to deal with a lot of observations, but also frequently with a large number of variables or, in the language of [!ml], 'features'.
To imitate that, and to show an often-used procedure, all two-way and three-way interactions between all variables are calculated and added to the data set.
Interactions are often called 'polynomial features' in the [!ml] realm.
In our example, this ‘automatic feature engineering' results in 870 features (i.e., variables).
After removing all features without any variance (111), as they cannot possibly be useful in any model, the resulting data set contains 759 remaining variables, much more than regular models in social science.

To handle a high amount of variables, or high dimensionality, a common technique in [!ml] is to use _penalized regressions_.
These add a constraint parameter to the regression equation that penalizes the model for having too many parameters [@james:introductionstatisticallearning.2013; @bruce:Practicalstatisticsdata.2017].
This is also known as _shrinkage_ or _regularisation_.

### Shrinkage methods {#sec:shrinkage}

One method for penalized regressions is called _lasso_ (least absolute shrinkage operator).
Lasso shrinks all coefficients by some constant factor $\lambda$, truncating at zero.
This is also known as $L_1$ regularisation and leads to a reduced number of coefficients to be considered in the regression.
Another method is called _ridge regression_.
It utilizes $L_2$ regularisation and does a proportional shrinkage of the coefficients, imposing a penalty on their size [@hastie:ElementsStatisticalLearning.2009, 61-73].
The amount of shrinkage ($\lambda$) is a parameter of the model itself, which needs to be optimized during the model fitting process (see Section @sec:hyperparameter on hyperparameter tuning).

As a rule of thumb, ridge regression tends to be used when multicollinearity is a problem in the data, whereas lasso is used if the number of features is very large [@deshpande:ArtificialIntelligencebig.2018, 73].
In practice, however, it is often useful to try both variants and use the one that performs better along the metrics explained above (see Section @sec:model_performance).
This was also done in the present case and ridge regression was chosen because it performed slightly better.
There also exists a mixture of both variants where the _shrinkage penalty_ itself is an additional parameter of the model to optimize which is called _elastic net_ regression.
If the hyperparameter, usually called $\alpha$, is 0, elastic net reduces to a ridge regression and if $\alpha$ is 1, elastic net regressions are equivalent to lasso regressions.
In all these methods, it becomes apparent that we modify the coefficients to enhance the model performance, thus rendering them uninterpretable in the traditional sense.

### Hyperparameter tuning and Grid Search Cross-Validation {#sec:hyperparameter}

An important aspect of most [!ml] models is to tune so-called _hyperparameters_.
<!--\todo[author=JS]{The whole section relates to penalized regression right? Perhaps hat could be made a bit clearer.}-->
These are parameters that influence the way the models are trained and choosing these can have a great impact on model performance.
Almost all ML models have these hyperparameters that need to be optimized to become the best possible model.
We present here the general procedure using ridge regression introduced above.
_Hyperparameter tuning_ describes the process of estimating models with multiple different combinations of the hyperparameters on the training data and choosing the hyperparameter combinations with the most predictive power.
This process usually includes two elements: _cross-validation_ and _grid-search_.

_K-Fold cross-validation_ means that we only use observations in the test data to tune model parameters in order to avoid overfitting.
It describes an approach in which the training data is split into $K$ (it is often set to 5 or 10) equally sized parts where $K-1$ parts are used for training and the remaining part is used for validation.
This is repeated $K$ times until every part of the data has been the test set exactly once.
Usually, the average of all $K$ model validation metrics is taken, resulting in numbers where all parts of the data are part of the training _and_ the validation step for the computational cost of having to train $K$ models instead of one to validate their predictive power.

Once we defined on _what_ data we optimize parameters, we need to set _how_ to do that.
A common approach to this end is called _Grid Search cross-validation_.
The term to be clarified here is _Grid Search_: to do a grid search we define a grid of all possible parameter combinations of our hyperparameters and create cross-validated models for each combination.
Already with a limited number of hyperparameters, this becomes a very computationally costly procedure.
Therefore, the parameter grid should be chosen with care.
Ridge regression, as mentioned earlier, only has a single hyperparameter $\lambda$.
A grid search cross-validation on 50 different possible values revealed 0.045 as the value of choice for the final model.

Evaluated on our held-out test data, this model achieves 69.90\% accuracy, recall of .766, precision of .708, and an F1-score of .735.
Compared to the simple logistic regression, this is an increase in accuracy of around 1\%.
In other words, we classify 54 more cases correct when using the ridge regression model.
The differences in recall and precision tell us, that the ridge regression model misses slightly more true positive cases but does better in deciding whether or not a case is positive or not.

## Random Forest

<!--\todo[author=JS]{I am wondering how this relates to penalized regression just discussed. Are PR and RF two different techniques or do they somehow come together in one analysis? }-->
We now turn to another family of models: random forests.
[!^rf!] is an algorithm from the family of ensemble methods, meaning it is a compound of multiple algorithms called _Decision Trees_.
Ensemble methods exploit the concept of majority voting, where multiple simple models are trained to capture different aspects of the data and the prediction is the outcome most models agree upon [@bonaccorso:MachineLearningAlgorithms.2017, 154].

### Decision trees

A Decision Tree is, as one would imagine, a tree of binary decisions on the data.
The order of the decisions and the cut-off points according to which a decision is made are the things that are learned by maximizing an impurity measure like _gini_[^impurity] or _cross-entropy_.
The trees in a (random) forest are generally simpler, in a way that they have fewer nodes (one could imagine them more like tree stumps) than a single decision tree would have.
Interestingly, this has been shown to improve the predictive performance and, most importantly, makes the [!rf] less susceptible to overfitting compared to a single Decision Tree [@lantz:MachineLearningDiscover.2015, 361].

We will use 'bagged' trees here, which means that 'bags of features' (in the sense of multiple) are considered at every decision node.
It is worth mentioning that there exists another group of ensemble trees called 'boosted trees'.
A very popular member of this relatively new group of algorithms is _AdaBoost_ [@freund:DecisionTheoreticGeneralizationOnLine.1997].
They have shown to be very powerful because their trees are trained sequentially (instead of simultaneously) and trees later in the sequence can learn from the misclassifications of earlier ones.

The [!rf] implementation used here has two hyperparameters to tune[^ntree]: the number of features to be considered at each decision node (`mtry`) [see also, @lantz:MachineLearningDiscover.2015, 369-375], and `min.node.size`, the minimum size of the terminal nodes in every tree.
The latter implicitly defines the maximum depth of our trees.

The grid of our search was carefully chosen to reflect the expected space of parameters.[^cv]
Applying this procedure, a model that considers 5 features at each node with a minimum terminal node size of 4 is selected.
This model shows an accuracy of 68.96\%, a precision of.761, recall of .698 and a resulting F1-score of .728 on our test data.
It therefore performs almost equally compared to the logistic regression regarding the predictive power in this case.
Better tuning and more careful pre-processing could lead to slightly better performance here, but for the purposes of this chapter, this model is sufficient.
Because decision trees and [!+rf] are non-parametric models, they can, compared to logistic regression, reveal non-linear relationships in the underlying data [@dangeti:StatisticsMachineLearning.2017, 134].

[^impurity]: We will not go into detail about the differences of impurity measures here and use gini throughout the rest of this chapter.
[^ntree]: We keep the number of trees in our forest at the default of 500 as we do not expect to gain much predictive performance of this parameter in our case.
[^cv]:
    In our case, we chose the values $1$ through $7$ for the number of features per decision node and $(1, 2, 3, 4, 10, 20, 50, 80, 100)$ for the minimum size of the terminal nodes in every tree.
    Combined with $5$-Fold cross-validation, this results in estimating $7\times9\times5 = 315$ models.

### Interpreting ML models

Usually, to investigate a [!rf] model, research look first at the feature importances.
These reflect the relative influence each feature has on the resulting predictions.
Figure @fig:rf_feature_importance shows the relative feature importance of all predictors in our [!rf] model (excluding the country dummy variables).
These paint a similar picture as our logistic regression with the two human values dimensions (self-transcendence and conservation) being the most important predictors, followed by age and education.
Religiosity and self-placement on the left-right scale contribute roughly half as much to the prediction compared to the human values dimensions.

![Feature importances of all non-country features in [!rf].](rsc/images/rf_feature_imp.png){#fig:rf_feature_importance .center width="100%"}

The feature importances are easy to compute but have two major drawbacks. First, due to the relativity of the measure, one cannot draw any conclusion about the _absolute contribution_ of each feature to the prediction.
In other words, the strength of the regression coefficients social scientists most often use, is not available.
Secondly, it is not possible to determine the _direction_ of the effects on the predicted outcome.

Especially the latter point is the main reason for social scientists to run statistical analyses in the first place and is, in linear models, usually determined by the sign of the coefficients.
Random forests, however, are highly non-linear by design, meaning that each feature can have different impacts on the predicted outcome, depending on the actual feature value of an observation.

In [!ts] non-linear effects (often introduced by interaction effects in regression models) are oftentimes visualized using marginal effects.
The same can be done for [!ml] models.
Traditionally, this was done using [!+pdp], which serve exactly this purpose but suffer from another drawback: [!+pdp] tend to show non-sensical effects if the features are correlated.
Therefore, a more advanced technique is the inspection of [!ale] plots [@apley:Visualizingeffectspredictor.2020], which serve the same purpose but are, in contrast to [!+pdp], still correct if the respective features are correlated.
[!^ale] plots are centred around zero on depict the relative effect of a variable on the predicted outcome.
<!--\todo[author=JS]{Perhaps below, explain a bit better how the interpretation of an ALE works. (see comments below as well)}-->

![[!^ale!] plots for features of interest in RF. The y-axes depict the [!ale] values.](rsc/images/rf_ale.png){#fig:rf_pdp .center width="100%"}

This allows assessing whether the relationship between a selected feature and the outcome is linear, monotonic, or more complex.
Figure @fig:rf_pdp shows the [!+ale] for all numerical features in the [!rf] model.
The value depicted on the y-axis (the ALE) 'can be interpreted as the main effect of the feature at a certain value compared to the average prediction of the data' [@molnar:InterpretableMachineLearning.2019, 131].
A ALE value of around .2 for 5 years of full-time education, for example, indicates that the predicted outcome is .2 higher (a 20\% increase in probability of negative attitudes in this case) than the average prediction.
The black vertical bars at the bottom of the numerical features indicate the number of cases that the ALE calculations are based on and are a measure of how confident one can be in these values.
For example, the small number of cases with 'Self-Transcendence' values of less than -1,is an indication the results in this feature range should be treated with extreme caution.
<!--\todo[author=JS]{It would be very helpful if you could briefly explain how to read that plot. E.g., what exactly does the y-axis show? (see comment in the figure as well).}-->
Compared to the results of the logistic regression earlier (see Table @tbl:logreg), the linear trends of the [!rf] model point in the same directions.
Additionally, however, the [!rf] reveals some non-linear relationships in our data.<!--\todo[author=JS]{That’s really fascinating!}-->
According to our model, self-transcendence and conservation are only changing the predicted outcome once their values become positive.
In a way, it looks like it does not matter too much *how* negative the values are but only *if* they are negative.
A similar effect can be seen when looking at the self-placement on the left-right scale which is starting to increase at roughly the value of 4.
The effect of education seems to be of a more dichotomous fashion, with low values indicating more tendencies towards a rejection of immigrations whereas high values indicate the opposite.
Again, the exact amount does not seem to drive the predictions, but rather whether someone has received much or little education is decisive.<!--\todo[author=JS]{That’s a fantastic insight!}-->
The effect of religiosity looks like a slightly skewed inverse u-shape rather than being linearly negative, as the logistic regression would suggest, with the highest predicted probabilities for rejection of immigrants at around 5 on the religiosity scale.

# Discussion

<!--
\todo[author=JS]{regarding discussion: see markdown comment; RH: ist der erste block v JS comments hier addressiert?}

Very nice discussion! 

Perhaps clarify better when (e.g. for which types of research questions) somebody would turn to ML rather than TS. Furthermore, is it possible to some how combine findings obtained from ML and TS to bundle each methods strengths and mitigate/compensate each one’s weakness? 

At the end you could perhaps make a recommendation whether and how ML techniques could be integrated into the training of social scientists (I have rarely seen any quantitative methods course that would address ML techniques). 

Furthermore, it would be nice if you could perhaps (at the very end) refer the reader to some introductory books / readings just to have a starting point into the new brave world of ML in social science.
-->

This contribution tried to illustrate similarities and differences between approaches using [!ts] or [!ml].
Social scientists face a trade-off when it comes to using [!ml].
On the downside, features (i.e., independent variables) can only be ranked by importance. This stands in contrast to more fine-grained information provided by a typical regression coefficient, in particular, its direction, but also the strength of effects.
On the upside, focusing on models' predictive capabilities, like in any [!ml] application, shifts the attention to explanations that are closer to scientific reasoning and less prone to mirror common sense [@wattsCommonSenseSociological2014].
It is 'this potential predictive force which gives scientific explanations its importance' [@hempelStudiesLogicExplanation1948, 138], which is inherently neglected by goodness of fit measures solely relying on in-sample observations.
Instead, using out-of-sample is a crucial part of any [!sml] procedure, i.e., applying the trained model to unseen test data.
Integrating this inherent property of [!ml] would at least reduce an important weakness of [!ts] and could even boost, following Watts' line of argumentation, social scientists reasoning more generally.

Those important benefits notwithstanding, we would like to emphasize that [!ml] is no cheat code, it is all statistics.
Everybody with a professional background in quantitative social science has learned many [!ml] tools, be it [!uml] like cluster analysis or [!sml] like logistic regressions.
Yet, how those methods are used (and promoted) in [!ml] contexts, might starkly differ from common social science approaches and researchers' training.
Regardless of which features drive a model and how an outcome could be explained, the main interest of [!ml] researchers in industry and science is that 'the model works', i.e., that the model provides good predictions.
This is an important, though merely _epistemological_, difference from statistical models used in social science.
One consequence for future social scientists might be, at the very least, to engage with the ideas of [!ml]; a knowledge resource that is only slowly trickling into social science curricula. 
Already knowing about the epistemological framework of [!ml] might therefore provide important insights for social scientists.

Going further, it might also be helpful for social scientists to acknowledge the differences laid out in this paper and pay closer attention to the predictive power of [!ts] models.
In addition, non-linear effects could be explored by tools like [!rf] and, hence, also inform theory-building [@grimmer:MachineLearningSocial.2021].
We are **not** advocating for [!ml] to replace [!ts] but rather suggest that social scientists familiarize themselves with these new methods as the might provide fruitful ways to _complement_ existing regression models.
Hopefully, this contribution showed interested readers what can and what cannot be done with [!ml] methods and how to apply those parts of the [!ml] universe that are actually useful to us when it comes to predicting an outcome.