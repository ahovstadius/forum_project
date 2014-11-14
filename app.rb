require "sinatra"
require "sequel"

DB = Sequel.connect('sqlite://test.db')


get "/home" do
  @items = DB[:items]
  erb :views
end

=begin
  DB.create_table :junk do
    primary_key :id
    String :username
    String :post
  end
=end

post '/send' do
  @items = DB[:items]
  username = params['username']
  post = params['post']
  @items.insert(:username=>username, :post=>post)


  #items.insert(:username => uname , :post => ?)

  #insert above values into database fields
  erb :views
end






