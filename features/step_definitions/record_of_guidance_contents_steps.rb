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

Then(/^the sections it includes should be \(in order\):$/) do |table|
  sections = table.raw.flatten

  if (index = sections.index('detail about applicable circumstances'))
    circumstances = []
    circumstances << 'continue working' if @appointment_summary.continue_working?
    circumstances << 'unsure' if @appointment_summary.unsure?
    circumstances << 'leave inheritance' if @appointment_summary.leave_inheritance?
    circumstances << 'wants flexibility' if @appointment_summary.wants_flexibility?
    circumstances << 'wants security' if @appointment_summary.wants_security?
    circumstances << 'wants lump sum' if @appointment_summary.wants_lump_sum?
    circumstances << 'poor health' if @appointment_summary.poor_health?

    sections[index] = circumstances
    sections.flatten!
  end

  expect(@rendered_template).to include_output_document_sections(sections)
end
