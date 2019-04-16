json.array! @bookings do |booking|
  date_format = booking.all_day_booking? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id booking.id
  
end
