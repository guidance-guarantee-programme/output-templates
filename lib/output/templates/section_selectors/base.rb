module Output
  module Templates
    module SectionSelectors
      class Base
        SUPPLEMENTARY_DOCUMENTS = %i(supplementary_benefits
                                     supplementary_debt
                                     supplementary_ill_health
                                     supplementary_final_salary)

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
            supplementary_documents(output_document),
            :footer
          ].flatten
        end

        private

        def supplementary_documents(output_document)
          SUPPLEMENTARY_DOCUMENTS.select { |c| output_document.public_send(c) }
        end
      end
    end
  end
end
