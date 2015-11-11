RSpec.describe SectionSelectors::Base do
  SUPPLEMENTARY_DOCUMENTS = %i(supplementary_benefits
                               supplementary_debt
                               supplementary_ill_health
                               supplementary_final_salary)

  describe '#call' do
    let(:documents) { Hash[SUPPLEMENTARY_DOCUMENTS.map { |c| [c, false] }] }
    let(:income_in_retirement) { 'pension' }
    let(:output_document) { double('Output Document', documents.merge(income_in_retirement: income_in_retirement)) }

    subject { described_class.new.call(output_document) }

    SUPPLEMENTARY_DOCUMENTS.each do |document|
      context "with applicable document '#{document}'" do
        before { documents[document] = true }

        it do
          is_expected.to eq(%I(
            header
            covering_letter
            getting_started
            options_overview
            generic_guidance
            inheritance_tax
            scams
            further_guidance
            #{document}
            footer
          ).flatten)
        end
      end
    end

    context 'with multiple supplementary documents' do
      let(:supplementary_documents) { SUPPLEMENTARY_DOCUMENTS.sample(3) }

      before do
        supplementary_documents.each { |document| documents[document] = true }
      end

      it { is_expected.to include(*supplementary_documents) }
    end
  end
end
