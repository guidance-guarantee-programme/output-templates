RSpec.describe 'Public API' do
  describe Output::Templates do
    describe '.template' do
      let(:template_name) { 'my-template' }
      let(:section_selector) { double('Section Selector').as_null_object }
      let(:template) { instance_double(Output::Templates::Template) }

      subject { described_class.template(template_name) }

      before do
        allow(Output::Templates::SectionSelector).to \
          receive(:for).with(template_name).and_return(section_selector)

        allow(Output::Templates::Template).to \
          receive(:new).with(section_selector: section_selector).and_return(template)
      end

      it { is_expected.to eq(template) }
    end
  end
end
