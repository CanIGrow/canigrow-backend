json.user do
  json.id @user.id
  json.username @user.username
  json.bio @user.bio
  json.plots @user.plots do |plot|
    json.plot_name plot.name
    json.plot_id plot.id
      json.plants plot.plants do |plant|
      json.plant plant.common_name
    end
  end
  json.href user_url(@user)

#   json.questions @user.questions do |question|
#     json.id question.user_id
#     json.id question.user.username
#     json.votes question.votes
#     json.title question.title
#     json.q_body question.q_body
#     json.q_code question.q_code
#     json.href question_url(question)
# end
#     json.answers @user.answers do |answer|
#       json.user_id answer.user_id
#       json.username answer.user.username
#       json.correct_answer answer.correct_answer
#       json.votes answer.votes
#       json.a_body answer.a_body
#       json.a_code answer.a_code
#
#   end
end
