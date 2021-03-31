module Output
  module Templates
    module SectionSelectors
      class GenericNaked
        include Output::Templates::SupplementarySectionable

        def call(output_document)
          [
            :getting_started,
            :options_overview,
            :generic_guidance,
            :inheritance_tax,
            :scams,
            :pension_tax_rules,
            supplementary_sections(output_document),
            :feedback,
            :further_guidance
          ].flatten
        end
      end
    end
  end
end
