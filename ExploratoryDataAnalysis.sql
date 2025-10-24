-- Exploratory Data Analysis

select *
from layoffs_staging2;

select MAX(total_laid_off), MAX(percentage_laid_off)
from layoffs_staging2; -- most layoffs in a day

select *
from layoffs_staging2
where percentage_laid_off = 1; -- list of all the companies that had 100% layoffs (bankrupt)


select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc; -- companies that had 100% layoffs, ordered by the total laid off numbers

select *
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc; -- companies that had 100% layoffs, ordered by funds in millions

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc; -- most layoffs by company in descending order (Amazon worst hit)

select min(`date`), max(`date`)
from layoffs_staging2; -- the range of dates from when the layoffs started to ended


select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc; -- most layoffs based on industry (Consumer and Retail being the highest)

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc; -- ordering most layoffs by country (USA max ~ 256k)


select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 2 desc; -- ordering most layoffs by date (2023-01-04 ~16k)

select `date`, sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1; -- orders the layoffs per date from start date

select YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by YEAR(`date`)
order by 1 desc; -- orders the year in desc order, and gives the total layoffs for that year

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc; -- ordering the total layoffs by the stage of the company (Acquired, Post IPO etc)

  
-- Rolling SUM of the total layoffs (ordered by month from the start date)

select substring(`date`, 1, 7) as `MONTH`, SUM(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `MONTH`
order by 1;


with rolling_sum as
(
select substring(`date`, 1, 7) as `MONTH`, SUM(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `MONTH`
order by 1
)
select `MONTH`, total_off, SUM(total_off)
over(order by `MONTH`) as rolling_total
from rolling_sum;



select company, YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
order by company asc;

--  top 5 companies with the highest number of layoffs each year

with company_year(company, years, total_laid_off) as
(
select company, YEAR(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, YEAR(`date`)
), company_year_rank as
(
select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <= 5;

