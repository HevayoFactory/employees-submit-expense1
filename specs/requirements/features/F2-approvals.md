# Approvals

## Purpose

Lets a manager see their team's pending expense claims, and approve or reject
each one.

Needs: F1.

## User Stories

- F2.1 As a manager, I see my team's pending claims in one list, oldest first.
- F2.2 As a manager, I open a claim to review its line items and receipts.
- F2.3 As a manager, I approve a claim as a whole.
- F2.4 As a manager, I reject a claim as a whole, giving a reason the employee can see.

## Decisions

- A claim is approved by the employee's direct line manager only; there is no threshold above which Finance also approves.
- A manager acts on the whole claim, not line item by line item.
- There is no delegate approver: a claim with no manager on record, or whose manager is away, simply waits.
- Each employee's manager is existing organization data (who manages whom); this feature does not let anyone change that assignment.

## Out of Scope

- Approval chains beyond the employee's direct line manager.
- Delegate or backup approvers.
- Line-item-level approval within a claim.

