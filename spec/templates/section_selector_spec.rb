RSpec.describe SectionSelector do
  describe '.for' do
    let(:template_id) { '' }

    subject { described_class.for(template_id) }

    context 'with template "tailored"' do
      let(:template_id) { :tailored }

      it { is_expected.to be_a(SectionSelectors::Tailored) }
    end

    context 'with template "generic"' do
      let(:template_id) { :generic }

      it { is_expected.to be_a(SectionSelectors::Generic) }
    end
  end
end
