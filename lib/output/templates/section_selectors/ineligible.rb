module Output
  module Templates
    module SectionSelectors
      class Ineligible
        def call(*)
          [:header, :ineligible, :further_guidance, :ineligible_footer]
        end
      end
    end
  end
end
