document.addEventListener('turbolinks:load', function() {
  $(document).on('click', '.genre-actor', function() {
    $.ajax({
      url: '/genres',
      dataType: "script",
      data: {
        genre_type: 'genre_actor'
      }
    });
  });

  $(document).on('click', '.genre-movie', function() {
    $.ajax({
      url: '/genres',
      dataType: "script",
      data: {
        genre_type: 'genre_movie'
      }
    });
  });
});
