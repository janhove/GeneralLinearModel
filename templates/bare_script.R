################################################################################
# Template of a bare-bones R script
# 
# last change: 2024/06/26
# author: jan.vanhove@unifr.ch
################################################################################

# You can use File > Compile report... to compile a report based on this script.
# But also take a look at script_with_markdown.R, which shows how you can obtain
# nicer reports.

#-------------------------------------------------------------------------------
# Preliminaries

# Load packages
library(tidyverse)
library(here)

# Load datasets
skills <- read_csv(here("data", "helascot_skills.csv"))

#-------------------------------------------------------------------------------
# Summary
skills |> 
  group_by(LanguageTested, Time) |> 
  summarise(
    mean_reading = mean(Reading, na.rm = TRUE),
    mean_arg     = mean(Argumentation, na.rm = TRUE),
    mean_narr    = mean(Narration, na.rm = TRUE)
  )

#-------------------------------------------------------------------------------
# Graph
ggplot(skills,
       aes(x = factor(Time),
           y = Reading)) +
  geom_boxplot() +
  scale_x_discrete(labels = paste0("T", 1:3)) +
  facet_grid(cols = vars(LanguageTested))

# Use ggsave() to save.

#-------------------------------------------------------------------------------
# Software versions
devtools::session_info()
