module ApplicationHelper

  def column_sort(column_title, method_name)
    direction = (params[:sort] == method_name && params[:direction] == "desc") ? "asc" : "desc"
    link_to column_title, sort: method_name, direction: direction
  end

end
