RSpec.describe SectionSelectors::Base do
  describe '#call' do
    subject { described_class.new.call }

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
        footer
      ))
    end
  end
end
