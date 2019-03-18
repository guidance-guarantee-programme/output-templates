Feature: Covering letter
  As Pension Wise
  We want to set customer's expectations about their summary document
  So they understand what they've been sent and what it's for

Scenario: Summary documents are sent with a covering letter
  Given a customer has had a Pension Wise appointment
  When we generate a summary document
  Then it should include a covering letter

Scenario: Customer has a Section 32 arrangement pot
  Given a customer has had a Pension Wise appointment
  And the customer has a Section 32 arrangement pot
  When we generate a summary document
  Then the covering letter should have the Section 32 content

Scenario: Customer taking an adjustable income
  Given a customer has had a Pension Wise appointment
  And the customer has an adjustable income
  When we generate a summary document
  Then the covering letter should have the adjustable income content

Scenario: Customer has inherited their pension pot
  Given a customer has had a Pension Wise appointment
  And the customer has inherited their pension pot
  When we generate a summary document
  Then the covering letter should have the inherited pot content

Scenario: Customer has a fixed term annuity
  Given a customer has had a Pension Wise appointment
  And the customer has a fixed term annuity
  When we generate a summary document
  Then the covering letter should have the fixed term annuity content

Scenario: Customer has no cover letter customisation
  Given a customer has had a Pension Wise appointment
  And the customer has not customised their covering letter
  When we generate a summary document
  Then the covering letter should not have Section 32, adjustable income, fixed term annuity or inherited pot content
