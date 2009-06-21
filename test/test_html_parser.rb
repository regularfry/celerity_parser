require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))
require 'celerity_parser/html_parser'

class TestHtmlParser < Test::Unit::TestCase
  include CelerityParser

  def test_nil_content_raises
    assert_raises(ArgumentError) do
      HtmlParser.parse(nil)
    end
  end

  def test_get_window
    assert_not_nil HtmlParser.get_window("foo title")
  end
  
  def test_get_wrapped_content
    content = "<html></html>"
    assert_not_nil HtmlParser.get_wrapped_content(content)
  end

  def test_parse_simple_content
    content = "<html><head></head><body></body></html>"
    assert_not_nil HtmlParser.parse(content)
  end

  ###
  # This is something of an integration test
  def test_parse_to_xpath
    content = <<-HTML
    <html>
      <head>
        <title>HTML Page Title</title>
      </head>
      <body>
        <ul>
          <li>Foo</li>
          <li>Bar</li>
        </ul>
      </body>
    </html>
    HTML

    root_node = HtmlParser.parse(content)
    flunk "Bad root node" if root_node.nil?

    xpath = "//li"

    search_results = root_node.search(xpath)

    assert_equal 2, search_results.length
    assert_equal ["Foo", "Bar"], search_results.map{|r| r.text}
  end

end
