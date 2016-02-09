require 'nokogiri'
require 'rspec/expectations'

RSpec::Matchers.define :have_keyword do |keyword|
  match do |html|
    doc = Nokogiri::HTML(html)
    doc.xpath('//meta[@name="keywords"]/@content').map(&:value).include?(keyword)
  end
end
