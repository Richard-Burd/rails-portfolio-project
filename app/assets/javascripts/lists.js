// This is referenced in the layouts: ./app/views/layouts/application.erb

$(function(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
  })
});
