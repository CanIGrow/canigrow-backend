json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email
  json.location @user.location
  json.location_private @user.location_private
  json.bio @user.bio
  json.facebook @user.facebook
  json.twitter @user.twitter
  json.plots @user.plots do |plot|
    json.plot_name plot.name
    json.plot_id plot.id
      json.plants plot.plants do |plant|
      json.plant_id plant.id
      json.plant plant.common_name
    end
  end
  json.comments @user.comments do |comment|
    json.comment_id comment.id
    json.plant_id comment.plant_id
    json.body comment.body
    json.datetime comment.datetime
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
