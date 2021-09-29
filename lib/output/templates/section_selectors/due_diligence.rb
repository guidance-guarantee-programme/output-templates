module Output
  module Templates
    module SectionSelectors
      class DueDiligence
        def call(*)
          %i(due_diligence_contents)
        end
      end
    end
  end
end
