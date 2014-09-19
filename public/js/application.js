$(document).ready(function() {

        $( "#create_org").click(function(event) {
            var url = $("#create_org").attr('href');
        //   1- intercept the form submission event using jQuery
        event.preventDefault();
        //   2- prevent the default action for that event from happening
        console.log("success");
        $("#create_org").html("<h2>Create new Organization</h2><form class='form' action='/organizations/new' method='post'><label>Name:<input type='text' name='organization_name' placeholder='your org's name'><br></label><label>Description:<textarea name='organization_description' id=' cols='30' rows='10' placeholder='your org's info'></textarea><br></label><input id='ajax_create' type='submit' value='Create'></form>'");
    });//create org click
    $( "#ajax_create").submit("#ajax_create", function(event) {
               $.ajax({
            type: "POST",
            url: "/organizations/new",
            data: {},
            dataType: "json"
        })//ajax-end
            .done(function(){
                console.log("success function");
                $("#create_org").append("<p>There was an error</p>")
            })//done-end
            .fail(function(){
                console.log("fail function");
                $("#create_org").append("<p>There was an error</p>")
            });//fail-end
          });//event-handler end
    });//document ready end
// })
// on the ajax_create submit begin an ajax post to the url included
    // the data will be the values of the fields