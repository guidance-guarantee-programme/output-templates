Feature: Generic record of guidance contents
  As Pension Wise
  We want to provide a record of guidance that is as tailored as possible
  So that customers are reminded of what was discussed, including next steps that they may wish to take

Scenario: Generic record of guidance
  Given we don't know that any of the predefined circumstances apply to the customer
  When we generate a generic record of guidance
  Then the sections it includes should be (in order):
    | introduction             |
    | pension pot              |
    | options overview         |
    | detail about each option |
    | other information        |

Scenario Outline: "Pension pot" section is tailored based on the range of income sources available to the customer
  Given the customer has access to income during retirement from <sources-of-income>
  When we generate a generic record of guidance
  Then the "pension pot" section should be the "<sources-of-income>" version

  Examples:
    | sources-of-income                   |
    | multiple sources                    |
    | only their DC pot and state pension |

@todo
Scenario: Records of guidance include the information provided to us by the customer
  Given we have captured the customer's details in an appointment summary
  When we generate a generic record of guidance
  Then the record of guidance should include their details

@todo
Scenario: Records of guidance include information about the appointment
  Given we have captured appointment details in an appointment summary
  When we generate a generic record of guidance
  Then the record of guidance should include the details of the appointment
