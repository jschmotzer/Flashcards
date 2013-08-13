

$(document).ready(function() { 
  $("#flashcard").on("submit", 'form', function(event){
      event.preventDefault(); 
      var url = $(this).attr('action'); 
      var data = $(this).serialize(); 
      $.post(url, data, function(response){
        console.log(response);
        var answer = "<div>Your Guess: "+response.guess+"</div>"
        var answer_correct = "<div>Correct Answer: "+response.answer+"</div>"
        var url = "<div><a href='"+response.link+"'>Next Card</a></div>";
        console.log(url)
        $("#card").addClass("flipped");
        $("#card .back").append(answer).append(answer_correct).append(url);
        $("form").remove();
      });
  });
});


