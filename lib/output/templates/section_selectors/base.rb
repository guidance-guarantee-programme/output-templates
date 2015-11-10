module Output
  module Templates
    module SectionSelectors
      class Base
        def call(output_document)
          %I(
            header
            covering_letter
            introduction
            pension_pot_#{output_document.income_in_retirement}
            options_overview
            generic_guidance
            other_information
            footer
          )
        end
      end
    end
  end
end
