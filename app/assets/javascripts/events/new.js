$(document).on("ready page:load", function() {
  $(".restaurant_select").on("change", function() {
    $.ajax({
      url: "/get_rest_dishes",
      type: "GET",
      dataType: "script",
      data: {
        restaurant_id: $(".restaurant_select option:selected").val()
      }
    });
  });
});
