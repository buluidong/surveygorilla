set :protection, except: :session_hijacking

get '/surveys/new_s' do
  erb :new_s
end

post '/survey/new' do
  # params.inspect
  survey = Survey.create({name: params[:survey_name], image_url: params[:image]})
  current_user.created_surveys << survey
  params[:question].each do |i, q_text|
    survey.questions << Question.create({text: q_text})
    question = survey.questions.last
    params[:choice][i].each do |i, c_text|
      question.choices << Choice.create({text: c_text})
    end
  end
  redirect to '/profile'
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions

  erb :survey
end

post '/survey/:id/vote' do
  participation = Participation.create({taker_id: current_user.id, survey_id: params[:id]})
  params[:response].each do |i, c_id|
    Response.create({choice_id: c_id, participation_id: participation.id})
  end
  redirect to '/profile'
end

get '/survey/:id/result' do
  @survey = Survey.find_by_id(params[:id])
  @questions = @survey.questions
  erb :result
end