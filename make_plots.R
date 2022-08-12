library(tidyverse)

x <- read_rds(file = "clean_data.rds")

plot_1 <- x |> 
  ggplot(aes(x = pop2018, y = ec_county)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_x_log10(breaks = c(1000, 10000, 1000000),
                labels = c("1,000", "10,000", "1,000,0000")) +
  labs(y = "Economic Connectedness",
       x = "Population",
       title = "Economic Connectedness and Population in US Counties",
       subtitle = "There is no relationship between population and economic connectedness in US counties.")

write_rds(plot_1, "plot_1.rds")

x <- read_rds(file = "clean_data.rds")

plot_2<- x |> 
  group_by(state) |> 
  summarise(pop_state = sum(pop2018),
            avg_ec = mean(ec_county)) |> 
  ggplot(aes(x = pop_state, y = avg_ec)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_x_log10(breaks = c(1000000, 10000000),
                labels = c("1,000,0000", "10,000,000")) +
  labs(y = "Average County Economic Connectedness",
       x = "State Population",
       title = "Economic Connectedness and Population in US States",
       subtitle = "Biggger states have counties with lower average economic connectedness.")

write_rds(plot_2, "plot_2.rds")

