$(function() {
  // Setup drop down menu
  $('.dropdown-toggle').dropdown();

  // Fix input element click problem
  $('.dropdown input, .dropdown label').click(function(e) {
    e.stopPropagation();
  });

  $('#new_workout').on('click', '.add-fields', function(e) {
    e.preventDefault();
    link = this;
    association = $(this).data('association');
    fields = $(this).data('fields');
    add_fields(link, association, fields);
  });

  $('.edit_workout').on('click', '.add-fields', function(e) {
    e.preventDefault();
    link = this;
    association = $(this).data('association');
    fields = $(this).data('fields');
    add_fields(link, association, fields);
  });

  $('#new_workout').on('click', '.remove-fields', function(e) {
    e.preventDefault();
    link = this;
    remove_fields(link);
  });

  $('.edit_workout').on('click', '.remove-fields', function(e) {
    e.preventDefault();
    link = this;
    remove_fields(link);
  });
});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").remove();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}
