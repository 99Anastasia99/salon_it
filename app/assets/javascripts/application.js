// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap
//= require react
//= require react_ujs
//= require components
//= require jquery-ui/widgets/datepicker
//= require_tree .
//= require jquery
//= require best_in_place
//= require jquery-ui
//= require jquery-mask-plugin
//= require filterrific/filterrific-jquery
//= require moment
//= require fullcalendar
$.jMaskGlobals.watchDataMask = true;
$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

function checkAll(check_all) {
	var inputs = check_all.form.getElementsByTagName("input");

	for (var i = 0; i < inputs.length; i++) {
		if (inputs[i].type == "checkbox" && inputs[i].name != check_all.name) {
			if(check_all.checked == true) {
				inputs[i].checked = true ;
			} else {
				inputs[i].checked = false ;
			}
		}
	}
}

function eventCalendar() {
  return $('#calendar').fullCalendar({
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
        $('.start_hidden').val(moment(start_time).format('YYYY-MM-DD HH:mm'));
        $('.end_hidden').val(moment(end_time).format('YYYY-MM-DD HH:mm'));
      });

      calendar.fullCalendar('unselect');
    }
   });
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};
$(document).on('turbolinks:load', function(){
  eventCalendar();
});
 $(document).on('turbolinks:before-cache', clearCalendar);
