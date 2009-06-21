require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))
require 'celerity_parser/html_node'

class TestHtmlNode < Test::Unit::TestCase
  include CelerityParser

  def setup
    @java_node = stub("(java_node)")
    @node = HtmlNode.new(@java_node)
  end
    
  def test_search
    xpath = "//example/xpath"
    @java_node.expects(:get_by_xpath).with(xpath).returns([])

    @node.search(xpath)
  end

  def test_wrap
    HtmlNode.any_instance.expects(:initialize).with(@java_node)
    HtmlNode.wrap(@java_node)
  end

  def test_text
    @java_node.expects(:as_text).returns("")
    @node.text
  end

  def test_value
    @java_node.expects(:value).returns(nil)
    @node.value
  end

  def test_html
    @java_node.expects(:as_xml).returns("")
    @node.html
  end

end
