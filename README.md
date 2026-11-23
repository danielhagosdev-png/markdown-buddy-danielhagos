> **AI Assistance Declaration:** I used Grok (xAI), version 4, in November 2026 to draft the README structure, suggest Markdown sections, refine the R Markdown layout, and draft reflection wording. Prompts used: see the AI Assistance Disclosure at the bottom of this file and `Appendix_AI_Prompts.md`. I verified outputs by previewing the Markdown, checking every file path and function name against the script, and reviewing each AI suggestion before using it. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Basic Stock Portfolio Technical Analysis

**Author:** Daniel Hagos  
**Course:** BDA400 – Data Science Tools and Techniques  
**Assignment:** 1 – Markdown Buddy  

---

## Overview

This R project runs a basic technical analysis on a small stock portfolio. It reads a list of ticker symbols, generates **synthetic** daily OHLCV data for each one, calculates summary statistics (mean, median, standard deviation, and a 20-day Simple Moving Average), and prints the results.

Synthetic data means the project runs offline, with no API key or internet connection needed.

## Project Structure

```
markdown-buddy-danielhagos/
├── data/
│   └── portfolio.txt                      # Ticker symbols, one per line
├── R/
│   └── stock_analysis.R                   # Main analysis script
├── docs/
│   └── stock_analysis_documentation.Rmd   # Detailed R Markdown documentation
├── Appendix_AI_Prompts.md                 # AI prompts used
├── Reflection.md                          # Reflection on the AI-assisted workflow
└── README.md                              # This file
```

## Installation

1. Clone or download this repository.
2. Open the project in RStudio, or any R environment.
3. Install the required packages:

```r
install.packages(c("tidyverse", "TTR"))
```

## Usage

From the project root, run:

```r
source("R/stock_analysis.R")
```

The script will:

1. Read the symbols in `data/portfolio.txt`
2. Generate 252 days of synthetic OHLCV data for each symbol
3. Compute the statistics
4. Print a summary table and the first five rows of AAPL's raw data

## Example Output

Output from running the script on Windows with R 4.6 and tidyverse 2.0.0:

```
==================== PORTFOLIO STATISTICS ====================

# A tibble: 5 × 7
  Symbol Mean_Close Median_Close SD_Close Last_Close SMA_20 Observations
  <chr>       <dbl>        <dbl>    <dbl>      <dbl>  <dbl>        <int>
1 AAPL         287.         291.     23.5       240.   247.          252
2 MSFT         286.         289.     31.4       321.   311.          252
3 GOOGL        134.         134.     22.3       115.   110.          252
4 AMZN         228.         220.     25.2       201.   196.          252
5 TSLA          80.0         77.4     8.87       76.4   82.7          252

==================== SAMPLE DATA (first 5 rows of AAPL) ====================

# A tibble: 5 × 7
  Date       Symbol  Open  High   Low Close   Volume
  <date>     <chr>  <dbl> <dbl> <dbl> <dbl>    <int>
1 2026-03-16 AAPL    269.  277.  268.  274. 14815218
2 2026-03-17 AAPL    277.  282.  277.  278. 44082158
3 2026-03-18 AAPL    291.  295.  288.  290. 46481498
4 2026-03-19 AAPL    295.  297.  291.  293. 21503526
5 2026-03-20 AAPL    295.  295.  286.  292. 27177327
```

## Dependencies

- **tidyverse**: data manipulation and the piping workflow
- **TTR**: Technical Trading Rules, used for the Simple Moving Average

## License

This project is for educational purposes only (BDA400 Assignment 1). The data is synthetic and for learning only. Do not use it for real trading decisions.

---

## AI Assistance Disclosure

**AI tool(s):** Grok (xAI), version 4, November 2026

**Main prompts:**
- "Explain what sections a good GitHub README for an R data analysis project should include."
- "Here's a summary of my R project: [project summary]. Generate a professional README.md file using Markdown."
- "Add sections for Installation, Example Code, and License. Keep tone concise and professional."
- "Review the Markdown for syntax errors and suggest 2 improvements for clarity."
- Prompts for structuring the `.Rmd` documentation and reflection responses.

**Changes I made after reviewing the outputs:**
- Shortened the language and removed verbose explanations
- Changed the project structure section to match the actual folders
- Added tables and a consistent heading hierarchy
- Checked all code blocks and file paths against the project
- Wrote the final reflection answers in my own words after the AI suggestions

I checked the Markdown rendering in preview and take responsibility for the accuracy and originality of this work.
