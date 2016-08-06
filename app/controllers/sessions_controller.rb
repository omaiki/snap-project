# sessions new

get '/sessions/new' do
  erb :"sessions/new"
end


# sessions create

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password]) #ensuring @user is created and no nil
    session[:id] = @user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Invalid input, please try again"]
    erb :'sessions/new'
end


# sessions delete

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/users'
end



# def login
#   @user = User.find_by_email(params[:email])
#   if @user.password == params[:password]
#     give_token
#   else
#     redirect_to home_url
#   end
# end