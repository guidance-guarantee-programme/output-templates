Given(/^the customer doesn't have a defined contribution pension pot$/) do
  @output_document = fixture(:output_document)
end

Then(/^the output should be an ineligibility letter$/) do
  expect(@rendered_template).to include_output_document_section('ineligible')
  expect(@rendered_template).to have_content(@output_document.attendee_address)
  expect(@rendered_template).to have_content(@output_document.attendee_name)
  expect(@rendered_template).to have_content(@output_document.lead)
end
