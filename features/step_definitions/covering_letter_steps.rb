Given(/^a customer has had a Pension Wise appointment$/) do
  @output_document = fixture(:output_document)
end

Then(/^it should include a covering letter$/) do
  expect(@rendered_template).to include_output_document_section('covering letter')
  expect(@rendered_template).to have_content(@output_document.attendee_address)
  expect(@rendered_template).to have_content(@output_document.attendee_name)
  expect(@rendered_template).to have_content(@output_document.lead)
end

Given(/^the customer has a Section 32 arrangement pot$/) do
  @output_document.covering_letter_type = 'section_32'
end

Given(/^the customer has an adjustable income$/) do
  @output_document.covering_letter_type = 'adjustable_income'
end

Given(/^the customer has inherited their pension pot$/) do
  @output_document.covering_letter_type = 'inherited_pot'
end

Then(/^the covering letter should have the Section 32 content$/) do
  expect(@rendered_template).to have_content('we found that your pension pot may be a ‘Section 32’ arrangement')
end

Then(/^the covering letter should have the adjustable income content$/) do
  expect(@rendered_template).to have_content('we found that you may already be taking an adjustable income')
end

Then(/^the covering letter should have the inherited pot content$/) do
  expect(@rendered_template).to have_content('we found you had inherited your pension pot')
end
