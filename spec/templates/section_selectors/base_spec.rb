RSpec.describe SectionSelectors::Base do
  describe '#call' do
    subject { described_class.new.call }

    it do
      is_expected.to eq(%I(
        header
        covering_letter
        introduction
        options_overview
        generic_guidance
        other_information
        footer
      ))
    end
  end
end
