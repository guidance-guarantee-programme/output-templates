require 'output/templates/html_renderer'

module Output
  module Templates
    class Template
      attr_reader :section_selector, :renderer, :template_id

      def initialize(section_selector:, template_id:, renderer: HTMLRenderer.new)
        @renderer = renderer
        @section_selector = section_selector
        @template_id = template_id
      end

      def render(output_document)
        pages = section_selector.call(output_document)
        renderer.call(output_document, pages, template_id)
      end

      :section_selector
    end
  end
end
