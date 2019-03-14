RSpec.describe SectionSelectors::Ineligible do
  describe '#call' do
    subject { described_class.new.call }

    it { is_expected.to eq([:header, :ineligible, :further_guidance, :ineligible_footer]) }
  end
end
