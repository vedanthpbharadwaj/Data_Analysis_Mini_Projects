# 🧹 Data Cleaning and EDA on Layoffs Dataset (MySQL Project)

## 📘 Overview
This project focuses on **data cleaning and exploratory data analysis (EDA)** of a real-world layoffs dataset using **MySQL**.  
The goal is to prepare raw, inconsistent data for meaningful analysis by cleaning, transforming, and standardizing it before performing insights-driven exploration.

---

## 🧩 Part 1: Data Cleaning (`Data Cleaning.sql`)
The **`Data Cleaning.sql`** script performs a full cleaning workflow to make the dataset analysis-ready.

### 🧱 Key Steps:
1. **Duplicate Removal**  
   - Uses `ROW_NUMBER()` and CTEs to identify and delete duplicate records.

2. **Data Standardization**  
   - Fixes inconsistent text formats (e.g., trimming spaces, correcting capitalization).  
   - Unifies country names and company entries for consistency.

3. **Handling Missing and Null Values**  
   - Identifies NULL or blank entries and replaces them logically or leaves them for separate imputation.

4. **Date Formatting**  
   - Converts text-based date fields to valid MySQL `DATE` format.

5. **Temporary Columns Cleanup**  
   - Removes redundant columns created during intermediate cleaning.

### 🧾 Output
A new cleaned dataset (`layoffs_staging2`) that is structured, standardized, and ready for EDA or visualization.

---

## 🔍 Part 2: Exploratory Data Analysis (EDA)
🕓 *Coming soon…*  

The **EDA section** will include:
- Descriptive statistics  
- Trend and pattern analysis  
- Insights on layoffs by company, country, and industry  
- Visual exploration using SQL queries and charts  

---

## ⚙️ Tech Stack
- **Database:** MySQL 8.0  
- **Tools:** MySQL Workbench, SQL  
- **Language:** SQL  

---

## 🧠 Learnings
- Implementing data cleaning pipelines using MySQL functions.  
- Handling real-world data inconsistencies.  
- Preparing structured datasets for analysis.  

---

## 👤 Author
**Vedanth P Bharadwaj**  
📧 [vedanthpbharadwaj@gmail.com]  
💼 [LinkedIn](https://www.linkedin.com/in/vedanth-p-bharadwaj)  
🎓 Data Science & Analytics Engineering Enthusiast  
