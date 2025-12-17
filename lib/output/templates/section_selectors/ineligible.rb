module Output
  module Templates
    module SectionSelectors
      class Ineligible
        def call(*)
          %i[header ineligible]
        end
      end
    end
  end
end
