module GoogleAjaxLibraries

  module Helper

    def google_javascript_include_tag(ajax_library, options = {})
      <<-HTML
        <script src="http://www.google.com/jsapi"></script>
        <script>
          google.load("#{ajax_library}", "#{options[:version] || 1 }", {uncompressed:#{options[:uncompressed] || false }});
        </script>
      HTML
    end

  end

end

ActionView::Base.send(:include, GoogleAjaxLibraries::Helper)