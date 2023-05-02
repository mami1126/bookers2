module ApplicationHelper
  def icon_with_text(icon_style, icon_name, text)
    tag.span(icon(icon_style, icon_name), class: "mr-2") + tag.span(text)
  end
end
