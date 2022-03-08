---
# Bibliography
csl: rsc/library/style.csl # See https://www.zotero.org/styles for more styles.
bibliography: rsc/library/references.json
csquotes: true

title: 'Regression and Machine learning'

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

abstract: "Machine learning (ML) techniques have become one of the most successful scientific tools and changed the everyday-life of people around the globe (e.g., search engines). Due to the internet, a vast amount of new data sources on human behavior have emerged and opened the door for computer scientists to apply ML on social phenomena. In the social sciences, however, the adoption of ML has been less enthusiastic. To investigate the relation of traditional statistics to ML, this paper shows how ML might be used to substitute regression analysis. For that purpose, we illustrate what a typical social science approach might look like and how using ML techniques could contribute additional insights when it comes to estimators (non-linearity) or the assessment of model fit (predictive power). In particular, we reveal how *epistemological* differences shape the potential usage of ML in the social sciences and discuss the methodological trade-off of applying ML compared to traditional statistics."

keywords: 'regression, artificial intelligence, machine learning, ess'

titlepage: true
toc: false # Table of contents

---

\listoftodos
# Introduction

Research in the social sciences has been shifting towards a new era.\todo{RHH: check title -> sollte nur leicht geändert werden (weil schonmal mit skopek iteriert) und knackig sein; neuer versuch, s.o.}
In the prior century, the focus laid mainly on variable-based, theory and hypothesis-driven approaches to give answers to societal questions.
Data for such approaches was scarce, hard to come by, and expensive [@grimmer:MachineLearningSocial.2021].
The internet changed that. 
Digital data is comprehensive, ubiquitous, and, in general, cheap to retrieve.
While the availability of such data opens up new roads and possibilities, it creates the necessity for adequate forms of analysis [@mcfarland:SociologyEraBig.2016; @lazerComputationalSocialScience2020].
Along with those new datasets, data sources, and an explosion in available computing power, new techniques for analyzing social phenomena were developed rapidly, often by integrating knowledge from other disciplines into an emerging field of "Computational Social Science" (CSS) [@heibergerInstallingComputationalSocial2016].

In particular, social scientists increasingly use tools from computer science and, in particular, [!ml]. 
Methods subsumed under [!ml] can be described as "a class of flexible algorithmic and statistical techniques for prediction and dimension reduction" [@grimmer:MachineLearningSocial.2021, 396].
Applications of [!ml] comprise some of the most important technological innovations in recent years, for instance, gene prediction or search engines [@jordan:MachineLearning.2015]. 
No problem seems too complex as long as researchers have enough (i.e., very large) data, even previously unsolvable questions might be solved, e.g., how to maintain high-temperature plasma for nuclear fusion [@degraveMagneticControlTokamak2022]. 
Thus we ask: given the already impressive resume and even greater potential of [!ml], is it only a matter of time until it replaces [!ts] used in social science?

As we will see, differences of [!ml] and [!ts] are (mostly) grounded in different epistemological perspectives. 
While recent overviews characterize ML-related methods and provide guidance for future research  [@molina:MachineLearningSociology.2019; @grimmer:MachineLearningSocial.2021], our contribution's goal is to point out key differences and commonalities between [!ts] and [!ml]. 
We will illustrate what a typical social scientists' approach might look like and how using [!ml] techniques could potentially contribute additional insights or change the results. 
For this purpose, we will first elaborate on some theoretical differences and similarities between [!ts] and [!ml]. 
We will then exemplify those differences by using a well-known dataset, the [!ess] [@ESS.2002].
In particular, we will focus on two main parts of any regression\todo[author=LE]{klären, ob wir regression oder classification machen} analysis: estimators and goodness of fit. 
By comparing logistic regressions and two popular [!ml] algorithms (Random Forest, Ridge Regression), we will explain how [!ml] works and, more importantly, how they are typically used by researchers outside the social sciences.[^git]
In so doing we will reveal how *epistemological* differences shape the potential usage of [!ml] in the social sciences and discuss the methodological trade-off when it comes to the question of whether to apply [!ml] or [!ts]. 
<!--As is often the case, combining both seems like the most promising way. -->

[^git]: All code and descriptions to use the ESS are available on https://github.com/luerhard/chapter_regression_and_artifical.git.

# Traditional statistics and digital data
Statistics became widely employed in the landscape of all social sciences from the 1950s onward [@plattHistorySociologicalResearch1998]. 
Platt’s [-@plattHistorySociologicalResearch1998] historical account of sociological methods argues that studies from 1920 to 1940 lacked external funding and were mainly qualitative by design (interviews, ethnography). 
In the following decades, this changed as surveys and statistics became the main instruments for social scientists [@converseSurveyResearchUnited2009]. 
The quantification and numeric measurement of social phenomena through surveys, the subsequent approximation of complex concepts in variables, together with increasing computing power, can be seen as last “watershed moment” of empirical social research. 
The paramount of research activities shifted during this process from ethnographic community studies to an individualistic perspective which was inherent to survey questions [@porterModernSocialSciences2003]. 

Reflecting changes in methods, new theoretical programs came into fashion. 
For instance, rational choice theory with its methodological individualism was well-suited to explain variable-centered research questions and became a prevalent taste of many sociologists [@colemanFoundationsSocialTheory1990]. 
The usage of surveys, the resulting availability of a new kind of data, and easier access and higher acceptance of causal models occurred in other social sciences as well. In psychology and economics, for instance, general methodological subfields emerged (psychometrics and econometrics respectively [@rafteryStatisticsSociology19502001].
In the wake of variable-driven data retrieval came the advent of regression models, factor analysis, and other statistics in sociology, although those methods were considered “esoteric expertise” [@abbottSystemProfessions1988, 147] until the late 1960s.

Thus, the shift to quantitative research was fueled by fundamental changes in research content (survey), techniques (regressions), and technology (computers).
Social scientists face a similar situation today. 
The flux of research fashions and increasing diversity of the field has picked up steam as a new era of big data and super-computing has arrived [@mcfarland:SociologyEraBig.2016]. 
For more than a decade, the internet has changed the lives of most people in industrialized countries providing the means to use all sorts of digital traces (e.g., connections, profiles, or communications) as data on social behaviors and systems. 

Social scientists have been slower to utilize the possibilities of new data and computational methods [@heibergerInstallingComputationalSocial2016], compared to computer scientists and engineers who have embraced the analysis of large social data and actively developed research programs to "conquer" this domain [@conteManifestoComputationalSocial2012].
Part of the answer may be found in the underlying research program of [!ts] that dominates quantitative research in the social sciences.
It builds off inferential statistics and Karl Popper's formalizations [@popper:LogicScientificDiscovery.1968], i.e., testing falsifiable hypotheses, derived from (general) theories.
This foundation of testing theory-based assumptions describes a way of generating knowledge about a small part of a population and generalizing it to its entirety [@krzywinski:Importancebeinguncertain.2013].
One main pillar of this approach is to calculate the probability of this generalization being wrong. 
Hence, social scientists rely heavily on thresholds upon which we accept or reject  assumptions, most often considered to be at the 5%-level.

While this frequentist approach is well-suited for carefully conducted surveys, it bears some significant shortcomings for digital data. 
One severe methodological challenge is tied to *sample characteristics.* 
Most of the frequentist approaches are prone to sample sizes (e.g., all chi-squared-based test-statistics). 
Testing for significance with very large sample sizes will almost always generate significant results, rendering those tests meaningless. 
This problem is amplified by the source of many popular digital data, e.g., social media platforms like Twitter.
Inferences and significance levels are then, at best, possible for the underlying population, hence, the platform's users [@lewisThreeFallaciesDigital2015].
Most often, however, we do not know much about users' characteristics, or how they relate to (parts of) the general population [@hargittaiPotentialBiasesBig2020]. 
In addition, the efficient estimation and interpretation of regression coefficients relies on non-independent and identically distributed observations. 
This is often not the case for samples from digital data, e.g., when it comes to all data gathered on social networks (of which dependency is an inherent property).

Another important challenge for [!ts] analyzing digital data relates to the ubiquity of *linear* models [@abbott:TranscendingGeneralLinear.1988]. 
But what if relationships are non-linear? 
It is very difficult to model non-linear relationships with models from [!ts].
Some argue that is because of the omission of counterfactual language [@pearlBookWhyNew2018, 329-35], while others may point to the problem of overfitting when introducing polynomial terms in linear regressions [@molina:MachineLearningSociology.2019]. 
In any case, the consequence is that theories and results in social sciences can almost never, methodologically, consider non-linear relations. 
A circumstance that is astonishing, given the complexity of social phenomena.
One of the great promises of [!ml], in contrast, is to offer ways to measure non-linear effects, as we will discuss below.

<!-- leftovers:
Questions around model _validity_ became central for the upcoming new methods.
4. What if you have no theory, you can derive hypotheses from? This is especially important for social media networks, where the rules of engagement might differ quite substantially from 'normal' social behavior or where you cannot specify your population.
-->

# Machine Learning in the social sciences
[!ml] summarizes statistical methods in which computers learn from data and extract information. 
While [!ml] represents a breakthrough in computer sciences, its adoption in the social sciences is less enthusiastic [@molina:MachineLearningSociology.2019].
In contrast to the usage of inferential statistics, the application of [!ml] does not (yet) rest on established methodological principles and assumption as in [!ts]. 

In general, we can distinguish two paradigms when it comes to [!ml]: _[!sml!]_ and _[!uml!]_ [e.g., @jordan:MachineLearning.2015].
While [!sml] uses *labeled* data as input to predict outcomes of *unlabeled* data, [!uml] derives patterns in (unlabeled) observations by exploiting statistical properties of the data. 

[!uml], in essence, are aiming to create categorization schemes or typologies. 
Researchers so inductively define types along derived dimensions and represent each case relative to the types given its underlying values.
Resulting (ideal-)types are arguably among the most important methodological tools of social scientists and have been used for a long-time. 
Prominent [!uml] techniques comprise cluster analysis, principal components, or latent class analysis. 
[!uml<]’s main purpose is therefore to explore data and reduce its complexity.
Researchers might use the output as input for further analysis [@heibergerFacetsSpecializationIts2021] or to develop theoretical models [@hallIntroductionVarietiesCapitalism2001].

Thus, those exploratory techniques are by no means new to social sciences.
However, [!uml] does provide novel ways to analyze large amounts of text and social networks, both kinds of data often associated with the digital age and computational social science [@heibergerInstallingComputationalSocial2016]. 
In particular, the "automatic" categorization of large corpora has found many applications to social phenomena [@evans:MachineTranslationMining.2016]. 
Topic models, for instance, represent one of the most used [!nlp] tools in the social sciences [@mcfarland:DifferentiatingLanguageUsage.2013; @heibergerFacetsSpecializationIts2021]. 
In addition, the detection of communities in networks resembles prominent ideas of social groups [@fortunato:CommunityDetectionGraphs.2010]. 

The importance of [!uml] notwithstanding, we will focus on [!sml] in this contribution. 
Many people might first think on [!sml] when it comes to [!ml].
Methods under the umbrella of [!sml] also witnessed the largest performance boost due to increases in the availability of digital data.
Methodologically speaking, almost all instances of [!ai] are [!sml], i.e., models intended to predict an outcome with a given set of features.
That is the same principle as when social scientists speak of estimating a dependent variable by the means of independent variables.

Thus, how does [!sml] actually compare to [!ts]?
There are two main answers to that, in our view, crucial question, one is epistemological, the other practical.
While [!ts] infers\todo{achtung: plural/singular richtig nach abbreviations (s-endung bei verben oder nicht)} models that *explain* how an outcome is generated with unbiased and consistent estimators, [!sml] does not care about interpretability.
While the coefficients are the most interesting part of regressions for social scientists, the features are of little to no interest for typical [!ml] use cases.
Instead, the main goal of [!sml] is how to best forecast the outcome.
Thus, [!sml] models do not need to care about meaningful interpretations or unbiased estimators.
This is a crucial epistemological difference and yields many practical consequences.

Foremost, the prioritization of predictions affords an "out-of-sample" testing, i.e., the ability of models to predict unknown and, hence, unlabeled, observations.
Thus, unlike most social scientists using *one* dataset for modeling efforts, SML consists of at least two datasets: training and test data.
The training data is used to develop the model, the second to test its predictive capacity on out-of-sample data. 
Often, the train and test sets are randomly sampled from the same dataset which is split, e.g., 50/50. 
That means properties like autocorrelation or multicollinearity are merely treated as features, not as problems like in inferential statistics. 

This approach stems from its practical success in many commercial applications. 
Engineers of almost all large companies focus on improving the prediction of customer behavior.
Of course, firms with digital business models profit most from [!sml<]'s predictive power. 
Consider, for instance, a company that sells wine online. 
Given a certain record of orders and a large enough customer base, the company can use the characteristics of their data (e.g., price, grape, origin, quality, vineyard, etc.) to make recommendations for further purchases.
Those suggestions might also be based on information about what other customers might have bought. 
In any case, the wine shop will mostly be interested to develop models "that work", i.e., engineers or consultants might typically approach this task without any concern for theory or explain *why* somebody bought something. 
It suffices to make suitable recommendations (i.e., predictions) to improve sales. 

Given the priority of prediction, many restrictions of [!ts] are no longer concerns of [!ml] researchers.
If interpretation (or explanation) is not the aim, the use of powerful “black-boxes” like multi-layer neural networks or high-orders of interaction effects becomes an attractive option.
Almost all deep-learning efforts rest on such black-boxes, which are only of limited use for social scientists.
The same is true for using thousands of (potentially co-linear) variables in a model.
This practical approach also allows regularization of variance and empirical tuning of parameters [@mullainathanMachineLearningApplied2017]. 
Instead of being prone to overfitting (like [!ts] models), [!sml] uses the training data and tunes regularizers to fit the data at hand (number and effect differing by algorithm).

We will illustrate such a typical [!sml] workflow on two examples in the remainder of this contribution.
We will focus on illustrating the use of [!ml] for "classifications" instead of "regressions" in order to keep the analysis as comprehensible as possible.[^language] \footnote{In the language of [!ml], this translates into using a categorical, often binary, dependent variable (i.e., solving a "classification" problem), while employing "regressions" refers to techniques that use continuous outcomes.}
In particular, binary outcomes have the advantage to yield relatively simple indicators for model performance, confusion matrices. 
Nevertheless, those are among the most common concepts of [!ml] and so provide a useful case for the purposes of this contribution.
All derived conclusions, however, do apply for "regressions" (in the [!ml] sense) too. 

[^language]: In the language of [!ml], this translates into using a categorical, often binary, dependent variable (i.e., solving a "classification" problem), while employing "regressions" refers to techniques that use continuous outcomes. This might be a bit confusing for social scientists first.

# A comparison by example: Immigration in Europe

It might come as a surprise for some readers, but often the algorithms used in machine learning are quite similar, if not even exactly the same, as in traditional quantitative social sciences.
Logistic regression, [!ols] regression, and [!pca], for example, are readily used in both camps. 
Even though many of the algorithms are the same, the mindset, practical approach, and evaluation strategies differ.
First, and in stark contrast to [!ts] models, [!ml] models usually do not have any usable, that is interpretable, coefficients.
Secondly, model evaluation works by evaluating its predictive power.

To illustrate the epistemological differences, we will use an exemplary model and approach the problem from both angles.
The chosen model is loosely based on the approach used by @davidov:ExplainingAttitudesImmigration.2012 and others; it has often been implemented in similar ways\todo{ein paar (wenige) cites dafür?}.
It investigates the effect of human values on attitudes toward immigration.

The explanandum, our dependent variable which we will call _reject_, is a measure that represents _attitudes towards immigration_.
It is a mean index consisting of three variables[^av] which have been shown to load strongly on a single dimension in a confirmatory factor analysis.\todo{where has it been shown?}
To show the [!ml] workflow in its simplest form, binary classification, the resulting variable is dichotomized at the scale's mean value.
To measure human values, we use the theory of basic human values [@schwartz:UniversalsContentStructure.1992] which is captured in the [!ess] surveys.
The theory describes 10 basic values that are structured in two dimensions[^schwartz]: _conservation_ and _self-transcendence_.

Some theoretically founded expectations of this model can be formulated.
Conservation values "that include appreciation of stability of society, and respect, commitment and acceptance of the customs and ideas that traditional culture or religion provide. In other words, the arrival of immigrants is coupled with potential societal changes that are opposite to the preferences of conservative individuals" [@davidov:ExplainingAttitudesImmigration.2012, 761].
Therefore, more conservative individuals are expected to reject immigration.
In contrast, "self-transcendence values include understanding, appreciation, tolerance and protection for the welfare of people and for nature. The arrival of immigrants provides opportunities for individuals to realise these self-transcendent values. In other words, the arrival of immigrants is coupled with potential societal changes that are in harmony with the preferences of self-transcendent individuals" [@davidov:ExplainingAttitudesImmigration.2012, 761].
Hence, we expect more self-transcendent people to support immigration.

We control for _income_, which is measured with the variable `hincfel` and asks about the feeling about the household's present income.
It is chosen over the objective household income to reduce the number of missing values.
Additionally, we control for _age_ (`agea`), _religiosity_ (`rlgdgr`), _education_ (`educyrs`), self-position on a _left-right scale_ (`lrscale`), _gender_ (`gndr`), and country (`ctry`).

[^av]: The variables used here are asked on a 4-point scale how many immigrants of different groups respondents would like to allow into their country. 1. many/few immigrants of different race/ethnic groups e(as majority) `imdfetn`, 2.  many/few immigrants of same race/ethnic groups (as majority) `imsmetn`, 3. many/few immigrants from poorer countries outside Europe `impcntr`.
All items are recorded so that higher levels indicate more accepted immigrants.

```{.table #tbl:logreg}
---
alignment: LRRRR
caption: Logistic regression on all data. Country dummy variables are omitted for clarity.
include: rsc/tables/logreg.csv
markdown: true
---
```

Table @tbl:logreg\todo{bei kleinen p-values einfach < 0.001 eintragen?} reveals the results of the logistic regression.
We see highly significant effects for all variables except gender with age, self-placement on the left-right scale, and conservation being positively correlated whereas education, satisfaction with income, religiosity, and self-transcendence are negatively correlated with the rejection of immigration.
Except for the non-significance of gender, our results are very similar to @davidov:ExplainingAttitudesImmigration.2012.\todo{sind sehr ähnlich, oder? ansonsten gerne andere formulierung, aber "generally comparable" hört sich ziemlich unähnlich an...}
That said, we use a drastically simplified model and would not advise drawing any substantial conclusions from it.
We use this model only for didactic purposes to compare methods of [!ts] to [!ml].

[^schwartz]: The measures are constructed according to the ESS website. All items were recorded so that higher levels indicate more agreement.
 
## Evaluating model performance

Social scientists use a plethora of (pseudo) $R^2$ measures to assess the goodness of fit of a model, or the Akaike / Bayesian information criterion (AIC/BIC) to compare and select models at their disposal.
The basic idea behind these procedures is always the same: utilize all data available to optimize the model and tell us how well our model fits the underlying data.
Herein lies the probably biggest difference to machine learners' aims.
While [!ml] needs to *predict*, social scientists tend to *overfit* their models.
Yet, overfitted models can only rarely be replicated in other samples (i.e., are bad in predicting unseen data), because they fit the data at hand "too good" and are prone to "p-hacking". 
That creates considerable uncertainty about such models merits and casts considerable doubts if those explanations should be even considered as scientific [@wattsCommonSenseSociological2014].

To overcome the obstacle of overfitting, it has become customary to split the data set into multiple parts and only to use part of the data to train the model and the rest of the data to evaluate the predictive performance.
We call this the _train-test-split_.
It allows us to evaluate if our models only learn the noise (unexplained variance) in our data in a way that it can predict data that it has never seen before.
A drawback of this procedure, of course, is that we are not able to evaluate the model on all data, so there is a trade-off to be made when deciding on how large the test set should be.
Larger test sets usually mean higher confidence in the validation results but they come at the price of reduced available data for the training step.
In the case at hand, 20\% of the data (5432 cases) is separated into the test set.
This data will only be used for model inspection and evaluation.

Classification models are evaluated using a so-called *confusion matrix*; a cross-tabulation of the actual and the predicted outcomes.
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

[!+^tn] represent the number of correct predictions for the "negative class" (e.g., the absence of a class, most often 0), [!+tp] the number of correct predictions for the positive class, respectively.
[!+^fn] show the number of incorrect predictions for the negative class, whereas [!+fp] depict the number of incorrect positive predictions.
Many important goodness-of-fit metrics can be derived from this matrix. 
We will illustrate two of the most common measures, _accuracy_ and *F1-score"*.
Both metrics range from 0 to 1, with higher values indicating better models.

_Accuracy_ denotes the number of correctly classified data instances of the total number of data instances:

$$
Accuracy = \frac{TP + TN}{TP + FP + FN + TN}
$$
Accuracy is a valuable general measure as long as the data contains roughly equal amounts of [!tp] and [!tn], but it is very susceptible to _class imbalance_, meaning that one class has a higher prevalence in the actual data than the other.
Take, for example, a data set containing a rare outcome with $TN = 90$ and $TP = 10$; a model that only predicts $0$ would achieve an accuracy of .9 as it will predict 90\% of all cases correctly, even though it is most certainly not a very good model.

So there is a need for metrics that take imbalanced classes into account.
Most commonly, the literature refers to two distinct measures, the first being _precision_:
$$
Precision = \frac{TP}{TP + FP}
$$
Precision (also called _positive predictive value_) describes the proportion of correct positive predictions over all positive predictions.
Hence, it answers the question: "how many of my positive predictions are actually correct?".
This metric is commonly supplemented by another: _recall_ which is defined as:
$$
Recall = \frac{TP}{TP + FN}
$$
Recall (also known as _sensitivity_) describes the fraction of correct positive predictions over all cases for which a positive prediction would have been correct.
It thereby answers the question: "how many positive predictions did I miss?".

Both measurements are usually merged into one metric, the _F1-score_.
It is defined as the harmonic mean of both and therefore penalizes extremely low values in either:
$$
F1 = 2 * \frac{Precision * Recall}{Precision + Recall}
$$
To be comparable to the models presented below, the logistic regression from above is rerun on the training data set and evaluated on the test set.
The results are shown in the following confusion matrix:

```{.table #tbl:logregconfmat}
---
alignment: LCCR
width: [0.1, 0.2, 0.2, 0.1]
caption: Confusion matrix for logistic regression.
markdown: true
---
, predicted 0, predicted 1,  **sum**
true 0, 2299, 1022, **3321**
true 1, 670, 1441, **2111**
**sum**, **2969**, **2463**, **5432**
```

From this data, an accuracy of 68.85\%, recall of .7743, precision of .6923, and a resulting F1-score of .731 can be computed.\todo{interpret / Überleitung}

## Penalized Regression

Common applications in [!ml] have not only to deal with a lot of rows, but also with a often large number of variables (or features in the [!ml] language).
To imitate that, and to show an often used procedure, all two-way and three-way interactions between all variables are calculated and added to the data set.
Interactions are often called 'polynomial features' in the [!ml] realm.
After removing all features without any variance (111), as they cannot possibly be useful in any model, the resulting data set contains 759 remaining variables, much more than regular models in social science.

To handle a high amount of variables, or high dimensionality, a common technique in [!ml] is to use *penalized regressions*.
These add a constraint parameter to the regression equation that penalizes the model for having too many parameters [@james:introductionstatisticallearning.2013; @bruce:Practicalstatisticsdata.2017].
This is also known as _shrinkage_ or _regularization_.
One method for penalized regressions is called _lasso_ (least absolute shrinkage operator).
Lasso shrinks all coefficients by some constant factor $\lambda$, truncating at zero.
This is also known as $L_1$ regularization.
This leads to a reduced number of coefficients to be considered in the regression.
Another method is called _ridge_ regression.
It utilizes $L_2$ regularization and does a proportional shrinkage of the coefficients, imposing a penalty on their size [@hastie:ElementsStatisticalLearning.2009, 61-73].
The amount of shrinkage ($\lambda$) is a parameter of the model itself, which needs to be optimized during the model fitting process (see Section @sec:hyperparameter on hyperparameter tuning).

As a rule of thumb, ridge regression tends to be used when multicollinearity is a problem in the data, whereas lasso is used if the number of features is very large [@deshpande:ArtificialIntelligencebig.2018, 73].
In practice, however, it is often useful to try both variants and use the one that performs better.
This was also done in the present case and ridge regression was chosen because it performed slightly better.
There also exists a mixture of both variants where the _shrinkage penalty_ itself is an additional parameter of the model to optimize which is called _elastic net_ regression.
If the hyperparameter, usually called $\alpha$, is 0, elastic net reduces to a ridge regression and if $\alpha$ is 1, elastic net regressions are equivalent to lasso regressions.

### Hyperparameter tuning & Grid Search Cross-Validation {#sec:hyperparameter}

An important aspect of most [!ml] models is to tune so-called _hyperparameters_.
These are parameters that influence the way the models are trained and choosing these can have a great impact on model performance.
_Hyperparameter tuning_ describes the process of estimating models with multiple different combinations of the hyperparameters on the training data and choosing the hyperparameter combinations with the most predictive power.
This process usually includes two elements: *cross-validation* and *grid-search*.

_K-Fold cross-validation_ means that we only use observations in the test data to tune model parameters in order to avoid overfitting. 
It describes an approach in which the training data is split into $K$ (it is often set to 5 or 10) equally sized parts where $K-1$ parts are used for training and the remaining part is used for validation.
This is repeated $K$ times until every part of the data has been the test set exactly once.
Usually, the average of all $K$ model validation metrics is taken, resulting in numbers where all parts of the data are part of the training _and_ the validation step for the computational cost of having to train $K$ models instead of one to validate their predictive power.

Once we defined on *what* data we optimize parameters, we need to set *how* to do that. 
A common approach to this end is called _Grid Search cross-validation_.
The term to be clarified here is _Grid Search_: to do a grid search we define a grid of all possible parameter combinations of our hyperparameters and create cross-validated models for each combination.
Already with a limited number of hyperparameters, this becomes a very computationally costly procedure. 
Therefore, the parameter grid should be chosen with care.\todo{RHH: check if caret actually runs cv on gridsearch -> "By default, any `train()` object in `caret` has its hyperparameters tuned via grid search." from: https://campus.datacamp.com/courses/practicing-machine-learning-interview-questions-in-r/model-selection-and-evaluation?ex=10}
Ridge regression, as mentioned earlier, only has a single hyperparameter $\lambda$.
A grid search cross-validation on 50 different possible values revealed 0.045 as the value of choice for the final model. 

Evaluated on our held-out test data, this model achieves 69.90\% accuracy, recall of .766, precision of .708, and an F1-score of .735.\todo{compare to earlier models; 3797 correct in ridge, 3740 in normal logreg}

## Random Forest

[!^rf!] is an algorithm from the family of ensemble methods, meaning it is a compound of multiple algorithms called _Decision Trees_.
Ensemble methods exploit the concept of majority voting, where multiple simple models are trained to capture different aspects of the data and the prediction is the outcome most models agree upon [@bonaccorso:MachineLearningAlgorithms.2017, 154].

A Decision Tree is, as one would imagine, a tree of binary decisions on the data.
The order of the decisions and the cutoff points according to which a decision is made are the things that are learned by maximizing an impurity measure like _gini_[^impurity] or _cross-entropy_.
The trees in a (random) forest are generally simpler, in a way that they have fewer nodes (one could imagine them more like tree stumps) than a single decision tree would have.
Interestingly, this has been shown to improve the predictive performance and, most importantly, makes the [!rf] less susceptible to overfitting compared to a single Decision Tree.\todo{where has this been shown?}

We will use 'bagged' trees here, which means that 'bags of features' (in the sense of multiple) are considered at every decision node.
It is worth mentioning that there exists another group of ensemble trees called 'boosted trees'. 
A very popular member of this relatively new group of algorithms is _AdaBoost_ [@freund:DecisionTheoreticGeneralizationOnLine.1997].
They have shown to be very powerful because their trees are trained sequentially (instead of simultaneously) and trees later in the sequence can learn from the misclassifications of earlier ones.

The [!rf] implementation used here has two hyperparameters to tune[^ntree]: the number of features to be considered at each decision node (`mtry`) [see also, @lantz:MachineLearningDiscover.2015, 369-375], and `min.node.size`, the minimum size of the terminal nodes in every tree.
The latter implicitly defines the maximum depth of our trees.

The grid of our search was carefully chosen to reflect the expected space of parameters.[^cv]
Applying this procedure, a model that considers 5 features at each node with a minimum terminal node size of 4 is selected.
This model shows an accuracy of 68.96\%, a precision of.761, recall of .698 and a resulting F1-score of .728 on our test data.\todo{compare to earlier models}

[^impurity]: We will not go into detail about the differences of impurity measures here and use gini throughout the rest of this chapter.
[^ntree]: We keep the number of trees in our forest at the default of 500 as we do not expect to gain much predictive performance of this parameter in our case.
![Bild nicht gefunden: rsc/images/rf_feature_imp.pdf](rsc/images/rf_feature_imp.pdf "Bild nicht gefunden: rsc/images/rf_feature_imp.pdf"){#fig:rf_feature_importance .center width="100%"}ig:rf_feature_importance .center width="100%"} for the minimum size of the terminal nodes in every tree.
Combined with $5$-Fold cross-validation, this results in estimating $7\times9\times5 = 315$ models.

###  Interpreting ML models

Usually, to investigate a [!rf] model, research look first at the feature importances.\todo{Sinnvolle Einleitung zum Kapitel finden. Interpretation on heldout test data}
These reflect the relative influence each feature has on the resulting predictions.
Figure @fig:rf_feature_importance shows the relative feature importance of all predictors in our [!rf] model (excluding the country dummy variables).
These paint a similar picture as our logistic regression with the two human values dimension being the most important predictors, followed by age and education.
Religiosity and self-placement on the left-right scale contribute roughly half as much to the prediction compared to the human values dimensions.


![Bild nicht gefunden: rsc/images/rf_feature_imp.pdf](rsc/images/rf_feature_imp.pdf "Bild nicht gefunden: rsc/images/rf_feature_imp.pdf"){#fig:rf_feature_importance .center width="100%"}


The feature importances are easy to compute but have two major drawbacks. First, due to the relativity of the measure, one cannot draw any conclusion about the *absolute contribution* of each feature to the prediction.
In other words, the strength of the regression coefficients social scientists most often use, is not available.
Secondly, it is not possible to determine the *direction* of the effects on the predicted outcome.

Especially the latter point is the main reason for social scientists to run statistical analyses in the first place and is, in linear models, usually determined by the sign of the coefficients.
Random forests, however, are highly non-linear by design, meaning that each feature can have different impacts on the predicted outcome, depending on the actual feature value of an observation.

In [!ts] non-linear effects (often introduced by interaction effects in regression models) are oftentimes visualized using marginal effects.
The same can be done for [!ml] models.
Traditionally, this was done using [!+pdp], which serve exactly this purpose but suffer from another drawback: [!+pdp] tend to show non-sensical effects if the features are correlated.
Therefore, a more advanced technique is the inspection of [!ale] plots [@molnar:InterpretableMachineLearning.2019], which serve the same purpose but are, in contrast to [!+pdp], still correct if the respective features are correlated.


![[!^ale!] plots for features of interest in RF.](rsc/images/rf_ale.pdf){#fig:rf_pdp .center width="100%"}

This allows assessing whether the relationship between a selected feature and the outcome is linear, monotonic, or more complex.
Figure @fig:rf_pdp shows the [!+ale] for all numerical features in the [!rf] model.\todo{gender effect mit aufnehmen? default plot hat unangenehm große Balken, man sieht keinen Effekt -> gerne raus}
Compared to the results of the logistic regression earlier (see Table @tbl:logreg), the linear trends of the [!rf] model point in the same directions.
Additionally, however, the [!rf] reveals some non-linear relationships in our data.
According to our model, self-transcendence and conservation are only changing the predicted outcome once their values become positive.
In a way, it looks like it does not matter too much **how** negative the values are but only **if** they are negative.
A similar effect can be seen when looking at the self-placement on the left-right scale which is starting to increase at roughly the value of $4$.
The effect of education seems to be of a more dichotomous fashion, with low values indicating more tendencies towards a rejection of immigrations whereas high values indicate the opposite.
Here again, the exact amount does not seem to drive the predictions, but rather whether someone has received much or little education is decisive.
The effect of religiosity looks like a slightly skewed inverse u-shape rather than being linearly negative, as the logistic regression would suggest, with the highest predicted probabilities for rejection of immigrants at around 5 on the religiosity scale.\todo{nicht-lineare Zusammenhänge finden; hier oder in Discussion mit Bezug auf atheortical, explorative analysis, theory building etc. eingehen.}

# Discussion
This contribution tried to illustrate similarities and differences between approaches using [!ts] or [!ml].
Social scientists face a trade-off when it comes to using [!ml]. 
On the downside, features (i.e., independent variables) can only be ranked by importance. This stands in contrast to more fine-grained information provided by a typical regression coefficient, in particular, its direction, but also the strength of effects.
On the upside, focusing on models' predictive capabilities, like in any [!ml] application, shifts the attention to explanations that are closer to scientific reasoning and less prone to mirror common sense [@wattsCommonSenseSociological2014]. 
It is "this potential predictive force which gives scientific explanations its importance" [@hempelStudiesLogicExplanation1948, 138], which is inherently neglected by goodness of fit measures solely relying on in-sample observations. 
Using out-of-sample is a crucial part of any [!sml] procedure, i.e., applying the trained model to unseen test data. 
Integrating this inherent property of [!ml] would at least reduce an important weakness of [!ts] and could even boost, following Watts' line of argumentation, social scientists reasoning more generally. 

Those important benefits notwithstanding, we would like to emphasize that [!ml] is no cheat code, it is all statistics.
Everybody with a professional background in quantitative social science has learned many [!ml] tools, be it [!uml] like cluster analysis or [!sml] like logistic regressions.
Yet, how those methods are used (and promoted) in [!ml] contexts, might starkly differ from common social science approaches. 
Regardless of which features drive a model and how an outcome could be explained, the main interest of [!ml] researchers in industry, but also in science, is that "the model works", i.e., that the model provides good predictions.
This is an important, though merely *epistemological*, difference to statistical models used in social science. 

Going further, it might be helpful for social scientists to acknowledge the differences laid out here and pay closer attention to the predictive power of our models.
In addition, non-linear effects could be explored by tools like [!rf] and, hence, also inform theory-building [@grimmer:MachineLearningSocial.2021].
Both advantages might provide fruitful ways to *complement* existing regression models. 
Hopefully, this contribution showed interested readers what can and what cannot be done with [!ml] methods and how to apply those parts of the rich [!ml] universe that are useful to us when it comes to predicting an outcome.
