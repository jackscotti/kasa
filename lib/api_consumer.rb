require 'query_builder'
require 'httparty'

class ApiConsumer
  attr_reader :builder

  def initialize(builder = QueryBuilder.new)
    @urls = builder.paginated_urls
  end

  def get(query)
    HTTParty.get(query)
  end

  def consume
    # uses #get to obtain data from the api
    # uses something else to filter the data
    # stores data to db (marking it as 'not in Trello')
    # does not create duplicates
  end
end
