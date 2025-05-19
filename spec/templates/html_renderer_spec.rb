require 'pathname'
require 'securerandom'

RSpec.describe HTMLRenderer do
  describe '#call' do
    let(:data) { double('Data', welsh?: false, test_field: SecureRandom.uuid).as_null_object }
    let(:sections) { %i[section_one section_two section_three] }
    let(:rendered_sections) { "onetwo#{data.test_field}three" } # whitespace stripped, we don't care about it
    let(:asset_root) { Pathname.new(__FILE__).join('..', '..', 'fixtures', 'assets') }
    let(:renderer) { described_class.new(asset_root: asset_root) }

    subject { renderer.call(data, sections).to_s.remove_all_whitespace } # strip out white space

    it { is_expected.to eq(rendered_sections) }
  end
end
