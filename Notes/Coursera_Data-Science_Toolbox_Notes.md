# Week 1: Introduction

Tipps from Coursera Users
- http://www.rseek.org, http://www.stackoverflow.com

# Week 2: Installing the Toolbox

## Introduction to git

http://en.wikipedia.org/GitHub
http://git-scm.com/book/Getting-Started-About-Version-Control
http://en.wikipedia.org/wiki/Revision_control
http://git-scm.com
http://git-scm.com/downloads
https://git-scm.com/book/en/Git-Basics-Getting-a-Git-Repository

### Configuring git
git (= git bash)
git config --global user.name "User name"
git config --global user.email "username@mailer.com"
git config --list
exit
Hint: Use the same username and email address as configure with git

### Start a fresh repo from scratch
https://github.com/gmaubach or
https://github.com/new

### Creating a local repository of github
cd /home/chenyi/Dokuments  # path-to-location-for-local-git-repo
mkdir cs_ds  # directory-for-local-git-repo-copy
cd cs_ds  # directory-for-local-git-repo-copy
git init
git remote add origin https://github.com/gmaubach/Coursera_Data_Science.git

### Fork another users repository
https://help.github.com/articles/fork-a-repo

mkdir path-to-forked-repo
git clone https://github.com/gmaubach/repo_name_here.git

### Git basic commands
git add .  # add all new files
git add -u  # updates tracking for files which changed names or were deleted
git add -A  # does both of the previous in one step

git commit -m "message"  # updates local repos, not on github

git push  # update the remote repos on github

git checkout -b branchname  # create a branch of a project
git branch  # show which branch you are on
git checkout master  # switch back to master branch

http://git-scm.com/doc
https://help.github.com

### Basic Markdown
\# First heading
\## Secondary heading
\### Tertiary heading

# Unordered list
\* first item
\* second item
\* third item

http://daringfireball.net/projects/markdown  # introduction to MD
http://www.rstudio.com/ide/docs/authoring/using_markdown

## Installing R packages
Repositories: CRAN, Bioconductor Project

* from CRAN
available.packages()  # shows all available packages on CRAN
install.packages("package name")  # install 1 package
install.packages(c("package name 1", "package name 2", etc.)  # install several packages at once

* from Bioconductor
source("http://biconductor.org/biocLite.R")  # download installation package
biocLite()   # install installation package
biocLite(c("package name 1", "package name 2", etc.)  # install packages from Bioconductor

http://www.bioconductor.org/install

* load packages
library(package name 1)  # load package, don't use quotes cause loading will fail!
search()  # gives list of attached packages

* Install RTools for compiling R packages on Windows
http://cran.r-project.org/bin/windows/Rtools
The RTools version must match the version of R you are using

http://cran.r-project.org/bin/windows/Rtools/Rtools.txt  # Documentation  
IMPORTANT:  
Check the box in the installation GUI to tell the installer to edit the PATH variable    

find.package("devtools")  # check to see if the devtools package is already installed  
install.packages("devtools")  

library(devtools)  # load  
find_rtools()  # run function to check if RTools is working properly, then TRUE ies returned  

# Week 3: Data Analysis

## Lecture 1: Types of Questions
- descriptive
- exporatory
- inferential
- predictive
- causal
- mechanistic

## Lecture 2: Data
### "Data are values of qualitative or quantitative variables, belonging to a set of items" (Wikipedia)

* set of items: population, what you are trying to discover about, whatr you are trying to do measurements on, e.g. persons, web sites, goods, etc.
* variables: characteristics of an item, e. g. hight of a person, number of visits of a web site
* qualitative and quantitative measurements

### Important basics to data science
1. The most important thing about data science is the question you have and the goal or target you want to reach.
2. The second most important thing in data science is the data. If the data is not available the question might need to be adjusted.
The key message is: Data does not save you if you do not have a question.

## Lecture 3: Big Data
* Determine which data is really useful in analytics.
* Even if the data is big it might not be big enough to answer your question. Also data can be big it might not be the right data to answer your question.

## Lecture 4: Experimental Design
### Care about the analysis plan (from data gathering, cleaning, analysis to reporting), you need to know what the key issues are in your study design that can trip you up.
### Sharing data is important when working in teams doing analysis. Code sharing tools are:
* http://github.com: small amounts of data, especially code
* http://figshare.com: large amounts of data, especially datasets, graphics

To develop a data sharing plan see: https://github.com/jtleek/datasharing
### Formulate your question in advance

#### Statistical inference
* Look at scenrios 1 to 3
* If you have two groups with little variance in the each group (either amount the items or the multiple experiments) and if there is a large difference between the two groups then you can tell that one group performs better than the other.

#### Confounding
* S -> L OR is it A -> S AND A -> L?
* People with small shoes have less literacy. But what you might be missing is that age causes shoe size and literacy.
* Shoe Size -> Literacy? OR Age -> Shoe Size AND Age -> Literacy? If you are a young - say a baby - you have a very small shoe size and very small literacy. If you get older you get a large shoe size and a larger literacy. 
* The variable A = Age is a confounder to the variables Shoe Size and Literacy. The relationship between Shoe Size and Literacy might be very small if you count for Age.
* __Note__: Be aware of the other variable that could cause a relationship! There might be many reason despite the reasons/relation you figured out that might cause the relationship.
* __Note__: Correlation is not causation: If you find a correlation you have to proof to yourself that it is not correlated by some other variables that you did not measure.

#### Dealing with confounding
1. Fix a bunch of variable so that they can not be a confounder.
2. Stratify your sample by using both option equally on both experiments.
3. If you can not fix or stratify a variable you can randomize it.

#### Prediction vs. Inference
* If the mean value of two populations has a low difference, it is hard to tell if an item comes from one or the other population.
* For predictions you need the distributions to be separated. The mean has to be far enough according to their variability to tell if an item comes from one or the other population.

#### Prediction Key Quantities
1. Testing outcomes
* TP = True Positives
* FP = False Positives
* FN = False Negatives
* TN = True Negatives

2. Key Quantities
* Sensitivity = Probability (positive test | desease)  -- "|" means giving the fact you have desease
* Specificity = Probability (negative test | no desease)
* Positive predictive value = Probability (desease | positive test)
* Negative predictive value = Probability (no desease | negative test)
* Accuracy = Probability (correct outcome)  -- regardless if you are positive or negative

#### Data Dredging
* Did not understand what data dredging means!

#### Summary
1. Good experiments
* have replication
* measure variability
* generalize the problem you care about
* are transparent


# EOF
