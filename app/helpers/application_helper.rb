module ApplicationHelper
  def date(date, format)
    Russian::strftime(date, format)
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
end
