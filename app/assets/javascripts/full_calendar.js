select: function(start, end, allDay) {

    var title = prompt('Event Title:');
    if (title) {
        calendar.fullCalendar('renderEvent',
            {
              header: {
              right: 'prev,next today',
              center: 'title',
              left: 'month, agendaWeek, agendaDay'
                          },
               selectable: true,
               selectHelper: true,
               editable: true,
               eventLimit: true,
               events: '/events.json',


                title: title,
                description: description
                start_date: start_date,
                end_date: end_date,
                // allDay: allDay
            },
            true // make the event "stick"
        );
        /**
         * ajax call to store event in DB
         */
        jQuery.post(
            "event/new" // your url
            , { // re-use event's data
                title: title,
                description: description
                start_date: start_date,
                end_date: end_date,
            }
        );
    }
    calendar.fullCalendar('select');
}


















// var initialize_calendar;
// initialize_calendar = function() {
//   $('.calendar').each(function(){
//     var calendar = $(this);
//     calendar.fullCalendar({
//       header: {
//         left: 'prev,next today',
//         center: 'title',
//         right: 'month,agendaWeek,agendaDay'
//       },
//       selectable: true,
//       selectHelper: true,
//       editable: true,
//       eventLimit: true,
//       events: '/events',

//       select: function(start, end, allDay) {
//         $.getScript('/events/new', function() {});

//         calendar.fullCalendar('unselect');
//       },

//       eventDrop: function(event, delta, revertFunc) {
//         event_data = {
//           event: {
//             id: event.id,
//             start: event.start.format(),
//             end: event.end.format()
//           }
//         };
//         $.ajax({
//             url: event.event_path,
//             data: event_data,
//             type: 'PATCH'
//         });
//       },

//       eventClick: function(event, jsEvent, view) {
//         $.getScript(event.edit_event_path, function() {});
//       }
//     });
//   })
// };
// $(document).ready(function(){
//   initialize_calendar();
// });
