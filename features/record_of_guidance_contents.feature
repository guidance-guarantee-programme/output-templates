Feature: Record of guidance contents
  As Pension Wise
  We want to provide a record of guidance that is as tailored as possible
  So that customers are reminded of what was discussed, including next steps that they may wish to take

Scenario: Record of guidance
  Given a customer has had a Pension Wise appointment
  When we generate a record of guidance
  Then the sections it includes should be (in order):
    | introduction             |
    | options overview         |
    | detail about each option |
    | other information        |

Scenario: Records of guidance include the information provided to us by the customer
  Given we have captured the customer's details
  When we generate a record of guidance
  Then the record of guidance should include their details

Scenario: Records of guidance include information about the appointment
  Given we have captured appointment details
  When we generate a record of guidance
  Then the record of guidance should include the details of the appointment
