#TODO: This needs to be run when starting the application
require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV["TRELLO_KEY"]
  config.member_token = ENV["TRELLO_TOKEN"]
end
