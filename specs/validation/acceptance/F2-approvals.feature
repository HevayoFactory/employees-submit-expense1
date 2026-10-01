Feature: F2 Approvals

  @story-F2.1
  Rule: A manager sees their direct reports' pending claims, oldest first

    Scenario: Dana opens the team claims list
      Given Dana manages Jordan, who submitted a claim on "2026-09-20"
      And Dana manages Priya, who submitted a claim on "2026-09-22"
      When Dana opens her team claims list
      Then Jordan's claim appears before Priya's claim

  @story-F2.2
  Rule: A manager opens a claim to review its line items and receipts

    Scenario: Dana reviews a direct report's claim
      Given Jordan submitted a claim with a line item for "City Taxi" and its receipt
      When Dana opens Jordan's claim
      Then she sees the "City Taxi" line item and its receipt

  @story-F2.3 @story-F2.4
  Rule: Only the employee's direct line manager may approve or reject their claim

    @negative
    Scenario: A manager who is not the employee's manager cannot act on the claim
      Given Priya's manager is Dana, not Sam
      And Priya has a pending claim
      When Sam tries to open Priya's claim
      Then Sam does not see the claim

  @story-F2.3
  Rule: A manager approves a claim as a whole

    Scenario: Dana approves a complete claim
      Given Jordan has a pending claim with two line items
      When Dana approves the claim
      Then the claim's status is "approved"

  @story-F2.4
  Rule: A manager rejects a claim as a whole, giving a reason the employee can see

    Scenario: Dana rejects a claim with a reason
      Given Jordan has a pending claim
      When Dana rejects it with the reason "missing itemized receipt"
      Then the claim's status is "rejected"
      And Jordan sees the reason "missing itemized receipt" on the claim

    @negative
    Scenario: Rejecting without a reason is refused
      Given Jordan has a pending claim
      When Dana tries to reject it with no reason
      Then the claim's status is still "pending"
