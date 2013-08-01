// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var taskrat = {
  liketask: function(id) {
    $.ajax({
        url: '/likes?task_id=' + id,
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
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
  },

  deletetask: function(id) {
     if (confirm('Delete task?'))
     {
        $.ajax({
            type: "DELETE",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            url: '/tasks/' + id,
            dataType: 'json',
            success: function(xhr, textStatus) {
              $('#task_'+id).hide();
            },
            error: function(xhr, textStatus, errorThrown) {
               alert('Opps! Something went wrong');
            }

        });
     }
  }
};