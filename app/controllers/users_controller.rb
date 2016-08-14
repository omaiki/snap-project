
# USERS NEW
get '/users/new' do
  erb :'users/new' #show new users view
end

# USERS SHOW
get '/users/:id' do
  if session[:id] == current

  @user = User.find(params[:id]) #define instance variable for view

  erb :'users/show' #show single user view

end

#USERS EDIT
#EDITS A SPECIFIC USER
get '/users/:id/edit' do

  #get params from url
  @user = User.find(params[:id]) #define intstance variable for view

  erb :'users/edit' #show edit user view

end

#USERS CREATE
post '/users' do

  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user

  if @user.save #saves new user or returns false if unsuccessful
    session[:id] = @user.id #if user saves, log them in (set session)
    redirect '/users/#{@user.id}' #redirect back to users index page
  else
    @errors = @user.errors.full_messages
    erb :'users/new' # show new users view again and displays errors
  end

end


#USERS EDIT
#UPDATES A SPECIFIC USER
put '/users/:id' do

  #get params from url
  @user = User.find(params[:id]) #define variable to edit

  @user.assign_attributes(params[:user]) #assign new attributes

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users/#{@user.id}' #redirect back to users specific profile page
  else
    erb :'users/edit' #show edit user view again(potentially displaying errors)
  end

end

#USERS DELETE
#DELETES A SPECIFIC USER
delete '/users/:id' do
  #get params from url
  @user = User.find(params[:id]) #define user to delete
  @user.destroy #delete user
  redirect '/users' #redirect back to users index page
end





