RSpec.describe SectionSelectors::Ineligible do
  describe '#call' do
    subject { described_class.new.call }

    it { is_expected.to eq(%i[header ineligible further_guidance footer]) }
  end
end
