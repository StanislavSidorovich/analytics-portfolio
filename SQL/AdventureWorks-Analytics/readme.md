# AdventureWorks — SQL Sales Analysis

A series of SQL queries analyzing sales performance across products, 
customers, territories, and categories using the AdventureWorks dataset 
(PostgreSQL).

## What's covered

**`01_basic_queries.sql`** — Foundational analysis
- Multi-table JOINs (2–4 tables per query)
- GROUP BY aggregations with SUM, ranking via ORDER BY + LIMIT
- Derived metrics: revenue and profit calculated from quantity × price/cost
- Business questions: top products, top countries/continents, top customers by volume and by revenue, category profitability

**`02_joins_cte_window.sql`** — Intermediate analysis
- CTEs (`WITH`) to break multi-step calculations into readable stages
- Window functions: `SUM() OVER()` for share-of-total calculations, `RANK() OVER (PARTITION BY ...)` for ranking subcategories within each category
- Percentage-of-total calculations (category share of revenue, country share of revenue)
- Profit margin analysis by category

## Sample business questions answered

- Which products and categories drive the most revenue vs. the most units sold?
- Which countries account for the largest share of total revenue?
- Which subcategory performs best *within* each category (not just overall)?
- How does profit margin vary by category?

## Tools
PostgreSQL syntax (window functions, `::numeric` casting, `NULLIF` for safe division).

