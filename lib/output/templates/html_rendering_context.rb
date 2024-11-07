require 'action_view'
require 'pathname'
require 'sassc'

module Output
  module Templates
    class HTMLRenderingContext < SimpleDelegator
      include ActionView::Helpers::TextHelper

      attr_reader :asset_root, :template_id

      def initialize(data, asset_root: '', template_id: '')
        super(data)
        @asset_root = Pathname.new(asset_root)
        @template_id = template_id
      end

      def binding
        Kernel.binding
      end

      def stylesheet(base_file_name)
        sass = File.read(stylesheet_path(base_file_name))
        css  = SassC::Engine.new(sass).render

        "<style>\n#{css}\n</style>"
      end

      def large_text?
        format_preference == 'large_text'
      end

      def standard_text?
        !large_text?
      end

      def appointment_50_54?
        type_of_appointment == '50_54'
      end

      def keywords
        [format, appointment_keyword]
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

      def type_of_appointment
        appointment_type
      end

      def appointment_keyword
        "appointment-#{type_of_appointment.tr('_', '-')}"
      end

      def stylesheet_path(base_file_name)
        Pathname.new(asset_root).join('stylesheets', "#{base_file_name}.css.scss")
      end
    end
  end
end
