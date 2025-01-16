# Codebasics_Challenge9
The following project was created for the Challenge # 9 conducted by Codebasics.
- **Title**: Analyse Promotions and Provide Tangible Insights to Sales Director.

# Introduction
## Company Background
- AtliQ Mart is a retail giant with over 50 supermarkets in the southern region of India. All their 50 stores ran a massive promotion during the Diwali 2023 and Sankranti 2024 (festive time in India) on their AtliQ branded products.

## Agenda
- The sales director wants to understand which promotions did well and which did not so that they can make informed decisions for their next promotional period.

## Problem
- Sales director Bruce Haryali wanted this immediately but the analytics manager Tony is engaged on another critical project.

## Decision
- Tony decided to give this work to Peter Pandey who is the curious data analyst of AtliQ Mart. Since these insights will be directly reported to the sales director, Tony also provided some notes to Peter to support his work.

## Challenge given
My role was to act as Peter Pandey and perform the following task to keep up the trust with my manager Tony Sharma. 
- Go through the metadata and analyze the datasets thoroughly.
- Check “Recommended Insights.pdf” – this document contains a few recommendations from your manager Tony.
- Check “ad-hoc-requests.pdf” - this document includes important business questions posed by senior executives, requiring SQL-based report generation.
- Design a dashboard with your metrics and analysis. The dashboard should be self-explanatory and easy to understand.

## About Data Tables
- 4 Tables (3 dimension tables and 1 fact table): The following tables were available in csv format.

| Table name and Size | Description |
| :------------------- | :------------------- |
| dim_campaigns - **(2 rows, 4 columns)** | Campaigns information |
| dim_products - **(15 rows, 3 columns)** | Products information |
| dim_stores - **(50 rows, 2 columns)** | Stores information |
| fact_events - **(1500 rows, 7 columns)** | Information regarding Sales / Promotions Events |

Along with it, there was a database file that contains all of these data tables for analyses by exectuing SQL query statements. 

## Tools
* **MySQL** : To perform data analysis for Ad-Hoc requests by exceuting the query statements. 
* **PowerBI** : To create visualizations and dashboard which further will be utilized by the Sales Director.

- Feel Free to Explore the Dashboard: 
[Link](https://app.powerbi.com/view?r=eyJrIjoiN2ZkZjdhM2UtZDU4OC00YjFhLThlYTYtYWJjODRlZDI2NjcxIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9)

## Things I Learnt
- **Fast - Moving Consumer Goods (FMCG) Domain terminologies:** Sales, Revenue, Incremental Revenue, Incremental Sales Unit, Sales and Revenue Contribution.
- **Dashboarding Concepts**:
    - New KPI Card for showing important Key Performance Indicators.
    - Designing Toggle switch using bookmark and selection pane for navigating between the visuals.
    - Using buttons for navigating between different pages of dashboard.
    - Performing conditional formating inside matrix / tables.
    - Inserting required filters / slicers.
    - Using charts like stacked bar chart, donut chart, line chart.
    - Implementing DAX in PowerBI.

## Business Requests Outcomes
- **BR1**: Provide a list of products with a base price greater than 500 and that are featured in promo type of 'BOGOF' (Buy One Get One Free). This information will help us identify high-value products that are currently being heavily discounted, which can be useful for evaluating our pricing and promotion strategies.

| product_name | base_price |
| :------------------- | :------------------- |
| Atliq_Double_Bedsheet_set | 1190 |
| Atliq_waterproof_Immersion_Rod | 1020 |

- **BR2**: Generate a report that provides an overview of the number of stores in each city. The results will be sorted in descending order of store counts, allowing us to identify the cities with the highest store presence.The report includes two essential fields: city and store count, which will assist in optimizing our retail operations.

| city | store_count |
| :------------------- | :------------------- |
| Bengaluru | 10 |
| Chennai | 8 |
| Hyderabad | 7 |
| Coimbatore | 5 |
| Visakhapatnam | 5 |
| Madurai | 4 |
| Mysuru | 4 |
| Mangalore | 3 |
| Trivandrum | 2 |
| Vijayawada | 2 |

- **BR3**: Generate a report that displays each campaign along with the total revenue generated before and after the campaign? The report includes three key fields: campaign_name, totaI_revenue(before_promotion), totaI_revenue(after_promotion). This report should help in evaluating the financial impact of our promotional campaigns. (Display the values in millions)



- **BR4**: Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category during the Diwali campaign. Additionally, provide rankings for the categories based on their ISU%. The report will include three key fields: category, isu%, and rank order. This information will assist in assessing the category-wise success and impact of the Diwali campaign on incremental sales.



- **BR5**: Create a report featuring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), across all campaigns. The report will provide essential information including product name, category, and ir%. This analysis helps identify the most successful products in terms of incremental revenue across our campaigns, assisting in product optimization.



## Key Insights
- The overall sales after applying promotions increased by 212% as well as the revenue had also increased by 95%.
- There was a significant increased in sales during the Sankranti 2024 which accounts to 338% while it was just 97% in Diwali 2023 after applying promotions on the Atliq products.
- In terms of revenue, there was a 2% difference between two promotions, it had rocketed by 96% during Sankranti 2024 and during Diwali 2023 it was around 94%.
- Store / Cities:
      - The top 10 stores came from the cities like Bengaluru, Chennai    

## Thank You
- I would like to thank Dhaval Patel, Hemanand Vadivel and to the entire team of Codebasics for creating such challenge that give me hands-on practice on real-life projects. Also, would like to thank them for this unique opportunity that is leading me to build my resume projects.
