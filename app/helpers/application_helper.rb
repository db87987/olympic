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

  def years_list
    %w(2013 2014 2015 2016)
  end

  def month_list
    %w(Январь Ферваль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь)
  end

  def calendar_content_class(date)
    if date.month >= Time.now.month
      "calendar_content today"
    else
      "calendar_content"
    end
  end

  def calendar_day_class(date)
  end
end
