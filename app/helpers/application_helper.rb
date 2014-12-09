module ApplicationHelper
  def active_page(path)
    "active_page" if current_page?(path)
  end
end
