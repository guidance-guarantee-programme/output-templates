When(/^we apply the large theme$/) do
  @output_document = fixture(:output_document, format_preference: 'large_text')
end

Then(/^the summary document should include the large theme$/) do
  expect(@rendered_template).to have_keyword('large text')
end

Then(/^the summary document should not include the large theme$/) do
  expect(@rendered_template).to_not have_keyword('large text')
end
