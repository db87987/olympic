class EventsController < ApplicationController
  def index
    @events = Event.order('start_date ASC').published
    @events_by_month = @events.group_by { |event| event.start_date.beginning_of_month }
  end

  def show
    @event = Event.find(params[:id])
  end
end