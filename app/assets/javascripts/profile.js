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
      success: function(result) {
        $('#avatar').prop('src', result.thumb.url);
      }
    });
  });
  $('.filter').click(function() {
    $('.filter').parent().find('.active').removeClass('active');
    $(this).addClass('active');
  });
});
