require 'bcrypt'
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/space_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base

    enable :sessions

    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
        return erb(:bootstrap_test)
    end

    get '/login' do
        return erb(:login)
    end

    post '/login' do
        email = params[:email]
        password = params[:password]
    
        user = UserRepository.new
        user.find_by_email(email)
    
        if user.password == password
          # Set the user ID in session
          session[:user_id] = user.id
    
          return erb(:login_success)
        else
          return erb(:login_error)
        end
    end

    get '/spaces' do
        start_date = params[:start_date]
        nights = params[:nights]
        repo = SpaceRepository.new
        if start_date && start_date != "" && nights && nights != ""
          @spaces = repo.find(start_date, nights.to_i)
        else
          @spaces = repo.all
        end
        return erb(:spaces)
    end

    get '/space' do
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
        new_user.password = BCrypt::Password.create(params[:password])
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
        return redirect('/spaces')

    end

    get '/bookings' do

        repo = BookingRepository.new
        # @users = repo.all
        # return erb(:spaces)
        @bookings = repo.all
        return erb(:bookings)

    end

end

