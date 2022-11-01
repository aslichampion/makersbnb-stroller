require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/space_repository'

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

end

