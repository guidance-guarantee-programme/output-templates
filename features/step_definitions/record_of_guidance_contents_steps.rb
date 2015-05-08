Given(/^one or more of the predefined circumstances applies to the customer$/) do
  @output_document = fixture(:output_document,
                             continue_working: true,
                             unsure: false,
                             leave_inheritance: true,
                             wants_flexibility: false,
                             wants_security: true,
                             wants_lump_sum: false,
                             poor_health: true)
end

Given(/^we don't know that any of the predefined circumstances apply to the customer$/) do
  @output_document = fixture(:output_document,
                             continue_working: false,
                             unsure: false,
                             leave_inheritance: false,
                             wants_flexibility: false,
                             wants_security: false,
                             wants_lump_sum: false,
                             poor_health: false)
end

Given(/^"(.*?)" applies to the customer$/) do |circumstance|
  applicable_circumstances = {
    continue_working: false,
    unsure: false,
    leave_inheritance: false,
    wants_flexibility: false,
    wants_security: false,
    wants_lump_sum: false,
    poor_health: false
  }

  case circumstance
  when 'Plans to continue working for a while' then applicable_circumstances[:continue_working] = true
  when 'Unsure about plans in retirement'      then applicable_circumstances[:unsure] = true
  when 'Plans to leave money to someone'       then applicable_circumstances[:leave_inheritance] = true
  when 'Wants flexibility when taking money'   then applicable_circumstances[:wants_flexibility] = true
  when 'Wants a guaranteed income'             then applicable_circumstances[:wants_security] = true
  when 'Needs a certain amount of money now'   then applicable_circumstances[:wants_lump_sum] = true
  when 'Has poor health'                       then applicable_circumstances[:poor_health] = true
  end

  @output_document = fixture(:output_document, applicable_circumstances)
end

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

  if (index = sections.index('detail about applicable circumstances'))
    circumstances = []
    circumstances << 'continue working' if @output_document.continue_working
    circumstances << 'unsure' if @output_document.unsure
    circumstances << 'leave inheritance' if @output_document.leave_inheritance
    circumstances << 'wants flexibility' if @output_document.wants_flexibility
    circumstances << 'wants security' if @output_document.wants_security
    circumstances << 'wants lump sum' if @output_document.wants_lump_sum
    circumstances << 'poor health' if @output_document.poor_health

    sections[index] = circumstances
    sections.flatten!
  end

  expect(@rendered_template).to include_output_document_sections(sections)
end

Then(/^it should include information about "(.*?)"$/) do |circumstance|
  section = case circumstance
            when 'Plans to continue working for a while' then 'continue working'
            when 'Unsure about plans in retirement'      then 'unsure'
            when 'Plans to leave money to someone'       then 'leave inheritance'
            when 'Wants flexibility when taking money'   then 'wants flexibility'
            when 'Wants a guaranteed income'             then 'wants security'
            when 'Needs a certain amount of money now'   then 'wants lump sum'
            when 'Has poor health'                       then 'poor health'
            end

  expect(@rendered_template).to include_output_document_section(section)
end

Then(/^the "pension pot" section should be the "(.*?)" version$/) do |version|
  version = case version
            when 'only their DC pot and state pension' then 'pension'
            when 'multiple sources'                    then 'other'
            end

  expect(@rendered_template).to include_output_document_section('pension pot').at_version(version)
end

Then(/^the record of guidance should include their details$/) do
  expect(@rendered_template).to have_content(@output_document.attendee_name)
  expect(@rendered_template).to have_content(@output_document.value_of_pension_pots)
end

Then(/^the record of guidance should include the details of the appointment$/) do
  expect(@rendered_template).to have_content(@output_document.appointment_date)
  expect(@rendered_template).to have_content(@output_document.guider_first_name)
  expect(@rendered_template).to have_content(@output_document.guider_organisation)
end
