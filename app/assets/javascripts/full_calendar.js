var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/bookings.json',

      select: function(start_time, end_time) {
        $.getScript('/bookings/new', function() {
          $('#booking_date_range').val(moment(start_time).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end_time).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start_time).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end_time).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(booking, delta, revertFunc) {
        booking_data = {
          event: {
            id: booking.id,
            start: booking.start_time.format(),
            end: booking.end_time.format()
          }
        };
        $.ajax({
            url: booking.update_url,
            data: booking_data,
            type: 'PATCH'
        });
      },

      eventClick: function(booking, jsEvent, view) {
        $.getScript(booking.edit_url, function() {
          $('#booking_date_range').val(moment(booking.start_time).format("MM/DD/YYYY HH:mm") + ' - ' + moment(booking.end_time).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(booking.start_time).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(booking.end_time).format('YYYY-MM-DD HH:mm'));
        });
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);
