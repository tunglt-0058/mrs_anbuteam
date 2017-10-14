document.addEventListener('turbolinks:load', function() {

  $('.top-5').on('click', function() {
    $(this).addClass("active");
    $('.recent').removeClass("active");
    $('.top-5-list').show();
    $('.recent-list').hide();
  });

  $('.recent').on('click', function() {
    $(this).addClass(" active");
    $('.top-5').removeClass("active");
    $('.top-5-list').hide();
    $('.recent-list').show();
  });
});
