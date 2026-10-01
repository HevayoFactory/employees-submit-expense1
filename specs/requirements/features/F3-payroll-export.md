# Payroll export

## Purpose

Lets finance export approved expense claims to payroll in a batch. 

Needs: F2.

## User Stories

- F3.1 As finance, I see all approved claims that have not yet been exported. sk
- F3.2 As finance, I select approved claims and export them as a CSV file to download.
- F3.3 As finance, once a claim has been exported, it is marked exported and never appears in a later export.
- F3.4 As finance, I see a history of past exports (when, by whom, which claims).

## Decisions

- The export is a CSV file finance downloads and uploads into payroll separately; there is no direct integration with a payroll system.
- Finance triggers each export on demand; nothing runs on a schedule.
- An exported claim is locked from being exported again, preventing duplicate payouts.

## Out of Scope

- Direct integration with a named payroll system (a future enhancement, not this build).

