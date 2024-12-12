library(tidyverse)

data <- read_delim("inputs/day_1", "   ", col_names = c("r", "l"))

# Part 1 ----

list_r <- sort(data$r, decreasing = TRUE)
list_l <- sort(data$l, decreasing = TRUE)

sum(abs(list_r - list_l))

# Part 2 ----
similarity <- data |>
  select(l) |>
  summarise(n = n(), .by = l) |>
  filter(l %in% list_r) |>
  mutate(similarity =  l * n)

reduce(similarity$similarity, `+`)

