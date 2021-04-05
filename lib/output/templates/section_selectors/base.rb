module Output
  module Templates
    module SectionSelectors
      class Base
        include Output::Templates::SupplementarySectionable

        def call(output_document)
          [
            :header,
            :covering_letter,
            :getting_started,
            :options_overview,
            :generic_guidance,
            :inheritance_tax,
            :scams,
            :pension_tax_rules,
            supplementary_sections(output_document),
            :feedback,
            :further_guidance,
            :footer
          ].flatten
        end
      end
    end
  end
end
