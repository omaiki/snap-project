get '/' do
  redirect '/users'
end


# get '/' do
#   if current_user
#     redirect "/users/#{current_user.id}"
#   else
#     redirect '/snapshots'
#   end
# end
