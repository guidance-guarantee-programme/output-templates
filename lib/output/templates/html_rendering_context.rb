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

      def large_text?
        format_preference == 'large_text'
      end

      def keywords
        [format]
      end

      def kind
        large_text? ? 'output-document--large' : 'output-document--standard'
      end

      def theme
        large_text? ? 'theme--large' : 'theme--standard'
      end

      private

      def format
        format_preference.tr('_', ' ')
      end

      def stylesheet_path(base_file_name)
        Pathname.new(asset_root).join('stylesheets', "#{base_file_name}.css.scss")
      end
    end
  end
end
