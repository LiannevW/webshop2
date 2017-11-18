function removeProduct(product_id) {
  var removedProduct = { product_id: product_id};

  $.ajax({
    type: "DELETE",
    url: "/shopping_cart/" + product_id + ".json",
    data: JSON.stringify({
      product: removedProduct
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);
    var notice_me = $('<div class="panel panel-primary"></div>')
      .html("Product removed via ajax");
    $("#yield-container").prepend(notice_me);
    $("#product-row").remove();
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

function stageToRemoveProduct(event) {
  event.preventDefault();
  //  resetErrors();
  // ($("#song_name").val());
  removeProduct(Number($("#product-id").html()));
}


$(document).ready(function() {
  $("#remove-product").on('click', stageToRemoveProduct);

});
