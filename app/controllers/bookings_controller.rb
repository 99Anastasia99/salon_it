class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

 def index
   @bookings = Booking.where(start: params[:start_time]..params[:end_time])
 end

 def show
 end

 def new
   @booking = Booking.new
 end

 def edit
 end

 def create
   @booking = Booking.new(booking_params)
   @booking.save
 end

 def update
   @booking.update(booking_params)
 end

 def destroy
   @booking.destroy
 end

 private
   def set_booking
     @booking = Booking.find(params[:id])
   end

   def booking_params
     params.require(:booking).permit(:title, :date_range, :start, :end, :color)
   end
end