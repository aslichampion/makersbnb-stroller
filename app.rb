#require 'sinatra'
#require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/space_repository'

DatabaseConnection.connect
