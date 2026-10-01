# Expense Claims

## Problem Statement

Employees pay for business costs out of pocket and chase paper receipts and email  
threads to get reimbursed. Managers approve claims manually with no single view  
of what is pending, and finance re-keys approved amounts into payroll by hand,  
which is slow and error-prone.  

## Solution

A web application where employees submit expense claims with receipts, managers
review and approve or reject them in one place, and finance exports the approved
claims to payroll in a batch, removing the manual re-entry step.

## Actors

- **Employee** — submits expense claims with receipts and tracks their status.
- **Manager** — reviews their team's pending claims and approves or rejects each one.
- **Finance** — exports approved claims to payroll.

## Features

- F1 [Submit expenses](features/F1-submit-expenses.md)
- F2 [Approvals](features/F2-approvals.md)
- F3 [Payroll export](features/F3-payroll-export.md)

## Product-wide

See [Product-wide](product-wide.md) for rules spanning more than one feature.

## Out of Scope

- Multi-currency expenses and currency conversion.
- Mobile apps (web only).
- Mileage or per-diem calculators.

