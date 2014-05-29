$(document).ready(function() {

        $(    ).submit(function(event) {
        //   1- intercept the form submission event using jQuery
        event.preventDefault();
        //   2- prevent the default action for that event from happening

        $.ajax({
            type: "POST",
            url: url,
            // data:,
            dataType: "json"
        })//ajax-end
            .done(function(){

            })//done-end
            .fail(function(){
            });//fail-end
          });//event-handler end
    });//document ready end