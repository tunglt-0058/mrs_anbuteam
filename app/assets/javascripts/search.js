var timer, length_str = 100, length_item = 4;
$(document).on('keyup', '#movies-search', function() {
  clearTimeout(timer);
  timer = setTimeout(function () {
    var search = $('#movies-search').val();
    $.ajax({
      url: '/searches?search=' + search,
      context: document.body,
      dataType: 'json'
    }).done(function(data) {
      $('.results').empty();
      $('.results').append('<a href="/searches?search=' + search);
    });
  }, 100);
});

document.addEventListener('turbolinks:load', function() {

  $('.result-movies').on('click', function() {
    $(this).addClass("active");
    $('.result-actors').removeClass("active");
    $('.result-movies-list').show();
    $('.result-actors-list').hide();
  });

  $('.result-actors').on('click', function() {
    $(this).addClass(" active");
    $('.result-movies').removeClass("active");
    $('.result-movies-list').hide();
    $('.result-actors-list').show();
  });

  $(document).on('submit', '.form-search', function(e) {
    if($('.movies-search').val() == '')
      e.preventDefault();
  });
});
