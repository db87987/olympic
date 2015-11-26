$(document).ready(function() {
  $('.checkbox.category').on('change',function(){
    $("#events_categories_filter_form").submit();
  });

  $('.checkbox.subject').on('change',function(){
    $("#events_subjects_filter_form").submit();
  });

  $('#event_filter_form_reset').on('click',function(event){
    event.preventDefault();
    window.location.href = window.location.href.split('?')[0];
  });
});