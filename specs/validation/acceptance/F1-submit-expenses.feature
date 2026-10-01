Feature: F1 Submit expenses

  @story-F1.1
  Rule: A claim bundles one or more line items

    Scenario: An employee adds a second line item to a draft claim
      Given Priya has started a claim with one line item for "Riverside Kitchen"
      When she adds a second line item for "City Taxi"
      Then her draft claim has 2 line items

  @story-F1.2
  Rule: A line item cannot be submitted without a receipt

    @negative
    Scenario: Submitting a claim with a line item missing a receipt
      Given Priya has a draft claim with one line item for "City Taxi" with no receipt attached
      When she tries to submit the claim
      Then the claim is not submitted

  @story-F1.3
  Rule: An agent pre-fills a line item from its uploaded receipt

    Scenario: Priya uploads a receipt and reviews the pre-filled fields
      Given Priya is adding a line item to a draft claim
      When she uploads a receipt image for "Riverside Kitchen" dated "2026-09-20" for "$42.50"
      Then the line item's merchant, date and amount are pre-filled from the receipt for her to confirm

  @story-F1.4
  Rule: A line item's category comes from a fixed company list

    Scenario: Priya picks a category for a line item
      Given Priya is adding a line item to a draft claim
      When she sets its category to "Meals"
      Then the line item's category is "Meals"

  @story-F1.5
  Rule: A claim can only be submitted once every line item is complete

    Scenario: Submitting a claim whose line items are all complete
      Given Priya has a draft claim whose only line item has an amount, date, merchant, category and receipt
      When she submits the claim
      Then the claim's status is "pending"

    @negative
    Scenario: Submitting a claim with an incomplete line item
      Given Priya has a draft claim whose only line item has no category set
      When she tries to submit the claim
      Then the claim is not submitted

  @story-F1.6
  Rule: An employee sees the status of each claim they have submitted

    Scenario: Priya checks her claim list
      Given Priya has submitted a claim that is still pending
      And she has a claim that was rejected
      When she opens her claims list
      Then she sees one claim marked "pending" and one marked "rejected"

  @story-F1.7
  Rule: A rejected claim is edited and resubmitted, not recreated

    Scenario: Priya fixes and resubmits a rejected claim
      Given Priya has a claim that was rejected for a missing receipt
      When she attaches the receipt and resubmits the same claim
      Then the claim's status is "pending" again
