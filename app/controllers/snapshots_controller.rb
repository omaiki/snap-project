
#display list of all snapshots

get '/snapshots' do
  @snapshots = Snapshot.all
  erb :'/snapshots/index'
end

#check out a specific snapshot
get '/snapshots/:id' do
  @snapshot = Snapshot.find(params[:id])
  # user = current_user
  erb :'/snapshots/show'
end



