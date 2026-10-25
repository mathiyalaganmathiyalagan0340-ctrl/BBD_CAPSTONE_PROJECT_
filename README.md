# Big Billion Days Regional Performance Review

## Objective
Build a traceable analytics pipeline for synthetic Flipkart Big Billion Days data: SQL reporting, spreadsheet cleaning and reconciliation, dashboard specification, and AI-assisted work verification.

## Tools and SQL dialect
- SQL compiler: SQLiteOnline (or another SQLite-compatible compiler).
- SQL dialect: SQLite.
- Spreadsheet: Google Sheets.
- Dashboard: Tableau Public is optional; the graded specification is `docs/dashboard_spec.md`.

## Repository structure
- `sql/00_schema_and_seed.sql` — schema and supplied seed data.
- `sql/q01.sql` to `sql/q13.sql` — reporting queries.
- `results/query_results.md` — seed counts, query row counts and result tables.
- `data/orders_enriched.csv` — full q09 order-level fact export.
- `docs/spreadsheet_notes.md` — cleaning, formulas and reconciliation.
- `docs/dashboard_spec.md` — dashboard KPIs, charts, filters and recommendations.
- `docs/ai_log.md` — AI-use disclosure and verification record.

## How to run
1. Open SQLiteOnline or another SQLite-compatible SQL editor.
2. Run all statements in `sql/00_schema_and_seed.sql` once in a fresh database.
3. Confirm counts: reps 4, products 9, customers 24, orders 90.
4. Run each query file `q01.sql` through `q13.sql` against that database.
5. Compare the results with `results/query_results.md`.
6. Export q09 with the exact ten-column header to `data/orders_enriched.csv`.
7. Import the CSV into Google Sheets and follow `docs/spreadsheet_notes.md`.

## Revenue definition
Revenue is the sum of `amount` over orders whose `status` is `completed`. Pending and disputed orders are excluded from revenue.

## Key verified figures
- Total source orders: 90.
- Completed orders: 63.
- Completed revenue: INR 346,200.
- Missing amount values: 3.
- q09 output: 90 rows and 10 columns.

## Data quality
The seed intentionally includes inconsistent customer-name spacing/capitalization and three missing amount values. The original q09 CSV preserves source names and represents missing amounts as empty CSV fields. Cleaning steps are documented separately; missing amounts must not be guessed.

## AI assistance
See `docs/ai_log.md` for disclosure, checks performed and remaining owner-review steps.

## Submission note
Commit all text and CSV deliverables to the public `main` branch. Submit the repository URL pointing to `/tree/main`, not a zip or individual file. Review all generated outputs and make sure you understand the queries before submitting.
