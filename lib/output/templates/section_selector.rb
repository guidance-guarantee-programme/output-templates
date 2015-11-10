require 'output/templates/section_selectors/base'
require 'output/templates/section_selectors/ineligible'

module Output
  module Templates
    class SectionSelector
      def self.for(id)
        class_name = id.to_s.split('_').map(&:capitalize).join
        SectionSelectors.const_get(class_name).new
      end
    end
  end
end
