Given(/^the customer has access to income during retirement from (.*?)$/) do |sources_of_income|
  income_in_retirement = case sources_of_income
                         when 'only their DC pot and state pension' then 'pension'
                         when 'multiple sources'                    then 'other'
                         end

  @output_document = fixture(:output_document, income_in_retirement: income_in_retirement)
end

Given(/^we have captured the customer's details$/) do
  @output_document = fixture(:output_document)
end

Given(/^we have captured appointment details$/) do
  @output_document = fixture(:output_document)
end

Then(/^the sections it includes should be \(in order\):$/) do |table|
  sections = table.raw.flatten

  expect(@rendered_template).to include_output_document_sections(sections)
end

Then(/^it should include supplementary information about "(.*?)"$/) do |topic|
  section = case topic
            when 'Benefits and pension income' then
              'benefits'
            when 'Debt and pensions' then
              'debt'
            when 'Pensions and ill health' then
              'ill health'
            when 'Final salary or career average pensions' then
              'defined benefit pensions'
            end

  expect(@rendered_template).to include_output_document_section(section)
end

Then(/^the summary document should include their details$/) do
  expect(@rendered_template).to have_content(@output_document.attendee_name)
end

Then(/^the summary document should include the details of the appointment$/) do
  expect(@rendered_template).to have_content(@output_document.appointment_date)
  expect(@rendered_template).to have_content(@output_document.guider_first_name)
  expect(@rendered_template).to have_content(@output_document.guider_organisation)
end
