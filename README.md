# 🧹 Data Cleaning and EDA on Layoffs Dataset (MySQL Project)

## 📘 Overview
This project focuses on **data cleaning and exploratory data analysis (EDA)** of a real-world layoffs dataset using **MySQL**.  
The goal is to prepare raw, inconsistent data for meaningful analysis by cleaning, transforming, and standardizing it before performing insights-driven exploration.

The dataset contains information about company layoffs across industries, countries, and years — offering insights into global employment trends and the economic impact of large-scale workforce reductions.

---

## 🧩 Part 1: Data Cleaning (`Data_Cleaning.sql`)
The **`Data_Cleaning.sql`** script performs a full cleaning workflow to make the dataset analysis-ready.

### 🧱 Key Steps
1. **Duplicate Removal**  
   - Used a **CTE** with `ROW_NUMBER()` to identify and remove duplicate records from the dataset.

2. **Data Standardization**  
   - Trimmed extra spaces from text fields like `company` and `country`.  
   - Standardized inconsistent entries (e.g., converting “Crypto Exchange” → “Crypto”).  
   - Fixed trailing punctuation (e.g., `United States.` → `United States`).

3. **Handling Missing and Null Values**  
   - Identified null or blank `industry` values and updated them using valid entries for the same company via **self-joins**.  
   - Removed rows where both `total_laid_off` and `percentage_laid_off` were null.

4. **Date Formatting**  
   - Converted text-based dates to valid MySQL `DATE` format using `STR_TO_DATE()` and `ALTER TABLE`.

5. **Temporary Column Cleanup**  
   - Dropped intermediate columns (e.g., `row_num`) created during duplicate detection.

### 🧾 Output
A cleaned dataset **`layoffs_staging2`** that is consistent, normalized, and ready for downstream analysis.

---

## 📊 Part 2: Exploratory Data Analysis (`ExploratoryDataAnalysis.sql`)

The **`ExploratoryDataAnalysis.sql`** script performs in-depth analysis of layoff patterns, providing data-driven insights into company, industry, and country-level trends.

### 🧩 Key Analysis Areas

1. **Overall Trends**
   - Calculated total layoffs across all years to understand the **scale of layoffs globally**.
   - Identified peak periods and overall distribution patterns.

2. **Company-Level Insights**
   - Aggregated total layoffs **per company** to identify the organizations most impacted.
   - Ranked companies to highlight **top contributors to global layoffs**.
   - Used `DENSE_RANK()` with window functions to find the **top 5 companies each year** with the highest layoffs.

3. **Industry-Level Insights**
   - Grouped data by `industry` to reveal which sectors were hit hardest.
   - Compared **tech, retail, media, and financial industries** over multiple years to identify resilience and volatility patterns.

4. **Geographical Distribution**
   - Aggregated layoffs by `country` to evaluate **region-specific impacts**.
   - Highlighted countries with consistent layoffs across years versus those affected only in certain periods.

5. **Yearly Analysis**
   - Analyzed layoffs **year-over-year** using `YEAR(date)` to spot surges and recoveries.
   - Created trendlines showing how the number of layoffs changed from 2020 through 2023.

6. **Rolling and Cumulative Trends**
   - Used **window functions** and cumulative sums to visualize **progressive layoffs** over time.
   - Helped identify whether layoffs were isolated or part of a longer trend.

7. **Percentage-Based Insights**
   - Used `percentage_laid_off` to find companies that downsized heavily relative to their workforce.
   - Highlighted organizations that reached **100% layoffs** (complete shutdowns).

### 🧮 Techniques & SQL Functions Used
- **CTEs (Common Table Expressions)** for modular and readable query structure.  
- **Window Functions** like `DENSE_RANK()`, `ROW_NUMBER()`, and `SUM() OVER()` for ranking and cumulative analysis.  
- **GROUP BY / ORDER BY / PARTITION BY** for aggregations and ranking by category.  
- **Date functions** such as `YEAR()` and `MONTH()` for time-based grouping.  

### 📈 Example Insights
- Tech and media industries showed **the steepest increase in layoffs during 2022–2023**.  
- Certain companies appeared **repeatedly in top-5 layoffs rankings**, reflecting ongoing restructuring phases.  
- Layoffs correlated strongly with **macroeconomic downturns**, indicating widespread cost-optimization across sectors.  

---

## ⚙️ Tech Stack
- **Database:** MySQL 8.0  
- **Tools:** MySQL Workbench  
- **Language:** SQL  

---

## 🧠 Learnings
- Implementing end-to-end **data cleaning pipelines** in SQL.  
- Handling real-world data quality issues using joins, CTEs, and string/date functions.  
- Using **window functions** for ranking, cumulative metrics, and time-series exploration.  
- Deriving **business insights** from raw data through analytical SQL queries.  

---

## 📂 Repository Structure

---

## 👤 Author
**Vedanth P Bharadwaj**  
📧 [vedanthpbharadwaj@gmail.com]  
💼 [LinkedIn](https://www.linkedin.com/in/vedanth-p-bharadwaj)  
🎓 Data Science & Analytics Engineering Enthusiast  
