get '/questions/:question_id/vote' do
  question = Question.find(params[:question_id])
  vote = question.votes.build(value: "up")

  if vote.save
    current_user.votes << vote
    points = vote.net_votes(params[:question_id])
    if request.xhr?
      content_type :json
      { points: points}.to_json
    else
      error = "you done fucked up"
    end
  else
    redirect '/questions/:question_id/answers'
  end
end

get '/questions/:question_id/downvote' do
  question = Question.find(params[:question_id])
  vote = question.votes.build(value: "down")

  if vote.save
    current_user.votes << vote
    points = vote.net_votes(params[:question_id])

    if request.xhr?
      content_type :json
      { points: points}.to_json
    else
      error = "you done fucked up"
    end
  else
    redirect '/questions/:question_id/answers'
  end
end
