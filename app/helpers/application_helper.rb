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

end
