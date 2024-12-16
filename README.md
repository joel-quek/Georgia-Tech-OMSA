# GaTech OMSA
## The Origin Story
It was a warm summer evening, circa 2022 A.D., when my friend (hereafter referred to a *Jpsilon*) turned to me and asked, *"Bro, have you ever thought about pursuing a Master's in Data Science?"* Without a moment's pause, I replied, *"Yes."*

Two years later, that simple word unfolded into an unforgettable journey—one that saw exactly *one* of us cross the finish line.

## The Rubric
I will be rating modules based on two criteria
- Difficulty:
  How challenging the material is and how much effort (or pain) you should be prepared for.
- Relevance
  How practical or valuable I found the module in real-world scenarios.

## My Background
I graduated from the National University of Singapore with an Honors Degree in Mathematics. During my undergrad, I also studied coding (C, MATLAB) and dabbled in Python as a working professional. So, while my ratings are rooted in a STEM background, they might not reflect the experiences of someone with a different academic history.

## The Plot Twist
After submitting my application to the OMSA program, I discovered that my Georgia Tech journey wouldn’t officially begin until Fall 2023. Then, on a chilly evening in 2022, Jpsilon suggested an idea: why not get a head start by taking some of the modules on EdX? The added bonus of potentially earning Advanced Standing credits was a chance too good to pass up.

---

## Spring 2023

### ISYE6501 Introduction to Analytics Modelling (EdX)

*Difficulty: 5/10*

*Relevance: 7/10*

*Module Components: Homework and Exams*

The lecture videos were well-produced, and the lecturer, Joel Sokol, is a phenomenal teacher. Expect to cover a wide range of machine learning algorithms and formulas. The homework assignments introduced me to R coding for the first time, which was a valuable learning experience. The lectures provide simple proof sketches for each formula (e.g., the SVM formula), which may give students the impression that the proofs will be tested. However, the exams were multiple-choice and focused on understanding the uses of different models, rather than detailed mathematical proofs. This was the first time in my life where a math exam didn't require any written work and was entirely multiple-choice. Overall, it's an excellent introduction to understanding various machine learning models, their use cases, and serves as a kind of "menu" showing what the OMSA program has to offer students. Dr. Sokol, if you're reading this and ever visit Singapore, let me buy you a meal.

For those who are wondering, here is _The Menu_

#### Basic Machine Learning
- Classification Models: SVM and KNN
- Clustering Models: K-means

#### Time-Series Models
- CUSUM
- Exponential Smoothing
- ARIMA
- GARCH

#### Regression Models
- Linear Regression
- Logistic Regression
- Advanced Regression

#### Tree-Based Methods
- CART
- Random Forest

#### Design of Experiments
- A/B Testing
- Factorial Design
- Multi-Armed Bandit Models

#### Probability-based Models
- Distribution Fitting
- Queuing
- Markov Chains
- Simulation

#### Optimization Models
- Prescriptive Statistics
- Statistical Modelling

#### Advanced Topics
- Non-parametric Models
- Graph Analysis
- Competitive Models
- Deep Learning

Side note: Jpsilon asked me a lot of questions regarding this module, and I finally understood how Sheldon Cooper felt when teaching Penny Physics. Watch [this video](https://www.youtube.com/watch?v=E5_ccmHk_TY).

---

## Summer 2023
### MGT6203 Data Analytics for Business (EdX)

*Difficulty: 4/10*

*Relevance: 8/10*

*Module Components: Homework, Exams and Project*

This course focused more on data than business and introduced students to data transformations like log-log and log-linear transformations. There are some interesting and practical concepts to learn, such as understanding the math behind stock alpha and beta values, basic queuing problems, and statistical forecasting. The homework assignments require the use of R, and the exams are also multiple-choice. In my honest opinion, the exam for this module involved more calculations than ISYE 6501.

The course also includes a large project component, where I had the pleasure of working with a stellar group of teammates, especially my best teammate, WS, with whom I went on to collaborate on many projects. We would go to Vormir and collect the Soul Stone. (Note: the relevance rating I'm giving is largely due to the project we worked on.) We performed extensive feature engineering and data cleaning for the project. The project itself is very open-ended, so get creative! My team did an excellent job.

## Fall 2023
### CSE6040 Computing for Data Analysis

*Difficulty: 7/10*

*Relevance: 10/10*

*Module Components: Homework and Exams*

This module was very well-designed, and the lecturer is excellent. To be honest, I only watched the first lecture, but I found him engaging, and the content was presented very effectively. The homework introduces students to the Vocareum platform, where every coding assignment requires unit tests to score points, giving you immediate feedback. You can also check your output to see exactly where you went wrong and debug accordingly. There are 15 homework assignments, which means you'll be busy every week.

The examinations for this course should not be taken lightly. They are proctored coding tests, and you cannot receive help from humans or AI. This is a great challenge for those who rely heavily on tools like ChatGPT or Co-Pilot for coding. The exams simulate real coding tests used in job interviews and cover everything from cleaning large datasets to developing complex Python dictionaries, SQL wrangling, REGEX, and more. Do not underestimate them—they will humble you, just as they did my friend.

The course was very well designed. Thank you Dr. Vuduc.

## Spring 2024
### MGT8803 Business Fundamentals for Analytics

*Difficulty: ?/10*

*Relevance: ?/10*

*Module Components: Exams and a Supply Chain Simulation*

In this course, we explored four key areas: Accounting, Finance, Marketing, and Supply Chain. Each topic was assessed through a multiple-choice exam.

I must admit that I didn't engage with the lecture materials or dedicate time to studying for the exams (hence I did not rate this module). The course primarily focused on business theories, which didn't align with my personal interests. Consequently, I chose to take the exams without extensive preparation, allowing me to concentrate on other modules.

Additionally, I was curious about the necessity of purchasing the Harvard Supply Chain Simulation for the course. 

### ISYE6644 Simulation and Modelling for Engineering and Science

*Difficulty: 7/10*

*Relevance: 8/10*

*Module Components: Homework, Exams, Project*

I will summarize this module in my own words:

_Primer on Basic Calculus and Probability Theory_
This section introduces students to double integration, summation notation, and basic modular arithmetic. It also covers discrete and continuous random variables and how to perform arithmetic on variance and expectation. This can be quite challenging for those without a foundation in calculus or probability theory.

_Using Arena and Excel to Run Simulations_
What’s the point of using Arena when Python can run better simulations?

_Random Number Generation_
This section focuses a lot on modular arithmetic and prime number theories. While random number generation is crucial for generating pseudo-random data points in simulations, it can be a bit abstract. You’ll be introduced to various Pseudo-Random Number (PRN) generators, including Linear Congruential Generators (LCGs) and the professor's favorite Desert Island Generator, which subtly uses Fermat's Theorem. Things get more complex when the professor introduces Tausworthe Generators, combining summation notation with modular arithmetic. This section is heavily tested.

_Random Variate Generation_
In this chapter, you’ll encounter two very important theorems: the Inverse Transform Theorem and LOTUS. You’ll learn how to generate various continuous random variables from the Uniform Distribution to create large simulation models. Expect to become familiar with Triangular, Weibull, Poisson, Normal distributions, and see how convolutions of these functions can generate new random variables. You’ll also learn the Acceptance-Rejection Method for generating random variables and study the formalized version of Brownian Motion.

_Input and Output Analysis_
Students will learn to define unbiased estimators and use capital pi notation to calculate Maximum Likelihood Estimates.

_Comparing Systems_
Students will learn to compute the Confidence Intervals of Means to pompare two different systems. They will also learn paried t-tests and differences of means.

In summary: Random number generation creates the base data for simulations. Random variate generation transforms these numbers into meaningful variables based on real-world distributions. Input and output analysis ensures the data used and the results produced are accurate, helping make valid predictions and informed decisions from the simulation.

The homework assignments were multiple-choice, but most of the questions (except for ARENA) required calculations. Some of these calculations were quite lengthy. I had to teach my groupmates how to approach the homework because they were fairly challenging.

The group project makes up a large portion of the grade, with project topics decided by the course instructors. I teamed up with WS again, along with two other guys who didn't pull their weight. One member left our group after the first meeting, and another disappeared midway through. Once again, WS and I were left to face the challenge together, I could fight Thanos with WS.

---

## An Interlude
After Spring 2024, I realised that I had 5 modules and Practicum left. It was possible for me to finish OMSA *within the year*. However, ther was one problem - DVA cannot be taken during Summer, and you need to have cleared DVA before you are allowed to take Practicum, you are not allowed to do both concurrently. 

## Summer 2024
### CS6750 Human Computer Interaction

*Difficulty: /10*

*Relevance: /10*

*Module Components: *

### CS7646 Machine Learning for Trading

*Difficulty: /10*

*Relevance: /10*

*Module Components: *

### ISYE6740 Computational Data Analysis

*Difficulty: /10*

*Relevance: /10*

*Module Components: *

## Fall 2024
### CSE6242 Data and Visual Analytics

*Difficulty: /10*

*Relevance: /10*

*Module Components: *

### ISYE8803 Topics on High Dimensional Data Analytics

*Difficulty: /10*

*Relevance: /10*

*Module Components: *

### CSE6748 Applied Analytics Practicum

*Difficulty: /10*

*Relevance: /10*

*Module Components: *
