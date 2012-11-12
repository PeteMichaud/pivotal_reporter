// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $('.reject-btn').click(function(e){
        var msg = '';
        while (msg == '' || msg == null)
        {
            msg = prompt("Reason for Rejection:");
            if (msg == null)
            {
                alert("You must enter a reason for your rejection.");
            }
        }

        window.location = $(this).data('reject-path') + "?reject_message=" + encodeURI(msg);

        return false;
    });
});
