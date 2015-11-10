module Output
  module Templates
    module SectionSelectors
      class Base
        def call(output_document)
          %I(
            header
            covering_letter
            getting_started
            options_overview
            inheritance_tax
            scams
            further_guidance
            sup_final_salary
            sup_benefits
            sup_ill_health
            sup_debt
            footer
          )
        end
      end
    end
  end
end
