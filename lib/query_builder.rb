require "addressable/uri"
require 'yaml'

class QueryBuilder

  def search_parameters
    @search_parameters ||= YAML.load_file('./config/search_parameters.yml')
  end

  def query
    query = Addressable::URI.parse(root)
    query.query_values = search_parameters
    query.to_s
  end

private

  def root
    "http://api.zoopla.co.uk/api/v1/property_listings.json"
  end
end
