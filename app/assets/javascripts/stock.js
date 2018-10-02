jQuery(function() {
  var variants;
  variants = $('#stock_product_variant_id').html();
  console.log("entra");
  console.log(variants);
  return $('#stock_product_id').change(function() {
    var product, options, escaped_product;
    product = $('#stock_product_id :selected').text();
    escaped_product = product.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(variants).filter("optgroup[label=" + escaped_product + "]").html();
    console.log("entraa 2");
    console.log(options);
    if (options) {
      $('#stock_product_variant_id').html(options);
      return $('#stock_product_variant_id').parent().show();
    } else {
      $('#stock_product_variant_id').empty();
      return $('#stock_product_variant_id').parent().hide();
    }
  });
});

jQuery(function() {
  var variants;
  variants = $('#new_transfer_product_variant_id').html();
  console.log("entra");
  console.log(variants);
  return $('#new_transfer_product_id').change(function() {
    var product, options, escaped_product;
    product = $('#new_transfer_product_id :selected').text();
    escaped_product = product.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(variants).filter("optgroup[label=" + escaped_product + "]").html();
    console.log("entraa 2");
    console.log(options);
    if (options) {
      $('#new_transfer_product_variant_id').html(options);
      return $('#new_transfer_product_variant_id').parent().show();
    } else {
      $('#new_transfer_product_variant_id').empty();
      return $('#new_transfer_product_variant_id').parent().hide();
    }
  });
});
