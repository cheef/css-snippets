module CssSnippets::Renderer

  class JustifiedItems < Base

    template :main do
      <<-HTML
        <div class="#{wrapper_dom_class}">
          <ul class="b-justified-container">
            #{items}
          </ul>
        </div>
      HTML
    end

    template :item do |content|
      <<-HTML
        <li class="b-justified-item">#{content}</li>
      HTML
    end

    def item content_or_options = nil, options = {}, &block
      return_nothing do
        @items ||= []
        @items << element(content_or_options, options, &block)
      end
    end

    private

      def render
        render_template :main
      end

      def items
        @items.map{ |item| render_template(:item, item.first) }.join("\n")
      end

      def wrapper_dom_class
        options[:class] || 'l-default-justified-items'
      end

      def return_nothing
        yield if block_given?
        ''
      end

  end
end