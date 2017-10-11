document.addEventListener('turbolinks:load', function() {
  var sum = $('.movie-sum-review span').prop('textContent');
  var rateFive = $('.bar-5 span').prop('textContent') / sum * 80;
  var rateFour = $('.bar-4 span').prop('textContent') / sum * 80;
  var rateThree = $('.bar-3 span').prop('textContent') / sum * 80;
  var rateTwo = $('.bar-2 span').prop('textContent') / sum * 80;
  var rateOne = $('.bar-1 span').prop('textContent') / sum * 80;
  $('.bar-5').css('width', rateFive + '%');
  $('.bar-4').css('width', rateFour + '%');
  $('.bar-3').css('width', rateThree + '%');
  $('.bar-2').css('width', rateTwo + '%');
  $('.bar-1').css('width', rateOne + '%');
});
