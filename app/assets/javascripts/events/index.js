$(document).on("ready page:load", function() {
  $(".events-index .rc-selector").select2({theme: "bootstrap"});
  $(".events-index select").change( function(e) {
    if ($(this).val() == "" || $(this).val() == null){
      var id = false;
    } else {
      var id = $(this).val();
    }

    $.ajax({
      url: "/get_events_by_rc",
      type: "GET",
      dataType: "script",
      data: {
        rest_cate_id: id
      }
    });
  });
});
