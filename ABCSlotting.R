# SC_Data_Science_ABC_Slotting

library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)

## 80:20 ABC Curve Example

Classification <-c("(0,0)","A","B","C")
Sales <- c("0%","80%","15%","5%")
SKU <- c("0%","20%","30%","50%")

ABC_80_20 <- data.frame(Classification,Sales, SKU)

glimpse(ABC_80_20)

ABC_80_20$Sales <- str_remove(ABC_80_20$Sales,"%")
ABC_80_20$SKU <- str_remove(ABC_80_20$SKU,"%")

ABC_80_20$Sales <- as.numeric(ABC_80_20$Sales)
ABC_80_20$SKU <- as.numeric(ABC_80_20$SKU)

### Calculate the cumulative sum of Sales and SKUs
ABC_80_20$Cumulative_Sales <- cumsum(ABC_80_20$Sales)
ABC_80_20$Cumulative_SKU <- cumsum(ABC_80_20$SKU)

### Plotting 80:20 Example

ggplot(ABC_80_20, aes(x = Cumulative_SKU, y = Cumulative_Sales, label = Classification)) +
  geom_point(size = 3) +  # Scatter plot points
  geom_text(vjust = -0.5, hjust = 0.8, color = "black", fontface = "bold") +
  geom_smooth(method = "loess", se = FALSE, color = "grey") +
  labs(title = "80:20 Pareto - Cumulative Sales/SKU",
       x = "Cumulative_SKU (%)",
       y = "Cumulative_Sales (%)") +
  scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +  # Set x-axis limit and breaks
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +  # Set y-axis limit and breaks
  theme_minimal()

## 70:30 ABC Curve Example

Classification2 <-c("(0,0)","A","B","C")
Sales2 <- c("0%","70%","20%","10%")
SKU2 <- c("0%","30%","30%","40%")

ABC_70_30 <- data.frame(Classification2,Sales2, SKU2)

glimpse(ABC_70_30)

ABC_70_30$Sales2 <- str_remove(ABC_70_30$Sales2,"%")
ABC_70_30$SKU2 <- str_remove(ABC_70_30$SKU2,"%")

ABC_70_30$Sales2 <- as.numeric(ABC_70_30$Sales2)
ABC_70_30$SKU2 <- as.numeric(ABC_70_30$SKU2)

### Calculate the cumulative sum of Sales and SKUs
ABC_70_30$Cumulative_Sales2 <- cumsum(ABC_70_30$Sales2)
ABC_70_30$Cumulative_SKU2 <- cumsum(ABC_70_30$SKU2)

### Plotting 70:30 Example

ggplot(ABC_70_30, aes(x = Cumulative_SKU2, y = Cumulative_Sales2, label = Classification2)) +
  geom_point(size = 3) +  # Scatter plot points
  geom_text(vjust = -0.5, hjust = 0.8, color = "black", fontface = "bold") +
  geom_smooth(method = "lm", formula = y ~ poly(x, 3), se = FALSE, color = "grey") +
  labs(title = "70:30 Pareto - Cumulative Sales/SKU",
       x = "Cumulative_SKU (%)",
       y = "Cumulative_Sales (%)") +
  scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +  # Set x-axis limit and breaks
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +  # Set y-axis limit and breaks
  theme_minimal()

## 50:50 ABC Curve Example

Classification3 <-c("(0,0)","A","B","C")
Sales3 <- c("0%","50%","30%","20%")
SKU3 <- c("0%","50%","30%","20%")

ABC_50_50 <- data.frame(Classification3,Sales3, SKU3)

glimpse(ABC_50_50)

ABC_50_50$Sales3 <- str_remove(ABC_50_50$Sales3,"%")
ABC_50_50$SKU3 <- str_remove(ABC_50_50$SKU3,"%")

ABC_50_50$Sales3 <- as.numeric(ABC_50_50$Sales3)
ABC_50_50$SKU3 <- as.numeric(ABC_50_50$SKU3)

### Calculate the cumulative sum of Sales and SKUs

ABC_50_50$Cumulative_Sales3 <- cumsum(ABC_50_50$Sales3)
ABC_50_50$Cumulative_SKU3 <- cumsum(ABC_50_50$SKU3)

### Plotting 50:50 Example

ggplot(ABC_50_50, aes(x = Cumulative_SKU3, y = Cumulative_Sales3, label = Classification3)) +
  geom_point(size = 3) +  # Scatter plot points
  geom_text(vjust = -0.5, hjust = 0.8, color = "black", fontface = "bold") +
  geom_smooth(method = "lm", se = FALSE, color = "grey") +
  labs(title = "50:50 Pareto - Cumulative Sales/SKU",
       x = "Cumulative_SKU (%)",
       y = "Cumulative_Sales (%)") +
  scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +  # Set x-axis limit and breaks
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +  # Set y-axis limit and breaks
  theme_minimal()





