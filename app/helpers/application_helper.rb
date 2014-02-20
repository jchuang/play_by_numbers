module ApplicationHelper

  def column_sort(column_title, method_name)
    link_to column_title, sort: method_name
  end

end
