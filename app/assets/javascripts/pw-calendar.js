
class Calendar {
    selectedDate = '';

    constructor() {

    }

    initNewMeetingListeners() {
        const self = this;

        // Listen all calendar buttons
        $('.table .pw-btn--calendar').on('click', function (e) {
            self.selectedDate = $('#' + $(this).attr('for')).val();
            $('#pw-calendar-selected-date').html(self.selectedDate);
            $('.pw-calendar-times').show();
        })

        // Listen all time list changes
        $('input[name="meeting[selected_time]"]').on('change', function (e) {
            const selectedTimes = $(this).val().split('-');
            const finalStartTime = self.selectedDate + ' ' + selectedTimes[0];
            const finalEndTime = self.selectedDate + ' ' + selectedTimes[1];

            // Set start_date
            $('#meeting_start_time').val(finalStartTime);
            $('#meeting_end_time').val(finalEndTime);
        })
    }
}

// Init
$(function () {
    var calendar = new Calendar();
    calendar.initNewMeetingListeners();
});