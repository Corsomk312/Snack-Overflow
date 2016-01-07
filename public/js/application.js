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
