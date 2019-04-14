class DayOfWeeksController < ApplicationController
  def create
    @day_of_week = DayOfWeek.new(params[:name])
  end
end
