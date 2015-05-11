Feature: Covering letter
  As Pension Wise
  We want to set customer's expectations about their record of guidance
  So they understand what they've been sent and what it's for

Scenario: Tailored records of guidance are sent with a covering letter
  Given a customer has had a Pension Wise appointment
  When we generate a tailored record of guidance
  Then it should include a covering letter

Scenario: Generic records of guidance are sent with a covering letter
  Given a customer has had a Pension Wise appointment
  When we generate a generic record of guidance
  Then it should include a covering letter
