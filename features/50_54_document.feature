Feature: Summary document for under 55s
  As Pension Wise
  We want customers aged 50-54 to have a summary document relevant to their age bracket
  So that customers are reminded of what was discussed, including next steps that they may wish to take

Scenario: Customers aged 50-54 are given the appropriate summary document
  Given a customer has had a Pension Wise appointment
  And the customer is given a 50-54 appointment type
  When we generate a summary document
  Then the summary document should have the 50-54 content

Scenario: The 50-54 summary document warns customers that options could change in the future
  Given a customer has had a Pension Wise appointment
  And the customer is given a 50-54 appointment type
  When we generate a summary document
  Then the summary document should include a warning that options may have changed by the time the customer retires

Scenario: The 50-54 summary document lets customers know when most people can take their pension
  Given a customer has had a Pension Wise appointment
  And the customer is given a 50-54 appointment type
  When we generate a summary document
  Then the summary document should include guidance about what age most people can take their pension

Scenario: The 50-54 summary document warns customers about potential charges associated with leaving their pot untouched
  Given a customer has had a Pension Wise appointment
  And the customer is given a 50-54 appointment type
  When we generate a summary document
  Then the summary document should include a warning that they could be charged if they leave their pot untouched beyond their selected retirement age
