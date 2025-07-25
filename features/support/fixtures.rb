require 'ostruct'

module Fixtures
  def fixture(name, attributes = {})
    fixture_data = FIXTURES.fetch(name).call.merge(attributes)

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
        covering_letter_type: 'section_32',
        appointment_date: '5 February 2015',
        guider_first_name: 'Penelope',
        lead: 'You recently had a Pension Wise guidance appointment with Penelope on 5 February 2015.',
        format_preference: 'standard',
        appointment_type: 'standard',
        envelope_class: 'l-envelope--tpas',
        reference_number: '123456',
        next_steps?: false
      }
    end
  }.freeze

  private_constant :FIXTURES
end

World(Fixtures)
