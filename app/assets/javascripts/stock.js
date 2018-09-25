jQuery(function() {
  var variants;
  variants = $('#stock_variant_id').html();
  console.log(states);
  return $('#stock_product_id').change(function() {
    var product, options;
    product = $('#stock_product_id :selected').text();
    options = $(variants).filter("optgroup[label=" + product + "]").html();
    console.log(options);
    if (options) {
      return $('#stock_variant_id').html(options);
    } else {
      return $('#stock_variant_id').empty();
    }
  });
});
