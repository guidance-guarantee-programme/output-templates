RSpec.describe SectionSelectors::Generic do
  describe '#call' do
    subject { described_class.new.call }

    it { is_expected.to eq(%i(header covering_letter footer)) }
  end
end
