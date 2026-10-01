# Domain model

The core entities behind expense claims: an employee submits a claim made of
one or more line items, a claim is approved or rejected as a whole by the
employee's manager, and finance groups approved claims into export batches.

```mermaid
erDiagram
    EMPLOYEE ||--o{ CLAIM : submits
    EMPLOYEE ||--o{ EMPLOYEE : manages
    CLAIM ||--o{ LINE_ITEM : contains
    EXPORT_BATCH ||--o{ CLAIM : includes

    EMPLOYEE {
        string id
        string name
        string email
        string managerId
    }
    CLAIM {
        string id
        string employeeId
        string status
        string rejectionReason
        string exportBatchId
        datetime submittedAt
        datetime decidedAt
    }
    LINE_ITEM {
        string id
        string claimId
        decimal amount
        date expenseDate
        string merchant
        string category
        string receiptUrl
    }
    EXPORT_BATCH {
        string id
        string exportedBy
        datetime exportedAt
    }
```

- `CLAIM.status` is one of `pending`, `approved`, `rejected`. A rejected claim
is edited in place and resubmitted, so it returns to `pending`.
- `LINE_ITEM.category` is one of the fixed company categories (Travel, Meals,
Lodging, Supplies, Other).
- `CLAIM.exportBatchId` is set the moment a claim is included in an export,
which is what excludes it from every later export.