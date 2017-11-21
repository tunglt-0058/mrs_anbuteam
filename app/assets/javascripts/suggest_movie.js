/* global SimpleMDE */

//= require select2/dist/js/select2.min
//= require propellerkit/components/datetimepicker/js/bootstrap-datetimepicker


$(document).on('shown.bs.modal', function () {
    $('.suggest-movie-select').select2({
      tags: true,
      theme: 'bootstrap'
    });
  });

$(document).on('click', '.btn-suggest-movie', function() {
  $('.suggest-movie-modal').modal();
});

$(document).on('click', '.btn-send-suggest-movie', function() {
  var re_id = $('#suggest_receiver').val();
  var con = $('.suggest-movie-content').val();
  var movie_id = $(this).attr('data-movie-id');
  var link = '/movies/'+movie_id+'/suggest_movies';
  $.ajax({
    beforeSend: function(xhr){
      xhr.setRequestHeader('X-CSRF-Token',
        $('meta[name="csrf-token"]').attr('content'));
    },
    type: 'POST',
    url: link,
    data: {
      suggest_movie: {
        receiver_id: re_id,
        content: con
      }
    },
    success: function(e) {
      $('.modal-suggest-result').html(e);
      $('.suggest-movie-select').val('').trigger('change');
      $('.suggest-movie-content').val('');
      $('.suggest-movie-modal').modal('hide');
      $('#suggest-movie-success-modal').modal();
    }
  });
});
