json.id booking.id
json.master_id booking.master_id
json.client_id booking.client_id
json.offer_id booking.offer_id
json.start_time booking.start_time
json.end_time booking.end_offer_time

json.color booking.color unless booking.color.blank?

json.update_url booking_path(booking, method: :patch)
json.edit_url edit_booking_path(booking)
