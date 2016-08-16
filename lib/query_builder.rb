require "addressable/uri"
require 'yaml'

class QueryBuilder

  def search_parameters
    @search_parameters ||= YAML.load_file('./config/search_parameters.yml')
  end

  def query
    query = Addressable::URI.parse(root)
    query.query_values = search_parameters.merge!(api_key: key)
    query.to_s
  end

private

  def key
    require 'dotenv' # this needs to be in the app initializer
    Dotenv.load # this needs to be in the app initializer
    ENV['ZOOPLA_KEY']
  end

  def root
    "http://api.zoopla.co.uk/api/v1/property_listings.json"
  end
end
