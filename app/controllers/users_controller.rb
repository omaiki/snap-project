get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/login' do
  erb :'users/login'
end


get '/users/profile' do
  @user = current_user
  # @round_objects = @user.rounds
  erb :'users/show'
end

get '/users/:id/edit' do
  erb :'users/edit'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/profile"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end
