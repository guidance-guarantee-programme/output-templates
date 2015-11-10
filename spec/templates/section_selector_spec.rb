RSpec.describe SectionSelector do
  describe '.for' do
    let(:template_id) { '' }

    subject { described_class.for(template_id) }

    context 'with template "base"' do
      let(:template_id) { :base }

      it { is_expected.to be_a(SectionSelectors::Base) }
    end

    context 'with template "ineligible"' do
      let(:template_id) { :ineligible }

      it { is_expected.to be_a(SectionSelectors::Ineligible) }
    end
  end
end
