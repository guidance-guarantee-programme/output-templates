When(/^we generate a tailored record of guidance$/) do
  @rendered_template = Output::Templates.template(:tailored).render(@output_document)
end

When(/^we generate a generic record of guidance$/) do
  @rendered_template = Output::Templates.template(:generic).render(@output_document)
end
