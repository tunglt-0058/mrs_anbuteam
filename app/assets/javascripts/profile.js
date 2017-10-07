$(document).ready(function () {
  $('.upload-avatar').change(function() {
    var $form = $(this).closest('form');
    var form_data = new FormData($form[0]);
    var url = $form.prop('action');

    $.ajax({
      url: url,
      type: 'PATCH',
      beforeSend: function(request) {
        request.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').prop('content'));
      },
      dataType: 'JSON',
      data: form_data,
      processData: false,
      contentType: false,
      complete: function(result) {
        $('#avatar').prop('src', result.responseJSON.thumb.url);
      }
    });
  });
  $('.filter').click(function() {
    $('.filter').parent().find('.active').removeClass('active');
    $(this).addClass('active');
  });
});

$('.portfolio .filter').on('click', function() {
  $('.info-part, .fav-movie-part').css('transform','scale(0)').css('height','0');
  $($(this).attr('data-trigger')).css('transform','scale(1)').css('height','auto');
});
