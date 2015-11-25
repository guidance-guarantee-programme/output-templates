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
        guider_first_name: 'Penelope',
        guider_organisation: 'Citizens Advice',
        lead: 'You recently had a Pension Wise guidance appointment with Penelope ' \
              'from Citizens Advice on 5 February 2015.'
      }
    end
  }

  private_constant :FIXTURES
end

World(Fixtures)
