require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"


get "/" do
  erb :home
end

get "/:userid/scripts" do
  erb :all_scripts
end

get "/sign_in" do
  erb :sign_in
end