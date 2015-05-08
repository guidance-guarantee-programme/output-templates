require 'output/templates/version'
require 'output/templates/section_selector'
require 'output/templates/template'

module Output
  module Templates
    def self.template(id)
      Template.new(section_selector: SectionSelector.for(id))
    end
  end
end
