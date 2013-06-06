$(document).ready(function() {

  var dynamic_resource_field = '\
  <div class="field" id="other">\
    <input id="resource_column_name" name="resource[dynamic_field][][name]" size="5" />\
    <input id="resource_column_value" name="resource[dynamic_field][][value]" size="19" />\
    <a href="#" class="add_field">Add</a>\
    <a href="#" class="remove_field">Remove</a>\
  </div>\
  ';
  
  $("body").on("click", ".add_field", function(){
    $('.field').last().after(dynamic_resource_field);
  });
  
  $("body").on("click", ".remove_field", function(){
    $(this).parent().remove();
  });

});
