module Output
  module Templates
    module SectionSelectors
      class Tailored
        def call(output_document)
          [
            :header,
            :covering_letter,
            :introduction,
            :"pension_pot_#{output_document.income_in_retirement}",
            :options_overview,
            :other_information,
            :footer
          ].flatten
        end
      end
    end
  end
end
