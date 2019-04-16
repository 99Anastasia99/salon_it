class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

 def index
   @bookings = Booking.where(start_time: params[:start_time]..params[:end_time])
 end

 def show
 end

 def new
   @booking = Booking.new
 end

 def edit
 end

 def create
   @booking = @master.bookings.new(booking_params)
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
     params.require(:booking).permit(:master_id,:offer_id,:client_id,:start_time, :end_time, :color, :master_work_open_time,:master_work_close_time)
   end
end
