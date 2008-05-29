module GoogleAjaxLibraries

  module Helper

    def google_javascript_include_tag(*ajax_libraries)
      html = "<script src=\"http://www.google.com/jsapi\"></script>\n"
      html << "<script>\n"
      ajax_libraries.each do |al|
        begin
          html << "  google.load(\"#{al[0]}\", \"#{al[1] || 1 }\", {uncompressed:#{al[2] || false }});\n"
        rescue
          html << "  google.load(\"#{al}\", \"1\");\n"
        end
      end
      html << "</script>"
      return html
    end

  end

end

ActionView::Base.send(:include, GoogleAjaxLibraries::Helper)