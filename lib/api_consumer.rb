require 'query_builder'
require 'httparty'

class ApiConsumer
  attr_reader :builder

  def initialize(builder = QueryBuilder.new)
    @builder = builder
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

  def paginated_urls
    number_of_pages.times.with_object([]) do |page_number, array|
      array << (builder.query + "&page_number=" + (page_number + 1).to_s)
    end
  end

  def number_of_pages
    (number_of_results.to_f / 100).ceil
  end

private

  def number_of_results
    @number_of_pages = get(builder.query)["result_count"]
  end
end
