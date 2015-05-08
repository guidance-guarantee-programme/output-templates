require 'action_view'
require 'pathname'
require 'sass'

module Output
  module Templates
    class HTMLRenderingContext < SimpleDelegator
      include ActionView::Helpers::TextHelper

      attr_reader :asset_root
      private :asset_root

      def initialize(data, asset_root: '')
        super(data)
        @asset_root = Pathname.new(asset_root)
      end

      def binding
        Kernel.binding
      end

      def stylesheet(base_file_name)
        sass = File.read(stylesheet_path(base_file_name))
        css = Sass.compile(sass)

        "<style>\n#{css}\n</style>"
      end

      private

      def stylesheet_path(base_file_name)
        Pathname.new(asset_root).join('stylesheets', "#{base_file_name}.css.scss")
      end
    end
  end
end
