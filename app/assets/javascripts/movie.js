$("#categories").bind("keyup", function() {
  var q = $("#categories").val();
  if(q) {
    var url = "/searches/category_search"; // live_search action.
    $.get(url, {"q": q}, function(response) { // perform an AJAX get
      // all process are within category_search.js.erb
    });
  } else {
    $("#categories-result").css("display", "none");
  }
});

$("div#category-addNew").bind("click", function() {
  var query = $("#categories").val();
  if(query) {
    console.log($("p#category-selection:contains("+ query +")").length);
    if($("p#category-selection:contains("+ query +")").length == 0) {
      // console.log("click");
      var url = "/categories";
      $.post(url, {"category[name]": query}, function(response) {
      });
    }
  }
});

$("#favorite").bind("click", function() {
  console.log("favorite clicked");
  if($(this).text() == "Favorite") {
    var user_id = $("#user_id").val();
    var movie_id = $("#movie_id").val();
    var url = movie_id+"/favorite_movies";
    var favorite_movie = {"user_id": user_id, "movie_id": movie_id};
    // var data = {favorite_movie["user_id"]: user_id, favorite_movie["movie_id"]: movie_id};
    // console.log(favorite_movie);
    $.post(url, favorite_movie, function(response) {

    });
  }
  if($(this).text() == "Favorited") {
    console.log("favorited clicked");
    // var user_id = $("#user_id").val();
    var movie_id = $("#movie_id").val();
    var favorited_id = $("#favorited_id").val();
    var url = movie_id+"/favorite_movies/"+ favorited_id;
    // var favorite_movie = {"user_id": user_id, "movie_id": movie_id};
    var favorited = {"id": favorited_id}
    // var data = {favorite_movie["user_id"]: user_id, favorite_movie["movie_id"]: movie_id};
    // console.log(favorite_movie);
    // $.post(url, favorite_movie, function(response) {
    // });
    $.ajax({
      url: url,
      type: 'DELETE',
      data: favorited,
      success: function(result) {

      }
    });
  }

});
