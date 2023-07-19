# frozen_string_literal: true

# myapp.rb
require 'sinatra'
require 'sinatra/json'
require_relative 'open_notify'

# Allow our templates in views/ to end in `.html.erb`
Tilt.register Tilt::ERBTemplate, 'html.erb'

set :layout, 'views/layout.html.erb'

get '/' do
  erb :index
end

get '/position' do
  iss_now = OpenNotify.iss_now

  erb :position, locals: { data: iss_now }
end

get '/who' do
  iss_now = OpenNotify.iss_now

  erb :who, locals: { data: iss_now }
end

get '/iss_position.json' do
  return json(OpenNotify.iss_now)
end
