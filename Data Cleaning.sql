select *
from layoffs;

select *
from layoffs_staging;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove any columns


Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging;


WITH duplicates_cte AS
(
Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging
)
DELETE
FROM duplicates_cte 
WHERE row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

select *
from layoffs_staging2;

INSERT INTO layoffs_staging2
Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging;


Select *
from layoffs_staging2
WHERE row_num > 1;


WITH duplicates_cte AS
(
Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, 
country, funds_raised_millions) as row_num
from layoffs_staging2
)
DELETE
FROM duplicates_cte 
WHERE row_num > 1;

-- Removal of Duplicates Done


-- Standardizing data

SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT *
from layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE "Crypto%";

SELECT DISTINCT country, TRIM(trailing '.' from country)
FROM layoffs_staging2
where country LIKE "United States%"
ORDER BY 1;

Update layoffs_staging2
SET country = TRIM(trailing '.' from country)
where country LIKE "United States%";

SELECT *
from layoffs_staging2
ORDER BY 1;


select `date`
from layoffs_staging2;

update layoffs_staging2
set `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2
where total_laid_off IS NULL
and percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry = "";

select *
from layoffs_staging2
where industry is null
or industry = "";

select *
from layoffs_staging2
where company LIKE "Bally's%";

select *
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry = "")
and t2.industry is not null;

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry = "")
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null or t1.industry = "")
and t2.industry is not null;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

alter table layoffs_staging2
drop column row_num;


-- Data Cleaning is done for the most part. Now onto EDA.