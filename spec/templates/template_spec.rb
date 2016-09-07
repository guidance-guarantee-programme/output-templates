RSpec.describe Template do
  describe '#render' do
    let(:output_document) { double('Output Document').as_null_object }
    let(:rendered_output) { 'rendered output' }
    let(:pages) { %i(page_one page_two) }
    let(:section_selector) { double('Section Selector') }
    let(:renderer) { instance_double(Output::Templates::HTMLRenderer) }
    let(:template_name) { 'my-template' }
    let(:template) do
      described_class.new(section_selector: section_selector, renderer: renderer, template_id: template_name)
    end

    subject { template.render(output_document) }

    before do
      allow(section_selector).to receive(:call).and_return(pages)
      allow(renderer).to receive(:call).with(output_document, pages, template_name).and_return(rendered_output)
    end

    it { is_expected.to eq(rendered_output) }
  end
end
