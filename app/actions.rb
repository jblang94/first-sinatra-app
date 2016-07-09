# index.erb -> Homepage (Root path) 
get '/' do
  erb :index
end

# index.erb -> HTTP GET: Shows all messages that have been posted
get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

# new.erb -> HTTP GET: Shows the form for creating a new message
get '/messages/new' do
  erb :'messages/new'
end

# new.erb to index.erb -> HTTP POST: Saves the input from the form into the DB and redirects to /messages
post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author]
    )
  @message.save
  redirect '/messages'
end

# show.erb -> HTTP GET: Shows the details of a single message
# searches the DB for the message with "id"
get '/messages/:id' do 
  @message = Message.find params[:id]
  erb :'messages/show'
end
