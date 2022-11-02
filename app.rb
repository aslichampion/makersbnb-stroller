require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/space_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
    # This allows the app code to refresh
    # without having to restart the server.
    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
        return erb(:index)
    end

    get '/spaces' do

        repo = SpaceRepository.new
        @spaces = repo.all
        return erb(:spaces)

    end

    get '/space' do
        # return "space GET ID: #{params[:id]}" 
        repo = SpaceRepository.new
        @space = repo.find(params[:id])
        return erb(:space_detail)
    end

    get '/users' do

        repo = UserRepository.new
        # @users = repo.all
        # return erb(:spaces)
        users = repo.all
        response = users.map do |user|
            user.email
        end.join(', ')
    
        return response
    
    end

    get '/users/new' do

        return erb(:new_user)

    end

    post '/users' do

        repo = UserRepository.new
        new_user = User.new
        new_user.email = params[:email]
        new_user.password = params[:password]
        new_user.sms = params[:sms]
        
        repo.create(new_user)
        
        return ''

    end

    get '/spaces/new' do

        return erb(:new_space)

    end

    post '/spaces' do

        repo = SpaceRepository.new
        new_space = Space.new
        new_space.name = params[:name]
        new_space.photo_url = params[:photo_url]
        new_space.description = params[:description]
        new_space.price_per_night = params[:price_per_night]
        repo.create(new_space)
        return erb(:index)

    end

end

