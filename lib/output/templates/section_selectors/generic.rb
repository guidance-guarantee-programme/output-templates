module Output
  module Templates
    module SectionSelectors
      class Generic
        def call(*)
          %i(header covering_letter footer)
        end
      end
    end
  end
end
