// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var taskrat = {
  liketask: function(id) {
    $.ajax({
        url: '/likes?task_id=' + id,
        dataType: 'json',
        success: function(xhr, textStatus) {
          var like = xhr['like'];
          $('#task_link_'+id + ' span').attr('class', 'line-heart-pictos iconic-blue-heart_fill_16x14');
          $('#task_link_'+id).next('.likecounter').text(like.like_count);
        },
        error: function(xhr, textStatus, errorThrown) {
           alert('Opps! Something went wrong');
        }

    });
  }
};


//$('form').submit(function() {
//    var valuesToSubmit = $(this).serialize();
//    $.ajax({
//        url: $(this).attr('action'), //sumbits it to the given url of the form
//        data: valuesToSubmit,
//        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//    }).success(function(json){
//        //act on result.
//    });
//    return false; // prevents normal behaviour
//});
//
