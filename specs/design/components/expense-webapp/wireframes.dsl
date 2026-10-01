screen MyClaims "An employee's submitted claims and their status"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "My Claims"
  table "Date | Merchant | Amount | Status" -> ClaimDetail
    row "Oct 3 | Riverside Kitchen | $42.50 | Pending"
    row "Sep 28 | Acme Hotel | $310.00 | Approved"
    row "Sep 20 | City Taxi | $18.00 | Rejected"
  button "New Claim" primary -> NewClaim

screen NewClaim "Create a claim from one or more receipts"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "New Claim"
  card "Line Item 1"
    input "Upload receipt (image or PDF)"
    text "An agent reads the receipt and pre-fills the fields below"
    input "Amount"
    input "Expense date"
    input "Merchant"
    select "Category"
  button "Add another line item"
  row
    button "Cancel" -> MyClaims
    right
    button "Submit Claim" primary -> MyClaims

screen ClaimDetail "One claim's line items and decision"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "Claim Detail"
  badge "Rejected" danger
  table "Date | Merchant | Amount | Category"
    row "Sep 20 | City Taxi | $18.00 | Travel"
  text "Rejection reason: missing itemized receipt"
  button "Edit & Resubmit" primary -> EditClaim

screen EditClaim "Edit a rejected claim and resubmit it"
  navbar "Expense Claims"
  sidebar "My Claims -> MyClaims | New Claim -> NewClaim"
  heading "Edit Claim"
  card "Line Item 1"
    input "Upload receipt (image or PDF)"
    input "Amount"
    input "Expense date"
    input "Merchant"
    select "Category"
  row
    button "Cancel" -> ClaimDetail
    right
    button "Resubmit Claim" primary -> MyClaims

screen TeamClaims "Direct reports' pending claims, oldest first"
  navbar "Expense Claims"
  sidebar "Team Claims -> TeamClaims"
  heading "Team Claims"
  table "Employee | Date | Amount | Status" -> TeamClaimDetail
    row "Jordan Lee | Sep 20 | $18.00 | Pending"
    row "Priya Nair | Sep 22 | $512.00 | Pending"

screen TeamClaimDetail "Review a direct report's claim as a whole"
  navbar "Expense Claims"
  sidebar "Team Claims -> TeamClaims"
  heading "Claim from Jordan Lee"
  table "Date | Merchant | Amount | Category | Receipt"
    row "Sep 20 | City Taxi | $18.00 | Travel | receipt.jpg"
  textarea "Rejection reason (required to reject)"
  row
    button "Reject" danger -> TeamClaims
    right
    button "Approve" primary -> TeamClaims

screen ApprovedClaims "Approved claims not yet exported"
  navbar "Expense Claims"
  sidebar "Approved Claims -> ApprovedClaims | Export History -> ExportHistory"
  heading "Approved Claims"
  table "Employee | Date | Amount"
    row "Jordan Lee | Sep 18 | $75.00"
    row "Priya Nair | Sep 19 | $512.00"
  button "Export Selected" primary -> ExportHistory

screen ExportHistory "Past export batches, each a downloadable CSV"
  navbar "Expense Claims"
  sidebar "Approved Claims -> ApprovedClaims | Export History -> ExportHistory"
  heading "Export History"
  table "Date | Exported By | Claims | Download"
    row "Sep 30 | Dana Finance | 12 | CSV"
    row "Sep 15 | Dana Finance | 9 | CSV"

flow "Submit and track claims"
  role "Employee"
  description "An employee submits claims from receipts and tracks their status"
  MyClaims
  NewClaim
  ClaimDetail
  EditClaim

flow "Review team claims"
  role "Manager"
  description "A manager approves or rejects their direct reports' claims"
  TeamClaims
  TeamClaimDetail

flow "Export to payroll"
  role "FinanceReviewer"
  description "Finance exports approved claims to payroll as a CSV batch"
  ApprovedClaims
  ExportHistory
