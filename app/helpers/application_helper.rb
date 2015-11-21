module ApplicationHelper
  def date(date, format)
    if date && format
      Russian::strftime(date, format)
    end
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def survery_options_plural(amount)
    "#{amount} #{Russian.p(amount, "вопрос", "вопроса", "вопросов")}"
  end
end
