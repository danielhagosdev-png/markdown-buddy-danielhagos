> **AI Assistance Declaration:** I used Grok (xAI), version 4, in November 2026 to draft the README structure, suggest Markdown sections, refine the R Markdown layout, and draft reflection wording. Prompts used: see the Appendix below. I verified outputs by previewing the Markdown, checking every file path and function name against the script, and reviewing each AI suggestion before using it. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

# Appendix – AI Prompts and Key Responses

**Tool used:** Grok (xAI)  
**Date:** November 2026  
**Student:** Daniel Hagos  

All prompts below were used iteratively. Only the most important ones are shown.

---

### Step 1 – Understanding good README structure

**Seed Prompt:**  
“Explain what sections a good GitHub README for an R data analysis project should include.”

**Key AI Response (summary):**  
AI suggested the following core sections:
- Project Title + short description
- Overview / Purpose
- Project Structure (folder tree)
- Installation / Dependencies
- Usage / Example
- License
- Author information

**Refinement Prompt:**  
“Revise the sections list so it’s concise and uses Markdown headers and bullet formatting.”

**Key AI Response:**  
Returned a clean Markdown outline using `#`, `##`, and bullet points that matched common tidyverse-style repositories.

**Critique Prompt:**  
“Check the Markdown syntax for correctness and readability.”

**Key AI Response:**  
Confirmed correct header hierarchy and suggested minor improvements for consistency (e.g., consistent use of backticks for file names).

---

### Step 2 – Generating the README.md

**Seed Prompt:**  
“Here’s a summary of my R project:  
It is a basic stock portfolio technical analysis tool written in R.  
It reads ticker symbols from a text file, generates synthetic OHLCV data for each symbol, calculates mean, median, standard deviation and 20-day SMA of the Close price, and prints a clean summary table.  
Key files: data/portfolio.txt, R/stock_analysis.R, docs/stock_analysis_documentation.Rmd.  
Dependencies: tidyverse, TTR.  
Generate a professional README.md file using Markdown.”

**Key AI Response:**  
Produced a full README with Overview, Project Structure (tree), Installation, Usage, Example Output, Dependencies, and License sections.

**Refinement Prompt:**  
“Add sections for Installation, Example Code / Usage, Project Structure, and License. Keep tone concise and professional. Use a clear folder tree.”

**Key AI Response:**  
Improved the folder tree formatting and made the language more concise and professional.

**Critique Prompt:**  
“Review the Markdown for syntax errors and suggest 2 improvements for clarity.”

**Key AI Response:**  
- Suggested making the example output shorter  
- Recommended adding an explicit AI Assistance Disclosure section at the bottom  

(I implemented both suggestions and further edited the wording.)

---

### Step 3 – Documenting the R script with R Markdown

**Seed Prompt:**  
“Here’s my R script description:  
The script has three functions:  
1. generate_synthetic_stock_data() – creates realistic OHLCV data  
2. load_portfolio_data() – reads portfolio.txt and generates data for each symbol  
3. calculate_statistics() – computes mean, median, SD and 20-day SMA  
Suggest Markdown formatting and code block examples for an R Markdown documentation file.”

**Key AI Response:**  
Suggested a structure with YAML header, Purpose, Inputs (table), Outputs, Script Structure (with subsections for each function), Dependencies, and How to Run.

**Refinement Prompt:**  
“Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ### Outputs, ## Script Structure). Make it suitable for knitting to HTML.”

**Key AI Response:**  
Provided improved heading hierarchy and recommended `toc: true` + `theme: flatly` in the YAML for better HTML output.

**Critique Prompt:**  
“Is the Markdown consistent with RMarkdown best practices?”

**Key AI Response:**  
Confirmed it followed common practices (clear sections, code chunks with `echo = TRUE`, tables for inputs/outputs) and suggested adding `message = FALSE, warning = FALSE` in the setup chunk.

---

### Reflection support

**Prompt:**  
“Help me draft thoughtful answers to these three reflection questions about using AI for documentation in an R project:  
1. Strengths of AI  
2. Limitations and how I fixed them  
3. Ethical use and what I learned”

**Key AI Response:**  
Provided structured draft answers. I rewrote all three answers in my own words and added personal observations from the actual workflow.

---

### Verification and Self Spot-Check (as required)

Following the course Verification Pattern:

**a) Primary creation**  
- Generated README and .Rmd using iterative AI prompting.  
- Wrote the R script manually and tested it successfully in RGui (output confirmed correct statistics table and sample data).

**b) Independent cross-check**  
- Compared the AI-suggested README structure against real tidyverse repositories (e.g., dplyr, ggplot2) for common sections.  
- Manually verified every file path, function name, and package dependency against the actual project files.

**c) Self spot-check**  
- Opened README.md on GitHub preview → headers, code blocks, and lists render correctly.  
- Opened the .Rmd in RStudio and knitted to HTML → confirmed Purpose, Inputs table, function sections, and code chunks all render without errors.  
- Re-ran `source("R/stock_analysis.R")` after final edits → output still correct.  
- Reviewed Reflection.md and Appendix for completeness of AI disclosure and prompts + key responses.

All final content was edited and validated by me. I take full responsibility for the accuracy and originality of this work.

---

**Note:** All AI outputs were manually reviewed, edited for accuracy, and validated by previewing Markdown and knitting the `.Rmd` file. The final content is the responsibility of the student.
