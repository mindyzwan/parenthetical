require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"
load 'database/database_persistence.rb'


get "/" do
  erb :home
end

get "/:userid/scripts" do
  erb :all_scripts
end

get "/users" do
  db = DatabasePersistence.new(logger)
  erb :users, locals: { users: db.all_users }
end

get "/scripts" do
  db = DatabasePersistence.new(logger)
  erb :scripts, locals: { scripts: db.all_scripts }
end

get "/sign_in" do
  erb :sign_in
end
