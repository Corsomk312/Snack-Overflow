class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  def net_votes_question(question_id)
    question = Question.find(question_id)
    up = question.votes.where(value: "up").count
    down = question.votes.where(value: "down").count
    up - down
  end

end
