RSpec.describe SectionSelectors::Generic do
  describe '#call' do
    subject { described_class.new.call }

    it do
      is_expected.to eq(%i(
        header
        covering_letter
        introduction
        pension_pot_other
        options_overview
        generic_guidance
        other_information
        footer
      ))
    end
  end
end
