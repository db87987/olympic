class SurveysController < ApplicationController
  def index
    @surverys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end
end