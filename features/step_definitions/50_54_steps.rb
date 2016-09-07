Given(/^the customer is given a 50-54 appointment type$/) do
  @output_document = fixture(:output_document, appointment_type: '50_54')
end

Then(/^the summary document should have the 50-54 content$/) do
  expect(@rendered_template).to have_keyword('appointment-50-54')
end

Then(/^the summary document should include (?:a warning|guidance about) (.*?)$/) do |guidance|
  section = case guidance
            when 'that options may have changed by the time the customer retires'
              'options may have changed warning'
            when 'what age most people can take their pension'
              'guidance about when you can take your pension'
            when 'that they could be charged if they leave their pot untouched beyond their selected retirement age'
              'warning about leaving pot beyond selected retirement age'
            end

  expect(@rendered_template).to include_output_document_section(section)
end
