require 'faker'

Survey.destroy_all
User.destroy_all
Question.destroy_all
Participation.destroy_all
Choice.destroy_all
Response.destroy_all

150.times do
  User.create({name: Faker::Name.name, username: Faker::Internet.email, password: "password"})
end

User.all.each do |user|
  user.created_surveys << Survey.create({name: Faker::Address.country})
end

Survey.all.each do |survey|
  5.times do
    survey.questions << Question.create({text: Faker::Lorem.sentence[0..-2] + "?"})
  end
end

Question.all.each do |q|
  4.times do
    q.choices << Choice.create({text: Faker::Lorem.word})
  end
end

User.all.each do |user|
  survey = (Survey.all - [Survey.first]).sample
  participation = Participation.create({taker_id: user.id, survey_id: survey.id})
  survey.questions.each do |q|
    choice = q.choices.sample
    Response.create({participation_id: participation.id, choice_id: choice.id})
  end
end

# User.all.each do |user|
#   survey = Survey.first
#   participation = Participation.create({taker_id: user.id, survey_id: survey.id})
#   survey.questions.each do |question|
#     choice = question.choices.sample
#     Response.create({participation_id: participation.id, choice_id: choice.id})
#   end
# end