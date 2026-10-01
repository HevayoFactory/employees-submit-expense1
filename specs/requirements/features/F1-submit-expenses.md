# Submit expenses

## Purpose

Lets an employee create an expense claim, attach a receipt, and track its
status through approval. An agent reads the uploaded receipt (image or PDF)
and pre-fills the claim's amount, date, merchant and category for the
employee to confirm or edit before submitting.

## User Stories

- F1.1 As an employee, I create an expense claim and add one or more line items to it, each with an amount, date, merchant and category.
- F1.2 As an employee, I attach a receipt (image or PDF) to each line item; a line item cannot be submitted without one.
- F1.3 As an employee, when I upload a receipt, an agent reads it and pre-fills the line item's amount, date, merchant and category for me to confirm or edit.
- F1.4 As an employee, I pick a category for each line item from a fixed company list.
- F1.5 As an employee, I submit my claim once every line item has an amount, date, category and receipt.
- F1.6 As an employee, I see the status of each claim I've submitted (pending, approved, rejected).
- F1.7 As an employee, when my claim is rejected, I edit it and resubmit the same claim. Needs: F2.

## Decisions

- A claim bundles one or more line items and is approved or rejected as a whole, not line item by line item.
- Categories are a fixed list the company sets (e.g. Travel, Meals, Lodging, Supplies, Other); the exact list is a detail for design.

