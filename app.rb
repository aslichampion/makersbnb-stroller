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

    get '/spaces/:start_date/:nights' do
        start_date = params[:start_date]
        number_of_nights = params[:nights].to_i
        repo = SpaceRepository.new
        @spaces = repo.find(start_date, number_of_nights)
        return erb(:spaces)

    end

    get '/spaces' do

        repo = SpaceRepository.new
        @spaces = repo.all
        return erb(:spaces)

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

    get '/bookings' do

        repo = BookingRepository.new
        # @users = repo.all
        # return erb(:spaces)
        @bookings = repo.all
        return erb(:bookings)
    
    end

end

