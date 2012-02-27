class CssSnippets::Renderer::Base < Struct.new(:helper)

  attr_accessor :options

  def to_html options = {}, &block
    self.options = options
    helper.capture { instance_exec(self, &block) }
    render
  end

  def self.template name = :main, &proc
    @templates ||= {}
    @templates[name] = proc
  end

  def self.templates
    @templates
  end

  private

    def render
      render_template :main
    end

    def render_template name, *args
      instance_exec(*args, &self.class.templates[name])
    end

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