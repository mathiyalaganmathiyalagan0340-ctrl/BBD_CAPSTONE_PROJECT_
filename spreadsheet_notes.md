# Spreadsheet Cleaning and Reconciliation Notes

## Import
1. Import `data/orders_enriched.csv` into Google Sheets using comma as the separator.
2. Keep the original imported tab unchanged as `raw_orders_enriched`.
3. Create a second tab named `cleaned_orders` and copy the source data before applying transformations.

## Cleaning actions
- Trim leading/trailing spaces from `first_name` and `last_name`.
- Standardize customer name capitalization for presentation. Example: `  Vikram` → `Vikram`, `RAHUL` → `Rahul`, `iyer` → `Iyer`.
- Preserve the original raw tab so every cleaned value can be traced to the source.
- Do not fill missing `amount` values with guessed values. The three missing amounts are pending orders; leave the amount blank and document them as data-quality exceptions.
- Keep `order_id` unique and preserve all 90 rows.

## Suggested Google Sheets formulas
Assuming the imported data has headers in row 1 and `first_name` is column C and `last_name` is column D:
- Clean first name in a helper column: `=PROPER(TRIM(C2))`
- Clean last name in a helper column: `=PROPER(TRIM(D2))`
- Count rows/orders: `=COUNTA(A2:A91)`
- Completed order count: `=COUNTIF(J2:J91,"completed")`
- Completed revenue: `=SUMIF(J2:J91,"completed",I2:I91)`
- Missing amount count: `=COUNTBLANK(I2:I91)` (check this column carefully; it should count the empty amount cells in the exported CSV).

Adjust column letters if the sheet import changes the column positions. After review, paste helper columns as values only if you choose to replace the displayed names.

## Reconciliation checks
- Raw rows: 90.
- Completed orders: 63.
- Completed revenue: INR 346,200.
- Missing amount cells: 3.
- The SQL revenue definition includes only `status = 'completed'`; pending and disputed amounts must not be included in revenue.
- Do not compare the sum of all non-NULL amounts across all statuses to completed revenue; they answer different questions.

## Audit trail
Record any additional edits made in the spreadsheet, the date, and the reason. Keep the raw tab for traceability.
