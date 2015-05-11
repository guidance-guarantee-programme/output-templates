require 'output/templates/html_renderer'

module Output
  module Templates
    class Template
      attr_reader :section_selector, :renderer
      protected :section_selector, :renderer

      def initialize(section_selector:, renderer: HTMLRenderer.new)
        @renderer = renderer
        @section_selector = section_selector
      end

      def render(output_document)
        pages = section_selector.call(output_document)
        renderer.call(output_document, pages)
      end
    end
  end
end
