require "addressable/uri"
require 'httparty'
require 'yaml'

class QueryBuilder

  def search_parameters
    @search_parameters ||= YAML.load_file('./config/search_parameters.yml')
  end

  def paginated_urls
    number_of_pages.times.with_object([]) do |page_number, array|
      array << (root_query + "&page_number=" + (page_number + 1).to_s)
    end
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

  def number_of_pages
    (number_of_results / 100.to_f).ceil
  end

  def number_of_results
    get(query)["result_count"]
  end

  def get(query)
    HTTParty.get(query)
  end

  def root_query
    query = Addressable::URI.parse(root)
    query.query_values = search_parameters.merge!(api_key: key)
    query.to_s
  end
end
