$(document).on("ready page:load", function() {
  $(".btn-primary").click( function(e) {
    checked = $(".events-new .participants input[type=checkbox]:checked").length;
    if(!checked) {
      $(".require-participant-text").html("*it is required!");
      e.preventDefault();
    }
  });

  $(".restaurant_select").on("change", function() {
    $.ajax({
      url: "/get_rest_dishes",
      type: "GET",
      dataType: "script",
      data: {
        restaurant_id: $(".restaurant_select option:selected").val()
      },
      success: function() {
        atLeastOneChecked();
      }
    });
  });
});

function atLeastOneChecked() {
  $(".btn-primary").click( function(e) {
    checked = $(".events-new .dish-check-box input[type=checkbox]:checked").length;
    if(!checked) {
      $(".require-dish-text").html("*it is required!");
      e.preventDefault();
    }
  });
}
