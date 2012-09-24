module WinesHelper
  def is_color_selected(color)
    criteria = @search_criteria || params[:search_criteria]
    !criteria.nil? && criteria[:color] == color
  end
end
