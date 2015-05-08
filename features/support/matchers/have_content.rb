require 'nokogiri'
require 'rspec/expectations'

RSpec::Matchers.define :have_content do |content|
  match do |html|
    doc = Nokogiri::HTML(html)
    doc.content.include?(content)
  end
end
