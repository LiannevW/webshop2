function addProduct(product_id) {
  var addedProduct = { product_id: product_id};

  $.ajax({
    type: "POST",
    url: "/shopping_cart.json",
    data: JSON.stringify({
      product: addedProduct
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);
    var notice_me = $('<div class="panel panel-primary"></div>')
      .html("Product added via ajax");
    $("#yield-container").prepend(notice_me);
  })

  .fail(function(error) {
    console.log(error)
    // error_message = error.responseJSON.title[0];
    // showError(error_message);
  });
}

// function showError(message) {
//   var errorHelpBlock = $('<span class="help-block"></span>')
//     .attr('id', 'error_message')
//     .text(message);
//
//   $("#formgroup-title")
//     .addClass("has-error")
//     .append(errorHelpBlock);
// }

function submitProduct(event) {
  event.preventDefault();
  //  resetErrors();
  // ($("#song_name").val());
  addProduct(Number($("#product-id").html()));
}

// function getSongAttributes() {
//   let date = `${$("#song_release_date_1i").val()}-${$("#song_release_date_2i").val()}-01 00:00:00`
//   return [$("#song_name").val(), date, $("#song_length").val()];
// }

$(document).ready(function() {
  $("#add-product").on('click', submitProduct);
});
