RSpec.describe SectionSelectors::Base do
  SUPPLEMENTARY_SECTIONS = %i[supplementary_benefits
                              supplementary_debt
                              supplementary_ill_health
                              supplementary_defined_benefit_pensions
                              supplementary_pension_transfers].freeze

  describe '#call' do
    let(:output_document) { double('Output Document', supplementary_sections) }
    let(:supplementary_sections) { Hash[SUPPLEMENTARY_SECTIONS.zip([false].cycle)] }

    subject { described_class.new.call(output_document) }

    SUPPLEMENTARY_SECTIONS.each do |section|
      context "with applicable section '#{section}'" do
        before { supplementary_sections[section] = true }

        it do
          is_expected.to eq(%I[header
                               covering_letter
                               getting_started
                               options_overview
                               generic_guidance
                               inheritance_tax
                               scams
                               pension_tax_rules
                               #{section}
                               feedback
                               further_guidance
                               footer])
        end
      end
    end

    context 'with multiple supplementary sections' do
      let(:applicable_supplementary_sections) { SUPPLEMENTARY_SECTIONS.sample(3) }

      before do
        applicable_supplementary_sections.each do |section|
          supplementary_sections[section] = true
        end
      end

      it { is_expected.to include(*applicable_supplementary_sections) }
    end
  end
end
