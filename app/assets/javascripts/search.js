var timer, length_str = 27, length_item = 4;
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

      var movies = data.results["movies"];
      if(movies.length) {
        $('.results').append('<p><b>映画</b></p><hr>');
        for (var i = 0; i < movies.length; i++) {
          $('.results').append('<a href="/movies/' + movies[i].id
            +'"><li><span class="movies-search-img"><img src="'
            + movies[i].poster + '"></span><span class="movies-search-str">'
            + movies[i].name.substring(0, length_str) + '</span></li></a><hr>');
          if(i == length_item) break;
        }
      }

      var actors = data.results["actors"];
      if(actors.length) {
        $('.results').append('<p><b>俳優</b></p><hr>');
        for (var i = 0; i < actors.length; i++) {
          $('.results').append('<a href="/actors/' + actors[i].id
            +'"><li><span class="movies-search-img"><img src="'
            + actors[i].avatar + '"></span><span class="movies-search-str">'
            + actors[i].name.substring(0, length_str) + '</span></li></a><hr>');
          if(i == length_item) break;
        }
      }

      $('.results').append('<a href="/searches?search=' + search);
    });
  }, 1000);
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
