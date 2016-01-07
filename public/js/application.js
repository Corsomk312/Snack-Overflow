$(document).ready(function () {
  $("#answer_form").on("click",function(event){
    event.preventDefault();
     var link = $(this).children()[0];
     var route = $(link).attr('href')
      $(this).hide()

      var request = $.ajax({
        method: "get",
        url: route
      });

      request.done(function(responseData){
        console.log(responseData)
        $(".answer-container").append(responseData);
      });
  });
});


$(document).ready(function () {
  $('#submit_question_comment').submit(function(event){
    event.preventDefault();
    var params = $(this).serialize();
    var url = $(this).attr('action')
    var request = $.ajax({
      method: "POST",
      url: url,
      data: params
    });
    request.done(function(responseData){
      $("#display_question_comments").append(responseData);
      $('#submit_question_comment')[0].reset();
    });
  });

    $('#submit_answer_comment').submit(function(event){
    event.preventDefault();
    var params = $(this).serialize();
    var url = $(this).attr('action')
    var request = $.ajax({
      method: "POST",
      url: url,
      data: params
    });
    request.done(function(responseData){
      $("#display_answer_comments").append(responseData);
      $('#submit_answer_comment')[0].reset();
    });
  });

});







