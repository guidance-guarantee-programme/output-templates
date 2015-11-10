When(/^we generate a record of guidance$/) do
  @rendered_template = Output::Templates.template(:base).render(@output_document)
end

When(/^we generate an ineligibility letter$/) do
  @rendered_template = Output::Templates.template(:ineligible).render(@output_document)
end
