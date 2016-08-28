require 'api_consumer'

describe ApiConsumer do
  let(:api_response) { JSON.parse(File.open('spec/fixtures/search_response.json').read) }
  let(:consumer) { described_class.new }
end
