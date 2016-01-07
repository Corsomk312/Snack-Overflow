post '/questions/:question_id/comments' do
	@comment = Comment.new(params[:comment])
	if @comment.save
		@question = Question.first 
		redirect "/questions/#{@question.id}/answers"
	else
		@error = "Sorry, server error" # Tell Pamela to display server error in the show answer view 
		erb :'/questions/#{@question.id}/answers' 
	end
end

post '/answers/:answer_id/comments' do
@comment = Comment.new(params[:comment])
	if @comment.save
		@question = Question.first
		redirect "/questions/#{@question.id}/answers"
	else
		@error = "Sorry, server error" # Tell Pamela to display server error in the show answer view 
		erb :'/questions/#{@question.id}/answers' 
	end
end


get '/comments' do
	@question = Question.first 
	erb :'/comments/new' 
end

get '/commentss' do
	@answer = Answer.first 
	erb :'/comments/new_answer_comment' 
end