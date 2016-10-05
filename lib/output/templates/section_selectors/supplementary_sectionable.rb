module Output
  module Templates
    module SupplementarySectionable
      SUPPLEMENTARY_SECTIONS = %i(
        supplementary_benefits
        supplementary_debt
        supplementary_ill_health
        supplementary_defined_benefit_pensions
        supplementary_pension_transfers
      ).freeze

      def supplementary_sections(output_document)
        SUPPLEMENTARY_SECTIONS.select { |c| output_document.public_send(c) }
      end
    end
  end
end
