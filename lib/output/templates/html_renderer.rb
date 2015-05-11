require 'pathname'
require 'output/templates/html_rendering_context'

module Output
  module Templates
    class HTMLRenderer
      DEFAULT_ASSET_ROOT = Pathname.new(__FILE__).join('..', '..', '..', '..', 'assets')

      attr_reader :asset_root

      def initialize(asset_root: DEFAULT_ASSET_ROOT)
        @asset_root = Pathname.new(asset_root)
      end

      def call(data, sections)
        template = Array(sections)
                   .map { |section| template_for(section) }
                   .join("\n\n")

        render(data, template)
      end

      private

      def render(data, template)
        context = HTMLRenderingContext.new(data, asset_root: asset_root)
        ERB.new(template).result(context.binding)
      end

      def template_for(section)
        File.read(asset_root.join('markup', "#{section}.html.erb"))
      end
    end
  end
end
