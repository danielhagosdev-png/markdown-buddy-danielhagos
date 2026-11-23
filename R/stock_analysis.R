# =============================================================================
# Stock Portfolio Technical Analysis - Basic Statistics
# Author: Daniel Hagos
# Course: BDA400 - Data Science Tools and Techniques
# Description: Loads portfolio symbols, generates synthetic OHLCV data,
#              computes basic statistics, and displays results.
# =============================================================================

# Load required packages
library(tidyverse)
library(TTR)          # for SMA (Simple Moving Average)

# -----------------------------------------------------------------------------
# Function: generate_synthetic_stock_data
# Purpose : Create synthetic daily OHLCV data for a given symbol
# -----------------------------------------------------------------------------
generate_synthetic_stock_data <- function(symbol, n_days = 252, seed = 42) {
  set.seed(seed + sum(utf8ToInt(symbol)))  # different seed per symbol
  
  # Starting price around typical stock levels
  start_price <- runif(1, 50, 350)
  
  # Generate random returns (slightly positive drift)
  returns <- rnorm(n_days, mean = 0.0005, sd = 0.018)
  
  # Price series
  close <- start_price * cumprod(1 + returns)
  
  # Generate OHLC from close
  high  <- close * runif(n_days, 1.001, 1.025)
  low   <- close * runif(n_days, 0.975, 0.999)
  open  <- low + (high - low) * runif(n_days)
  volume <- as.integer(runif(n_days, 1e6, 5e7))
  
  dates <- seq.Date(from = Sys.Date() - n_days, by = "day", length.out = n_days)
  
  tibble(
    Date   = dates,
    Symbol = symbol,
    Open   = round(open, 2),
    High   = round(high, 2),
    Low    = round(low, 2),
    Close  = round(close, 2),
    Volume = volume
  )
}

# -----------------------------------------------------------------------------
# Function: load_portfolio_data
# Purpose : Read portfolio.txt and generate synthetic data for each symbol
# -----------------------------------------------------------------------------
load_portfolio_data <- function(portfolio_file = "data/portfolio.txt") {
  symbols <- read_lines(portfolio_file) %>% 
    str_trim() %>% 
    discard(~ .x == "")
  
  map(symbols, generate_synthetic_stock_data) %>% 
    set_names(symbols)
}

# -----------------------------------------------------------------------------
# Function: calculate_statistics
# Purpose : Compute mean, median, SD, and 20-day SMA of Close price
# -----------------------------------------------------------------------------
calculate_statistics <- function(stock_df) {
  close_prices <- stock_df$Close
  
  # Simple Moving Average (last value of 20-day SMA)
  sma_20 <- SMA(close_prices, n = 20)
  
  tibble(
    Symbol          = unique(stock_df$Symbol),
    Mean_Close      = mean(close_prices, na.rm = TRUE),
    Median_Close    = median(close_prices, na.rm = TRUE),
    SD_Close        = sd(close_prices, na.rm = TRUE),
    Last_Close      = last(close_prices),
    SMA_20          = last(sma_20),
    Observations    = nrow(stock_df)
  )
}

# -----------------------------------------------------------------------------
# Main execution
# -----------------------------------------------------------------------------
message("Loading portfolio and generating synthetic data...")
portfolio_data <- load_portfolio_data()

message("Calculating statistics for each stock...")
stats_list <- map(portfolio_data, calculate_statistics)
stats_df   <- bind_rows(stats_list)

# Display results
cat("\n==================== PORTFOLIO STATISTICS ====================\n\n")
print(stats_df, n = Inf)

cat("\n==================== SAMPLE DATA (first 5 rows of AAPL) ====================\n\n")
print(head(portfolio_data[["AAPL"]], 5))

# Optional: save statistics
# write_csv(stats_df, "output/portfolio_statistics.csv")

message("\nAnalysis complete.")
