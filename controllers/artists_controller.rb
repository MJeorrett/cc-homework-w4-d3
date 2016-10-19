require_relative('../models/table')

before do
  @table = Table.new( 'music_library', 'artists')
end

# INDEX
get '/artists' do
  "get '/artists' hit with params:#{params}"
end

# NEW
get '/artists/new' do
  @html = @table.new_form_html()
  erb(:blank)
end

# CREATE
post '/artists' do
  puts params
  @table.create_record( params )
end

# SHOW
get '/artists/:id' do
  "get '/artists/:id' hit with params:#{params}"
end

# EDIT
get '/artists/:id/edit' do
  "get '/artists/:id/edit' hit with params:#{params}"
end

# UPDATE
put '/artists/:id' do
  "put '/artists/:id' hit with params:#{params}"
end

# DESTROY
delete '/artists/:id' do
  "delete '/artists/:id' hit with params:#{params}"
end
