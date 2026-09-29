# Maven Market — Retail Sales Dashboard

Power BI dashboard analyzing retail transactions across stores, products, 
and time periods using the Maven Market dataset.

## Dashboard Preview

![Dashboard](screenshots/Dashboard.jpg)

## What it shows

- Revenue, profit, and returns tracked against monthly targets (KPI cards with trend lines)
- Weekly revenue trend over a two-year period
- Geographic breakdown of transactions by store location (map + treemap by country/state/city)
- Product brand performance — total transactions, profit, profit margin, and return rate (pivot table)
- Country-level slicer for filtering all visuals

## Key insights

- In the latest month, transactions (18,325) and profit (71.7K) beat their targets by about 5.7% and 5.6%. Returns (569) came in about 1% above target — the one KPI to watch.
- Profit margin is very stable across brands (about 58–64%, 59.9% overall), so differences in brand profit come from volume rather than pricing.
- The return rate stays at about 1% for every brand. No single brand drives returns.
- The USA accounts for the largest share of transactions, followed by Mexico, with Canada a small share.
- Weekly revenue rose noticeably in 1998 compared with 1997.

## Key DAX measures

```dax
ytd revenue = CALCULATE([total revenue], DATESYTD('Calendar'[date]))

60-day rolling = CALCULATE([total revenue], 
    DATESINPERIOD('Calendar'[date], MAX('Calendar'[date]), -60, DAY))

last month revenue = CALCULATE([total revenue], DATEADD('Calendar'[date], -1, MONTH))

return rate = [quantity returned] / [quantity sold]

profit margin = [total profit] / [total revenue]

revenue target = [last month revenue] * 1.05
```

A full reference of all measures with formulas is included on the second page of the report ("DAX reference").

## Data model

Star schema with one fact table and supporting dimensions:
- **Transaction data** (fact) — sales transactions
- **Returns** (fact) — product returns
- **Products**, **Stores**, **Customers**, **Calendar**, **Regions** (dimensions)

## How to open

Requires [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free, Windows only).
Download the `.pbix` file and open locally.

No Power BI? A static export of both report pages is available as [PDF](maven_market_dashboard.pdf).
