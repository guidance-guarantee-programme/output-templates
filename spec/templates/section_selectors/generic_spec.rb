RSpec.describe SectionSelectors::Generic do
  describe '#call' do
    let(:income_in_retirement) { 'pension' }
    let(:output_document) { double('Output Document', income_in_retirement: income_in_retirement) }

    subject { described_class.new.call(output_document) }

    it do
      is_expected.to eq(%I(
        header
        introduction
        pension_pot_#{income_in_retirement}
        options_overview
        generic_guidance
        other_information
        footer
      ))
    end
  end
end
