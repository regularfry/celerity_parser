module CelerityParser

  class HtmlNode# {{{
    
    # This extra entry point will allow me to insert different Node
    # classes in the future if necessary.
    def self.wrap(java_node)
      new(java_node) 
    end

    # Not called by user code.
    def initialize(java_node)
      @java_node = java_node
    end

    # Perform an xpath search from this node and return an array
    # of HtmlNodes representing the results.
    def search(xpath)
      wrap_java_nodes(@java_node.get_by_xpath(xpath))
    end

    def []=(attr, value)
      @java_node.setAttribute(attr, value)
    end

    # The innerText of the node.
    def text
      @java_node.as_text
    end

    # HtmlNodes represent both tags and attributes, but attributes
    # have value rather than text.
    def value
      @java_node.value
    end

    # The XHTML representation of this node.
    def html
      @java_node.as_xml
    end

    def wrap_java_nodes(java_results)
      java_results.map do |java_node|
        HtmlNode.wrap(java_node)
      end
    end
    private :wrap_java_nodes

  end # }}}

end
