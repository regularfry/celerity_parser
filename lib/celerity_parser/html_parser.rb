require 'celerity_parser/html_node'

require 'celerity'

module CelerityParser
  class HtmlParser# {{{
    def self.get_window(title)
      client = Java.com.gargoylesoftware.htmlunit.WebClient.new()
      return Java.com.gargoylesoftware.htmlunit.TopLevelWindow.new(title, client)
    end

    def self.get_wrapped_content(content, href=nil)
      url = java.net.URL.new(href || "http://example.com")
      return Java.com.gargoylesoftware.htmlunit.StringWebResponse.new(content, url)
    end

    def self.parse(content, href=nil)
      raise ArgumentError.new("Nil content!") if !content
      window = self.get_window("window")
      wrapped_content = self.get_wrapped_content(content, href)
      return HtmlNode.wrap(Java.com.gargoylesoftware.htmlunit.html.HTMLParser.parse(wrapped_content, window))
    end
  end# }}}
end
