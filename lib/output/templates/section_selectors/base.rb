module Output
  module Templates
    module SectionSelectors
      class Base
        def call
          %I(
            header
            covering_letter
            introduction
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
