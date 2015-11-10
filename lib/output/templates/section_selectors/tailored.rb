module Output
  module Templates
    module SectionSelectors
      class Tailored
        CIRCUMSTANCES = %i(continue_working
                           unsure
                           leave_inheritance
                           wants_flexibility
                           wants_security
                           wants_lump_sum
                           poor_health)

        def call(output_document)
          [
            :header,
            :introduction,
            :"pension_pot_#{output_document.income_in_retirement}",
            :options_overview,
            applicable_circumstances(output_document),
            :other_information,
            :footer
          ].flatten
        end

        private

        def applicable_circumstances(output_document)
          CIRCUMSTANCES.select { |c| output_document.public_send(c) }
        end
      end
    end
  end
end
