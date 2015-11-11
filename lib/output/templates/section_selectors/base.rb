module Output
  module Templates
    module SectionSelectors
      class Base
        def call
          %I(
            header
            covering_letter
            getting_started
            options_overview
            generic_guidance
            inheritance_tax
            scams
            further_guidance
            footer
          )
        end
      end
    end
  end
end
