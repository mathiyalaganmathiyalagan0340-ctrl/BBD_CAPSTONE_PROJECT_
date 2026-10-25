# Dashboard Specification — Big Billion Days Regional Performance Review

## Purpose and audience
Provide regional category managers and leadership with a traceable view of completed revenue, order status, product contribution and sales representative performance. Every displayed KPI must reconcile to the SQL outputs and the order-level CSV.

## Data source and revenue rule
- Source: `data/orders_enriched.csv`, generated from `sql/q09.sql`.
- Product category is joined from `products` by `item` when building category visuals.
- Revenue means `SUM(amount)` for orders where `status = 'completed'`. Pending and disputed orders are excluded from revenue KPIs.
- The CSV has 90 order rows. The original q09 fact table does not include category, so join the products table or add a verified category lookup in the spreadsheet if category is displayed.

## KPI cards
1. Total orders: 90 (all statuses).
2. Completed orders: 63.
3. Completed revenue: INR 346,200.
4. Average completed order value: INR 5,495.24 (completed revenue divided by completed order count; underlying SQL average is unrounded).
5. Orders with missing amount: 3 (all are pending in the provided seed).

## Visuals
1. **Completed revenue by region** — horizontal bar chart; region on axis, completed revenue in INR as value. Sort descending.
2. **Completed revenue by month** — line or column chart; order_month on the x-axis and completed revenue on y-axis, ordered chronologically.
3. **Product contribution** — bar chart by item, completed revenue descending, colored/labeled by `contribution_tier` from q12.
4. **Revenue by category** — bar chart using `products.category` joined to order item; completed orders only.
5. **Rep revenue versus monthly target** — clustered bar chart by rep and month; show revenue and monthly_target side by side, with `performance_tier` labels from q13.
6. **Order status distribution** — bar or donut chart showing order counts by completed, pending and disputed status. Do not label all-status amounts as revenue.

## Filters
- Region
- Order month
- Product category
- Product item
- Order status

Filters should apply consistently to all relevant charts. If a status filter includes pending or disputed orders, the revenue KPI must continue to follow the agreed completed-only definition, or be clearly labeled as a different metric.

## Verified starting findings
- Seed table counts: reps 4, products 9, customers 24, orders 90.
- Completed orders: 63.
- Completed revenue: INR 346,200.
- Highest completed-revenue region: North (INR 119,300).
- Product with highest completed revenue: Air Fryer (INR 104,000).
- Category revenue ranking: Electronics INR 142,300, Home INR 126,400, Apparel INR 77,500.
- Monthly completed revenue: 2026-09 INR 98,300, 2026-10 INR 93,100, 2026-11 INR 154,800.

## Recommendations and decision rules
- Use the region chart to direct the next promotional test toward the highest-revenue regions, but compare performance with order volume and target attainment before shifting a large budget.
- Use q12 to prioritize products with high contribution, while testing promotions for medium-tier products that have enough demand but lower contribution.
- Review reps/month combinations labeled `Below Target` with the regional manager before allocating extra promotion budget; a low result may reflect regional demand or timing, not only rep performance.
- Investigate pending orders with missing amounts before forecasting. Do not impute revenue from those orders.
- Treat this dataset as synthetic and limited to three months; recommendations are hypotheses to test, not causal conclusions.

## QA and reconciliation
- The headline KPI must match q05: total_orders = 63 and total_revenue = INR 346,200.
- The q09 export must have 10 columns and 90 data rows.
- q06 is a status report across all orders; q05 and revenue charts are completed-only.
- Save any dashboard calculation changes in this file before publishing.
