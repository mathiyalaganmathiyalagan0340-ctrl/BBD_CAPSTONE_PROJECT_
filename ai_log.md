# AI Assistance and Verification Log

## Disclosure
An AI assistant was used to help draft the SQL query files, documentation structure, spreadsheet cleaning notes, dashboard specification, and this verification log. The project owner must review the generated artifacts and retain responsibility for the submitted work.

## Verification method
- Executed the seed script in SQLite.
- Checked the seed table counts against the brief.
- Executed q01 through q13 against the loaded seed dataset.
- Compared query row counts with the acceptance criteria.
- Checked q05 total completed orders and revenue.
- Exported q09 results with the specified ten-column header and blank CSV fields for NULL amounts.
- Derived dashboard summary values from SQL queries against the same loaded dataset.

## Verification results
- Seed counts: reps = 4, products = 9, customers = 24, orders = 90.
- Query row counts: q01 = 19, q02 = 3, q03 = 5, q04 = 8, q05 = 1, q06 = 3, q07 = 4, q08 = 4, q09 = 90, q10 = 4, q11 = 12, q12 = 9, q13 = 12.
- q05: total_orders = 63; total_revenue = INR 346,200.
- q09 export: 90 data rows, ten columns, with NULL amount values represented as empty fields.

## Limitations and owner review
- AI-generated explanations and recommendations are drafts, not independent evidence. Verify them against `results/query_results.md` and the CSV before submission.
- The dashboard is specified in Markdown; no Tableau workbook is included.
- The spreadsheet notes describe the cleaning process and formulas. The student should perform the cleaning in Google Sheets and record any actual changes made.
- Before submission, the project owner should rerun the queries in the chosen compiler and update this log if any result or workflow differs.
