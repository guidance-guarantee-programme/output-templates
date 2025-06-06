Feature: Summary document contents
  As Pension Wise
  We want to provide a summary document that is as tailored as possible
  So that customers are reminded of what was discussed, including next steps that they may wish to take

Scenario: No supplementary information
  Given a customer doesn’t require any supplementary information
  When we generate a summary document
  Then the sections it includes should be (in order):
    | getting started          |
    | options overview         |
    | detail about each option |
    | inheritance tax          |
    | scams                    |
    | pension tax rules        |
    | feedback                 |
    | further guidance         |

Scenario Outline: Supplementary information can be included
  Given the customer requires supplementary information about "<topic>"
  When we generate a summary document
  Then it should include supplementary information about "<topic>"

  Examples:
    | topic                                   |
    | Benefits and pension income             |
    | Debt and pensions                       |
    | Final salary or career average pensions |
    | Pensions and ill health                 |
    | Pension transfers                       |

Scenario: Summary documents include the information provided to us by the customer
  Given we have captured the customer's details
  When we generate a summary document
  Then the summary document should include their details

Scenario: Summary documents include no additional next steps when unspecified
  Given a customer doesn't require any additional next steps
  When we generate a summary document
  Then the summary document does not include any additional next steps

Scenario: Summary documents include additional next steps when specified
  Given a customer requires additional next steps
  When we generate a summary document
  Then the summary document includes the additional next steps

Scenario: Summary documents include information about the appointment
  Given we have captured appointment details
  When we generate a summary document
  Then the summary document should include the details of the appointment
  And the summary document does not include the Pension Wise Digital URN

Scenario: Pension Wise Digital Summary includes the URN
  Given we have captured appointment details with a URN
  When we generate a summary document
  Then the summary document includes the Pension Wise Digital URN
