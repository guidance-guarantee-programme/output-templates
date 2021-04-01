module Output
  module Templates
    module SectionSelectors
      class Generic
        include Output::Templates::SupplementarySectionable

        def call(output_document)
          [
            :header,
            :getting_started,
            :options_overview,
            :generic_guidance,
            :inheritance_tax,
            :scams,
            :pension_tax_rules,
            supplementary_sections(output_document),
            :further_guidance,
            :footer
          ].flatten
        end
      end
    end
  end
end
