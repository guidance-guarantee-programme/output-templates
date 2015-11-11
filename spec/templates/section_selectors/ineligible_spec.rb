RSpec.describe SectionSelectors::Ineligible do
  describe '#call' do
    let(:output_document) { double('Output Document') }

    subject { described_class.new.call(output_document) }

    it { is_expected.to eq([:header, :ineligible, :footer]) }
  end
end
