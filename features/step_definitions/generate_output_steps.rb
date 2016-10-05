Given(/^a customer doesn’t require any supplementary information$/) do
  @output_document = fixture(:output_document,
                             supplementary_benefits: false,
                             supplementary_debt: false,
                             supplementary_ill_health: false,
                             supplementary_defined_benefit_pensions: false)
end

Given(/^the customer requires supplementary information about "([^"]*)"$/) do |topic|
  supplementary_sections = {
    supplementary_benefits: false,
    supplementary_debt: false,
    supplementary_ill_health: false,
    supplementary_defined_benefit_pensions: false,
    supplementary_pension_transfers: false
  }

  supplementary_section = case topic
                          when 'Benefits and pension income' then
                            :supplementary_benefits
                          when 'Debt and pensions' then
                            :supplementary_debt
                          when 'Pensions and ill health' then
                            :supplementary_ill_health
                          when 'Final salary or career average pensions' then
                            :supplementary_defined_benefit_pensions
                          when 'Pension transfers' then
                            :supplementary_pension_transfers
                          end

  supplementary_sections[supplementary_section] = true

  @output_document = fixture(:output_document, supplementary_sections)
end

When(/^we generate a summary document$/) do
  @rendered_template = Output::Templates.template(:base).render(@output_document)
end

When(/^we generate an ineligibility letter$/) do
  @rendered_template = Output::Templates.template(:ineligible).render(@output_document)
end
