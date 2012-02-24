class CssSnippets::Renderer::Base < Struct.new(:helper)

  attr_accessor :options

  def to_html options = {}, &block
    helper.capture { instance_exec(self, &block) }
    render.html_safe
  end

  private

    def render; end

    def method_missing method, *args, &block
      helper.send method, *args, &block
    end

    def element content_or_element_options = nil, element_options = {}, &block
      if block_given?
        [ helper.capture(&block), ensure_options(content_or_element_options) ]
      else
        [ content_or_element_options, ensure_options(element_options) ]
      end
    end

    def ensure_options value
      value.is_a?(Hash) ? value : {}
    end

end