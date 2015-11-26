class EventsController < ApplicationController
  def index
    #categories
    @categories = Category.all
    @category_ids = params[:category_ids] || []

    # case if categories came from subjects form
    if @category_ids.class == String
      @category_ids = @category_ids.split
    end

    #subjects
    if @category_ids.any?
      subject_ids = Event.category_ids(@category_ids).map{|e| e.subjects.pluck(:id) }.flatten.uniq
      @subjects = Subject.where(id: subject_ids)
    else
      @subjects = Subject.all
    end
    @subject_ids = params[:subject_ids] || []

    #events
    @events = Event.order('start_date ASC').published
    filtering_params(params).each do |key, value|
      @events = @events.public_send(key, value) if value.present?
    end
    @events_by_month = @events.group_by { |event| event.start_date.beginning_of_month }
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def filtering_params(params)
    params.slice(:year, :month, :category_ids, :subject_ids)
  end
end