RSpec.describe SectionSelectors::Tailored do
  CIRCUMSTANCES = %i(continue_working
                     unsure
                     leave_inheritance
                     wants_flexibility
                     wants_security
                     wants_lump_sum
                     poor_health)

  describe '#call' do
    let(:circumstances) { Hash[CIRCUMSTANCES.map { |c| [c, false] }] }
    let(:income_in_retirement) { 'pension' }
    let(:output_document) { double('Output Document', circumstances.merge(income_in_retirement: income_in_retirement)) }

    subject { described_class.new.call(output_document) }

    CIRCUMSTANCES.each do |circumstance|
      context "with applicable circumstance '#{circumstance}'" do
        before { circumstances[circumstance] = true }

        it do
          is_expected.to eq(%I(
            header
            covering_letter
            introduction
            pension_pot_#{income_in_retirement}
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
        applicable_circumstances.each { |circumstance| circumstances[circumstance] = true }
      end

      it { is_expected.to include(*applicable_circumstances) }
    end
  end
end
