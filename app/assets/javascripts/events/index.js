$(document).on("ready page:load", function() {
  $(".events-index .rc-selector").select2({theme: "bootstrap", language: "zh-TW"});
  $(".events-index select").change( function(e) {
    if ($(".rc-selector").val() == "" || $(".rc-selector").val() == null){
      var id = false;
    } else {
      var id = $(".rc-selector").val();
    }

    $.ajax({
      url: "/get_events_on_condition",
      type: "GET",
      dataType: "script",
      data: {
        rest_cate_id: id,
        month: $("#date_month").val()
      }
    });
  });
});
