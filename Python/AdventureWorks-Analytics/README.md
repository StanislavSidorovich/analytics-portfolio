# AdventureWorks Sales Analytics

A sales and profitability analysis of the AdventureWorks dataset (2020–2022), built in Python (Pandas, Matplotlib) to answer core business questions about revenue drivers, profitability, geographic markets, and growth trends.

## Business Questions

- Which products and categories generate the most revenue and profit?
- Which countries are the strongest markets, and how concentrated is revenue across them?
- How do profit margins vary across product categories?
- How has revenue and profit performed over time?

## Key Findings

- Bikes generated over 95% of total revenue and the highest absolute profit.
- Accessories achieved the highest profit margin (62.8%), despite generating significantly lower revenue than Bikes.
- The United States and Australia were the top two markets, together contributing more than 60% of total revenue.
- Monthly revenue more than tripled between early 2020 and mid-2022, with the strongest growth starting mid-2021.
- The Components category recorded zero transactions in this dataset, confirmed by direct filtering rather than a data merge issue.

## Tools

Python, Pandas, Matplotlib, Jupyter Notebook

## Data

AdventureWorks sales transactions (2020–2022) plus product, territory, category, and subcategory lookup tables.
Source: 
https://www.kaggle.com/datasets/shaikhshoeb/adventureworks-dataset-for-data-analysis

## How to Run

1. Clone this repository
2. Install dependencies: `pip install -r requirements.txt`
3. Place the AdventureWorks CSV files in the project folder (see file names referenced in the notebook)
4. Open `adventureworks_analysis_1.ipynb` in Jupyter and run all cells top to bottom

## Project Structure

. 
├── adventureworks_analysis_1.ipynb 
├── README.md 
└── requirements.txt

## Author

Stanislav Sidorovich
GitHub:
https://github.com/StanislavSidorovich
https://www.linkedin.com/in/stanislavsidorovich/
