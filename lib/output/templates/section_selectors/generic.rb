module Output
  module Templates
    module SectionSelectors
      class Generic
        def call(*)
          %i(
            header
            covering_letter
            introduction
            pension_pot_other
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
