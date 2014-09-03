module TicketsHelper
  def state_for(comment)
    content_tag(:div, :class => "states") do
      if comment.state
        previous_state = comment.previous_state
        if previous_state && comment.state != previous_state
          # may need to check if the generated string is really html safe
          "#{render previous_state} &rarr; #{render comment.state}".html_safe
        else
          render(comment.state)
        end
      end
    end
  end
end
