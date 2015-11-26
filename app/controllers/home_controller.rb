class HomeController < ApplicationController
  def index
    @events = Event.order('start_date ASC').published
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key, value) if value.present?
    end
    @local_resources = LocalResource.all
    @documents = Document.limit(4)
    @surveys = Survey.limit(4)
    @articles = Article.limit(4)
    @year = params[:year]

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def filtering_params(params)
    params.slice(:year, :month)
  end
end