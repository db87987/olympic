$(document).ready(function() {
  $('.checkbox').on('change',function(){
    $("#document_filter_form").submit();
  });

  $('#document_filter_form_reset').on('click',function(event){
    event.preventDefault();
    window.location.href = window.location.href.split('?')[0];
  });
});