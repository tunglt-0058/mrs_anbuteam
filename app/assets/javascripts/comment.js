$(document).on('click', '.comment-edit-btn', function() {
  $('#review-comment-' + $(this).context.id).hide();
  $('#review-comment-edit-form-' + $(this).context.id).show();
  $('#comment-form-content-' + $(this).context.id).focus();
});

$(document).on('click', '.comment-edit-btn-cancel', function() {
  $('#review-comment-' + $(this).context.id).show();
  $('#review-comment-edit-form-' + $(this).context.id).hide();
});
