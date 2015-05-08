Given(/^a customer has had a Pension Wise appointment$/) do
  @output_document = fixture(:output_document)
end

Then(/^it should include a covering letter$/) do
  expect(@rendered_template).to include_output_document_section('covering letter')
  expect(@rendered_template).to have_content(@output_document.attendee_address)
  expect(@rendered_template).to have_content(@output_document.attendee_name)
  expect(@rendered_template).to have_content(@output_document.lead)
end
