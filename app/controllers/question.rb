# display all questions
get '/questions' do
  @questions = Questions.all
  erb :"/questions/index"
end

# get the form to create a question
get "/users/:user_id/question/new" do
	erb :"questions/new"
end

# create a new question from the form
post "/users/:user_id/questions" do
  current_user.questions.create(params[:question])
  redirect "/users/#{current_user.id}"
end



