Feature: Large theme
  As Pension Wise
  We want to provide accessible records of guidance
  So we can include as many people from our audience as possible

Scenario: Summary documents are generated with the large theme
  Given we have captured the customer's details
  When we apply the large theme
  And we generate a summary document
  Then the summary document should include the large theme

Scenario: Summary documents are generated without the large theme
  Given we have captured the customer's details
  When we generate a summary document
  Then the summary document should not include the large theme
