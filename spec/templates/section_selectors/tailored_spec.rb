RSpec.describe SectionSelectors::Tailored do
  CIRCUMSTANCES = %i(continue_working
                     unsure
                     leave_inheritance
                     wants_flexibility
                     wants_security
                     wants_lump_sum
                     poor_health)

  describe '#call' do
    let(:attributes) { Hash[CIRCUMSTANCES.map { |c| [c, false] }] }
    let(:output_document) { double('Output Document', attributes) }

    subject { described_class.new.call(output_document) }

    CIRCUMSTANCES.each do |circumstance|
      context "with applicable circumstance '#{circumstance}'" do
        before { attributes[circumstance] = true }

        it do
          is_expected.to eq(%I(
            header
            covering_letter
            introduction
            pension_pot_other
            options_overview
            #{circumstance}
            other_information
            footer
          ).flatten)
        end
      end
    end

    context 'with multiple applicable circumstances' do
      let(:applicable_circumstances) { CIRCUMSTANCES.sample(3) }

      before do
        applicable_circumstances.each { |circumstance| attributes[circumstance] = true }
      end

      it { is_expected.to include(*applicable_circumstances) }
    end
  end
end
