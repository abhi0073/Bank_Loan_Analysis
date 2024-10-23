CREATE DATABASE BANK_LOAN_ANALYSIS;

USE BANK_LOAN_ANALYSIS;

SELECT * FROM `finance_data`;

						/* || SUMMARY REPORT QUERIES || */

                            /* || KPI CARD VALUES || */

/* || KPI CARD 1 : TOTAL LOAN APPLICATION || */

SELECT FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION
FROM `finance_data`;

  /*  MTD LOAN APPLICATION */

SELECT FORMAT(COUNT(`﻿id`), "#.##") AS MTD_LOAN_APPLICATION
FROM `finance_data`
WHERE `Month` = "Dec";

  /*  PMTD LOAN APPLICATION */
   
SELECT FORMAT(COUNT(`﻿id`), "#.##") AS PMTD_LOAN_APPLICATION
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 2 : TOTAL FUNDED AMOUNT || */

SELECT concat('$ ', format(SUM(`loan_amount`), '#,00')) AS TOTAL_FUNDED_AMOUNT
FROM `finance_data`;

  /* MTD FUNDED AMOUNT */
  
SELECT concat('$ ', format(SUM(`loan_amount`), '#,00')) AS MTD_FUNDED_AMOUNT
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD FUNDED AMOUNT */
  
SELECT concat('$ ', format(SUM(`loan_amount`), '#,00')) AS PMTD_FUNDED_AMOUNT
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 3 : TOTAL AMOUNT RECIEVED || */

SELECT concat('$ ', format(SUM(`total_payment`), '#,00')) AS TOTAL_AMOUNT_RECIEVED
FROM `finance_data`;

  /* MTD AMOUNT RECIEVED */
  
SELECT concat('$ ', format(SUM(`total_payment`), '#,00')) AS MTD_AMOUNT_RECIEVED
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD AMOUNT RECIEVED */
  
SELECT concat('$ ', format(SUM(`total_payment`), '#,00')) AS PMTD_AMOUNT_RECIEVED
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 4 : AVERAGE OF INTEREST RATE || */

SELECT CONCAT(ROUND(AVG(`int_rate`)*100, 2), " %") AS INTEREST_RATE
FROM `finance_data`;

  /* MTD INTEREST RATE */
  
SELECT CONCAT(ROUND(AVG(`int_rate`)*100, 1), " %") AS MTD_INTEREST_RATE
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD INTEREST RATE */ 
  
SELECT CONCAT(ROUND(AVG(`int_rate`)*100, 1), " %") AS PMTD_INTEREST_RATE
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 5 : AVERAGE OF DEBT TO INCOME RATIO || */

SELECT CONCAT(ROUND(AVG(`dti`)*100, 2), " %") AS DTI
FROM `finance_data`;

  /* MTD DEBT TO INCOME RATIO */
  
SELECT CONCAT(ROUND(AVG(`dti`)*100, 1), " %") AS MTD_DTI
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD DEBT TO INCOME RATIO */
  
SELECT CONCAT(ROUND(AVG(`dti`)*100, 1), " %") AS PMTD_DTI
FROM `finance_data`
WHERE `Month` = "Nov";

                            /* || GOOD LOAN VS BAD LOAN ISSUED || */

/* || KPI 1 : GOOD LOAN ISSUED || */ 

SELECT 
     CONCAT(ROUND((COUNT(CASE WHEN `loan_status` = "Fully Paid" OR `loan_status` = "Current" THEN
     `﻿id` END) * 100) / COUNT(`﻿id`), 1), " %") AS GOOD_LOAN_PERCENTAGE
FROM `finance_data`;

  /* GOOD LOAN APPLICATION */

SELECT FORMAT(COUNT(`﻿id`), "#.##") AS GOOD_LOAN_APPLICATION
FROM `finance_data`
WHERE `loan_status` = "Fully Paid" OR `loan_status` = "Current";

  /* GOOD FUNDED AMOUNT */
  
SELECT CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS GOOD_FUNDED_AMOUNT
FROM `finance_data`
WHERE `loan_status` = "Fully Paid" OR `loan_status` = "Current";

  /* GOOD AMOUNT RECIEVED */
  
SELECT CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS GOOD_AMOUNT_RECIEVED
FROM `finance_data`
WHERE `loan_status` = "Fully Paid" OR `loan_status` = "Current";

/* || KPI 2 : BAD LOAN ISSUED || */

SELECT 
     CONCAT(ROUND((COUNT(CASE WHEN `loan_status` = "Charged Off" THEN `﻿id` END) * 100)
     / COUNT(`﻿id`), 1), " %") AS BAD_LOAN_ISSUED
FROM `finance_data`;

  /* BAD LOAN APPLICATION */
  
SELECT FORMAT(COUNT(`﻿id`), "#.##") AS BAD_LOAN_APPLICATION
FROM `finance_data`
WHERE `loan_status` = "Charged Off";

  /* BAD FUNDED AMOUNT */
  
SELECT CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS BAD_FUNDED_AMOUNT
FROM `finance_data`
WHERE `loan_status` = "Charged Off";

  /* BAD AMOUNT RECIEVED */
  
SELECT CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS BAD_AMOUNT_RECIEVED
FROM `finance_data`
WHERE `loan_status` = "Charged Off";

                            /* || LOAN STATUS || */
                            
/* || KPI 3 : LOAN STATUS WISE LOAN APPLICATION, FUNDED AMOUNT, AMOUNT RECIEVED,
              AVG INTEREST RATE AND DEBT TO INCOME RATIO || */
	
SELECT 
     `loan_status` AS LOAN_STATUS,
      FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION,
      CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS FUNDED_AMOUNT,
      CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS AMOUNT_RECIEVED,
      CONCAT(ROUND(AVG(`int_rate`)*100,1), " %") AS INTEREST_RATE,
      CONCAT(ROUND(AVG(`dti`)*100,1), " %") AS DTI
FROM `finance_data`
GROUP BY LOAN_STATUS;

						   /* OVERVIEW REPORT QUERIES */

                            /* || KPI CARD VALUES || */

/* || KPI CARD 1 : TOTAL LOAN APPLICATION || */

SELECT FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION
FROM `finance_data`;

  /*  MTD LOAN APPLICATION */

SELECT FORMAT(COUNT(`﻿id`), "#.##") AS MTD_LOAN_APPLICATION
FROM `finance_data`
WHERE `Month` = "Dec";

  /*  PMTD LOAN APPLICATION */
   
SELECT FORMAT(COUNT(`﻿id`), "#.##") AS PMTD_LOAN_APPLICATION
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 2 : TOTAL FUNDED AMOUNT || */

SELECT concat('$ ', format(SUM(`loan_amount`), '#,00')) AS TOTAL_FUNDED_AMOUNT
FROM `finance_data`;

  /* MTD FUNDED AMOUNT */
  
SELECT concat('$ ', format(SUM(`loan_amount`), '#,00')) AS MTD_FUNDED_AMOUNT
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD FUNDED AMOUNT */
  
SELECT concat('$ ', format(SUM(`loan_amount`), '#,00')) AS PMTD_FUNDED_AMOUNT
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 3 : TOTAL AMOUNT RECIEVED || */

SELECT concat('$ ', format(SUM(`total_payment`), '#,00')) AS TOTAL_AMOUNT_RECIEVED
FROM `finance_data`;

  /* MTD AMOUNT RECIEVED */
  
SELECT concat('$ ', format(SUM(`total_payment`), '#,00')) AS MTD_AMOUNT_RECIEVED
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD AMOUNT RECIEVED */
  
SELECT concat('$ ', format(SUM(`total_payment`), '#,00')) AS PMTD_AMOUNT_RECIEVED
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 4 : AVERAGE OF INTEREST RATE || */

SELECT CONCAT(ROUND(AVG(`int_rate`)*100, 2), " %") AS INTEREST_RATE
FROM `finance_data`;

  /* MTD INTEREST RATE */
  
SELECT CONCAT(ROUND(AVG(`int_rate`)*100, 1), " %") AS MTD_INTEREST_RATE
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD INTEREST RATE */ 
  
SELECT CONCAT(ROUND(AVG(`int_rate`)*100, 1), " %") AS PMTD_INTEREST_RATE
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI CARD 5 : AVERAGE OF DEBT TO INCOME RATIO || */

SELECT CONCAT(ROUND(AVG(`dti`)*100, 2), " %") AS DTI
FROM `finance_data`;

  /* MTD DEBT TO INCOME RATIO */
  
SELECT CONCAT(ROUND(AVG(`dti`)*100, 1), " %") AS MTD_DTI
FROM `finance_data`
WHERE `Month` = "Dec";

  /* PMTD DEBT TO INCOME RATIO */
  
SELECT CONCAT(ROUND(AVG(`dti`)*100, 1), " %") AS PMTD_DTI
FROM `finance_data`
WHERE `Month` = "Nov";

/* || KPI 1 : LOAN PURPOSE WISE LOAN APPLICATION, FUNDED AMOUNT 
              AND AMOUNT RECIEVED || */
 
SELECT
     `purpose` AS LOAN_PURPOSE,
      FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION,
      CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS FUNDED_AMOUNT,
      CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS AMOUNT_RECIEVED
FROM `finance_data`
GROUP BY LOAN_PURPOSE;

/* || KPI 2 : HOME OWNERSHIP WISE LOAN APPLICATION, FUNDED AMOUNT
              AND AMOUNT RECIEVED || */

SELECT
	 `home_ownership` AS HOME_OWNERSHIP,
      FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION,
      CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS FUNDED_AMOUNT,
      CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS AMOUNT_RECIEVED
FROM `finance_data`
GROUP BY HOME_OWNERSHIP;

/* || KPI 3 : MONTH WISE LOAN APPLICATION, FUNDED AMOUNT
              AND AMOUNT RECIEVED || */

SELECT 
     `Month` AS MONTH,
      FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION,
      CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS FUNDED_AMOUNT,
      CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS AMOUNT_RECIEVED
FROM `finance_data`
GROUP BY MONTH;

/* || KPI 3 : GRADE WISE LOAN APPLICATION, FUNDED AMOUNT
              AND AMOUNT RECIEVED || */

SELECT 
     `grade` AS GRADE,
      FORMAT(COUNT(`﻿id`), "#.##") AS LOAN_APPLICATION,
      CONCAT('$ ', FORMAT(SUM(`loan_amount`), "#.##")) AS FUNDED_AMOUNT,
      CONCAT('$ ', FORMAT(SUM(`total_payment`), "#.##")) AS AMOUNT_RECIEVED
FROM `finance_data`
GROUP BY GRADE;