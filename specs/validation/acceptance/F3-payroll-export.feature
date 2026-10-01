Feature: F3 Payroll export

  @story-F3.1
  Rule: Finance sees every approved claim that has not yet been exported

    Scenario: Dana the finance reviewer opens the approved claims list
      Given Jordan's claim for "$75.00" was approved and has not been exported
      And Priya's claim for "$512.00" was approved and was exported last week
      When Dana opens the approved claims list
      Then she sees Jordan's claim and not Priya's claim

  @story-F3.2
  Rule: Finance exports selected approved claims as a CSV file

    Scenario: Dana exports a batch of approved claims
      Given Jordan's and Priya's approved claims have not yet been exported
      When Dana selects both and exports them
      Then a CSV file containing both claims is produced

  @story-F3.3
  Rule: An exported claim is locked from being exported again

    @negative
    Scenario: A claim already in one export batch is excluded from a later one
      Given Jordan's approved claim was included in yesterday's export batch
      When Dana opens the approved claims list today
      Then Jordan's claim does not appear in it

  @story-F3.4
  Rule: Finance sees a history of past exports

    Scenario: Dana reviews the export history
      Given Dana exported a batch of 2 claims yesterday
      When she opens the export history
      Then she sees yesterday's batch with 2 claims
