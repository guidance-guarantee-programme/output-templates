RSpec.describe SectionSelectors::DueDiligence do
  describe '#call' do
    subject { described_class.new.call }

    it { is_expected.to match_array(%i[due_diligence_contents]) }
  end
end
