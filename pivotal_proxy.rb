require 'sinatra'
require "base64"
require 'open-uri'
require 'active_support/core_ext'
require 'json'

enable :sessions

BASE_URL = "https://www.pivotaltracker.com/services/v3"

get '/auth' do
  authorize('pmcclure@rumblelabs.com', 'novacane8')
end

get '/projects' do
  get("/projects")
end

get '/projects/:id' do
  get("/projects/#{params[:id]}")
end

get '/projects/:project_id/memberships' do
  get("/projects/#{params[:project_id]}/memberships")
end

get '/projects/:project_id/memberships/:id' do
  get("/projects/#{params[:project_id]}/memberships/#{params[:id]}")
end

get '/projects/:project_id/iterations' do
  get("/projects/#{params[:project_id]}/iterations")
end

get '/projects/:project_id/iterations/:group' do
  get("/projects/#{params[:project_id]}/iterations/#{params[:group]}")
end

get '/projects/:project_id/stories' do
  get("/projects/#{params[:project_id]}/stories")
end

get '/projects/:project_id/stories/:id' do
  get("/projects/#{params[:project_id]}/stories/#{params[:id]}")
end

get '/projects/:project_id/stories/:story_id/tasks' do
  get("/projects/#{params[:project_id]}/stories/#{params[:story_id]}/tasks")
end

get '/projects/:project_id/stories/:story_id/tasks/:id' do
  get("/projects/#{params[:project_id]}/stories/#{params[:story_id]}/tasks/#{params[:id]}")
end

def authorize(user, pass)
  auth = "Basic " + Base64::encode64("#{user}:#{pass}")
  response = open("#{BASE_URL}/tokens/active", "Authorization" => "#{auth}", "Content-Type" => "application/xml").read
  hash_response = Hash.from_xml(response)
  auth_token = hash_response["token"]["guid"]
  session[:auth_token] = auth_token
end

def get(path)
  response = open("#{BASE_URL}#{path}", "X-TrackerToken" => session[:auth_token], "Content-Type" => "application/xml").read
  Hash.from_xml(response).to_json
end
