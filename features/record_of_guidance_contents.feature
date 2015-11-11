Feature: Record of guidance contents
  As Pension Wise
  We want to provide a record of guidance that is as tailored as possible
  So that customers are reminded of what was discussed, including next steps that they may wish to take

Scenario: No supplementary information
  Given a customer doesn’t require any supplementary information
  When we generate a record of guidance
  Then the sections it includes should be (in order):
    | getting started          |
    | options overview         |
    | detail about each option |
    | inheritance tax          |
    | scams                    |
    | further guidance         |

Scenario Outline: Supplementary information can be included
  Given the customer requires supplementary information about "<topic>"
  When we generate a record of guidance
  Then it should include supplementary information about "<topic>"

  Examples:
    | topic                                   |
    | Benefits and pension income             |
    | Debt and pensions                       |
    | Final salary or career average pensions |
    | Pensions and ill health                 |

Scenario: Records of guidance include the information provided to us by the customer
  Given we have captured the customer's details
  When we generate a record of guidance
  Then the record of guidance should include their details

Scenario: Records of guidance include information about the appointment
  Given we have captured appointment details
  When we generate a record of guidance
  Then the record of guidance should include the details of the appointment
