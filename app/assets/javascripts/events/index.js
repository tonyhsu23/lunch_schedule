$(document).on("ready page:load", function() {
  $(".events-index .rc-selector").select2({theme: "bootstrap", language: "zh-TW"});
  $(".events-index select").change( function(e) {
    if ($(".rc-selector").val() == "" || $(".rc-selector").val() == null){
      var id = false;
    } else {
      var id = $(".rc-selector").val();
    }

    $.ajax({
      url: "/events",
      type: "GET",
      dataType: "script",
      data: {
        category: id,
        month: $("#date_month").val()
      }
    });
  });
});
