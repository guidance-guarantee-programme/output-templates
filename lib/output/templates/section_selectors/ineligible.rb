module Output
  module Templates
    module SectionSelectors
      class Ineligible
        def call(*)
          [:header, :ineligible, :footer]
        end
      end
    end
  end
end
