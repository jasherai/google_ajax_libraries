module GoogleAjaxLibraries

  module Helper

    def google_javascript_include_tag(ajax_libraries)
      html = "<script src=\"http://www.google.com/jsapi\"></script>\n"
      html << "<script>\n"
      ajax_libraries.each do |k, v|
        html << "  google.load(\"#{k}\", \"#{v[:version] || 1 }\", {uncompressed:#{v[:uncompressed] || false }});\n"
      end
      html << "</script>"
      return html
    end

  end

end

ActionView::Base.send(:include, GoogleAjaxLibraries::Helper)