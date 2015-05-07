Given(/^a customer has had a Pension Wise appointment$/) do
  @output_document_data = fixture(:output_document)
end

Then(/^it should include a covering letter$/) do
  expect(@rendered_template).to include_output_document_section('covering letter')
  expect(@rendered_template).to include(@output_document_data.attendee_address)
  expect(@rendered_template).to include(@output_document_data.attendee_name)
  expect(@rendered_template).to include(@output_document_data.lead)
end
