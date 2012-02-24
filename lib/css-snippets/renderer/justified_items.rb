module CssSnippets::Renderer

  class JustifiedItems < Base

    ITEM_DOM_CLASS      = 'b-justified-item'
    CONTAINER_DOM_CLASS = 'b-justified-container'
    WRAPPER_DOM_CLASS   = 'l-default-justified-items'

    def item content_or_options = nil, options = {}, &block
      @items ||= []
      @items << render_item(*element(content_or_options, options, &block))
      return_nothing
    end

    private

      def render_item content, dirty_options
        helper.content_tag :li, content, dirty_options.merge(:class => ITEM_DOM_CLASS)
      end

      def render
        helper.content_tag :div, render_list, :class => WRAPPER_DOM_CLASS
      end

      def render_list
        helper.content_tag :ul, @items.join("\n").html_safe, :class => CONTAINER_DOM_CLASS
      end

      def return_nothing
        ''
      end

  end
end