Given(/^a customer has had a Pension Wise appointment$/) do
  @output_document = fixture(:output_document, reference_number: '123456')
end

Then(/^it should include a covering letter$/) do
  expect(@rendered_template).to include_output_document_section('covering letter')
  expect(@rendered_template).to have_content('Booking reference number: 123456')
  expect(@rendered_template).to have_content(@output_document.attendee_address)
  expect(@rendered_template).to have_content(@output_document.attendee_name)
  expect(@rendered_template).to have_content(@output_document.lead)
end

Given(/^the customer has a Section 32 arrangement pot$/) do
  @output_document.covering_letter_type = 'section_32'
end

Given(/^the customer has a fixed term annuity$/) do
  @output_document.covering_letter_type = 'fixed_term_annuity'
end

Given(/^the customer has an adjustable income$/) do
  @output_document.covering_letter_type = 'adjustable_income'
end

Given(/^the customer has inherited their pension pot$/) do
  @output_document.covering_letter_type = 'inherited_pot'
end

Given(/^the customer has not customised their covering letter$/) do
  @output_document.covering_letter_type = ''
end

Then(/^the covering letter should have the Section 32 content$/) do
  expect(@rendered_template).to have_content('Ask your pension provider if you have a Section 32 arrangement')
end

Then(/^the covering letter should have the fixed term annuity content$/) do
  expect(@rendered_template).to have_content('Contact your fixed-term annuity provider')
end

Then(/^the covering letter should have the adjustable income content$/) do
  expect(@rendered_template).to have_content('Check if you’re receiving income from a drawdown arrangement')
end

Then(/^the covering letter should have the inherited pot content$/) do
  expect(@rendered_template).to have_content('Inherited pension pots might have different options')
end

Then(/^the covering letter should not have Section 32, adjustable income, fixed term annuity or inherited pot content$/) do
  expect(@rendered_template).to_not have_content('Ask your pension provider if you have a Section 32 arrangement')
  expect(@rendered_template).to_not have_content('Contact your fixed-term annuity provider')
  expect(@rendered_template).to_not have_content('Check if you’re receiving income from a drawdown arrangement')
  expect(@rendered_template).to_not have_content('Inherited pension pots might have different options')
end
