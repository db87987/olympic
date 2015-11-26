class EventsController < ApplicationController
  def index
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
    params.slice(:year, :month)
  end
end