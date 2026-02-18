# Base packages for ExWAS Online Course
# Install all required packages before running the modules

# Core tidyverse
library(tidyverse)
library(broom)

# Presentation and tables
library(knitr)
library(kableExtra)
library(rmarkdown)
library(DT)

# Survey analysis
library(survey)

# Meta-analysis
library(metafor)

# Visualization
library(ggrepel)

# Parallelization (optional, Module 5)
library(furrr)
library(future)

# nhanespewas (Modules 4-7)
# devtools::install_github("chiragjp/nhanespewas")
library(nhanespewas)
