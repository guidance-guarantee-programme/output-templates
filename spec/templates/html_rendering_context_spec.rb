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
end
