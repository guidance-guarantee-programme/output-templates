module Output
  module Templates
    module SectionSelectors
      class Ineligible
        def call(*)
          %i[header ineligible further_guidance footer]
        end
      end
    end
  end
end
