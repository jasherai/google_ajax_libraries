module GoogleAjaxLibraries

  module Helper

    def google_javascript_include_tag(ajax_library, options = { :version => 1 })
      options[:uncompressed] ||= "false"
      html = ""
      html << <<-HTML
        <script src="http://www.google.com/jsapi"></script>
        <script>
          google.load("#{ajax_library}", "#{options[:version]}", {uncompressed:#{options[:uncompressed]}});
        </script>
      HTML
      return html
    end

  end

end