module Output
  module Templates
    module SectionSelectors
      class Base
        SUPPLEMENTARY_SECTIONS = %i(supplementary_benefits
                                    supplementary_debt
                                    supplementary_ill_health
                                    supplementary_defined_benefit_pensions)

        def call(output_document)
          [
            :header,
            :covering_letter,
            :getting_started,
            :options_overview,
            :generic_guidance,
            :inheritance_tax,
            :scams,
            :further_guidance,
            supplementary_sections(output_document),
            :footer
          ].flatten
        end

        private

        def supplementary_sections(output_document)
          SUPPLEMENTARY_SECTIONS.select { |c| output_document.public_send(c) }
        end
      end
    end
  end
end
