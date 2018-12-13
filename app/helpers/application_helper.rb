module ApplicationHelper

  def full_title(page_title = "")
    base_title = "Vino"
    page_title.empty? ? base_title : page_title + " || " + base_title
  end

  def field_class(resource, field_name)
    # if resource.errors[field_name]
    #   "error".html_safe
    # else
    #   "".html_safe
    # end
  end
end
