
class Calendar {
    selectedDate = '';

    constructor() {

    }

    initMeeting() {
        this.initMeetingListeners();
        this.initMeetingEdition();
    }

    initMeetingEdition() {
        const mStartTime = $('#meeting_start_time').val();
        const mEndTime = $('#meeting_end_time').val();

        if(mStartTime) { //If editting
            /*const mStartTimeDate = moment(mStartTime);
            const mEndTimeDate = moment(mEndTime);

            this.selectedDate = mStartTimeDate[0];
            console.log(mStartTimeDate);
            console.log(mEndTimeDate);
            const selectedTime = mStartTimeDate+'-'+mEndTimeDate;
            console.log(selectedTime);*/

            // TEMP - Without moment. This will be necessary later to know which timezone we are now
            const mStartTimeDate = mStartTime.split(' ');
            const mEndTimeDate = mEndTime.split(' ');

            this.selectedDate = mStartTimeDate[0];

            const mStartTimeSplited = mStartTimeDate[1].split(':');
            const mEndTimeSplited = mEndTimeDate[1].split(':');
            const selectedTime = mStartTimeSplited[0]+':'+mStartTimeSplited[1]+'-'+mEndTimeSplited[0]+':'+mEndTimeSplited[1];
            console.log(selectedTime);

            $("input[name=selected_date][value=" + this.selectedDate + "]").prop('checked', true);
            $("input[name='meeting[selected_time]'][value='" + selectedTime + "']").prop('checked', true);

            $('.pw-calendar-times').show();
        }
    }

    initMeetingListeners() {
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
    calendar.initMeeting();
});