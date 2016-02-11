require 'action_view'
require 'pathname'
require 'securerandom'

RSpec.describe HTMLRenderingContext do
  let(:data) { double('Delegatee').as_null_object }
  subject(:context) { described_class.new(data) }

  it { is_expected.to be_a(ActionView::Helpers::TextHelper) }

  describe 'delegation' do
    let(:bar) { SecureRandom.uuid }
    let(:buzz) { SecureRandom.uuid }
    let(:data) { double('Delegatee', foo: bar, fizz: buzz) }

    specify { expect(context.foo).to eq(bar) }
    specify { expect(context.fizz).to eq(buzz) }
  end

  describe '#stylesheet' do
    let(:asset_root) { Pathname.new(__FILE__).join('..', '..', 'fixtures', 'assets') }
    let(:css) { '<style> .foo .bar { font-weight: bold; }</style>'.remove_all_whitespace }
    let(:context) { described_class.new(data, asset_root: asset_root) }

    subject { context.stylesheet('stylesheet_one').remove_all_whitespace }

    it { is_expected.to eq(css) }
  end

  describe '#keywords' do
    subject { context.keywords }

    context 'when the data includes a format preference of large_text' do
      let(:data) { double('Delegatee', format_preference: 'large_text') }

      it { is_expected.to include('large text') }
      it { is_expected.to_not include('standard') }
    end

    context 'when the data includes a format preference of standard' do
      let(:data) { double('Delegatee', format_preference: 'standard') }

      it { is_expected.to include('standard') }
      it { is_expected.to_not include('large text') }
    end
  end

  describe '#kind' do
    subject { context.kind }

    context 'when the data includes a format preference of large_text' do
      let(:data) { double('Delegatee', format_preference: 'large_text') }

      it { is_expected.to eq('output-document--large') }
    end

    context 'when the data includes a format preference of standard' do
      let(:data) { double('Delegatee', format_preference: 'standard') }

      it { is_expected.to eq('output-document--standard') }
    end
  end

  describe '#theme' do
    subject { context.theme }

    context 'when the data includes a format preference of large_text' do
      let(:data) { double('Delegatee', format_preference: 'large_text') }

      it { is_expected.to eq('theme--large') }
    end

    context 'when the data includes a format preference of standard' do
      let(:data) { double('Delegatee', format_preference: 'standard') }

      it { is_expected.to eq('theme--standard') }
    end
  end
end
