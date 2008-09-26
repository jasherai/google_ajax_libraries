module GoogleAjaxLibraries

  module Helper

    def google_javascript_include_tag(scripts={}, opts={}, *backward_compat)
      key = opts[:key] || nil
      ajax_libraries = *scripts
      html = ""
      
      if debug
       html << "<pre>Options = #{opts.to_json}</pre>\n"
       html << "<pre>key = #{key.to_json}</pre>\n"
       html << "<pre>Lib to load = #{ajax_libraries.to_json}</pre>\n"
      end
      
      html << "<script type=\"text/javascript\" src=\"http://www.google.com/jsapi"
      html << "?key=#{key}" if key
      html << "\"></script>\n"
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
