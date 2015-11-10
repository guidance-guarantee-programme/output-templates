RSpec.describe SectionSelectors::Tailored do
  describe '#call' do
    let(:income_in_retirement) { 'pension' }
    let(:output_document) { double('Output Document') }

    subject { described_class.new.call(output_document) }
  end
end
