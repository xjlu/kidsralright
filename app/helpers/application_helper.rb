module ApplicationHelper

  # a trick to use controller name to determine which tab is selected
  def is_active(*links)
    state = links.any? do |link|
      params[:controller] == link
    end
    state ? "active" : nil
  end

  # compare @selected with the tab name
  def active_tab(selected, tab_name)
    (tab_name == selected) ? "active" : nil
  end

  # take advantage of current_page method to highlight the active tab
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : nil

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
