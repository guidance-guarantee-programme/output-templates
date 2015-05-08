require 'ostruct'

module Fixtures
  def fixture(name, attribues = {})
    fixture_data = FIXTURES.fetch(name).call.merge(attribues)

    OpenStruct.new(fixture_data)
  end

  FIXTURES = {
    output_document: proc do
      {
        attendee_name: 'Mr Joe Bloggs',
        attendee_address: ['Mr Joe Bloggs',
                           'HM Treasury',
                           '1 Horse Guards Road',
                           'Westminster',
                           'London',
                           'Greater London',
                           'SW1A 2HQ'].join("\n"),
        appointment_date: '5 February 2015',
        value_of_pension_pots: '£35,000 to £55,000',
        income_in_retirement: 'pension',
        guider_first_name: 'Penelope',
        guider_organisation: 'Citizens Advice',
        lead: 'You recently had a Pension Wise guidance appointment with Penelope ' \
              'from Citizens Advice on 5 February 2015.',
        continue_working: true,
        unsure: true,
        leave_inheritance: true,
        wants_flexibility: true,
        wants_security: true,
        wants_lump_sum: true,
        poor_health: true
      }
    end
  }

  private_constant :FIXTURES
end

World(Fixtures)
