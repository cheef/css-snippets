module CssSnippets::Renderer

  class RightMenuLiquidLayout < Base

    template do
      <<-HTML
        <div class="#{wrapper_dom_class}">
          <div class="l-right-column">
            <div class="l-left-column-wrap">
              <div class="l-left-column">
                <div class="b-left-column">#{@left_column_content}</div>
              </div>
              <div class="b-right-column">#{@right_column_content}</div>
            </div>
          </div>
        </div>
      HTML
    end

    def left_column content_or_options = nil, options = {}, &block
      @left_column_content, _  = element(content_or_options, options, &block)
    end

    def right_column content_or_options = nil, options = {}, &block
      @right_column_content, _ = element(content_or_options, options, &block)
    end

    private

      def wrapper_dom_class
        options[:class] || 'l-default-right-menu-liquid-layout'
      end
  end

end