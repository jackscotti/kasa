require 'api_consumer'

describe ApiConsumer do
  let(:api_response) { JSON.parse(File.open('spec/fixtures/search_response.json').read) }
  let(:consumer) { described_class.new }
  let(:builder) { consumer.builder }

  context "paginating" do
    it "calculates the correct amount of pages" do
      consumer.stub(:number_of_results) {
        1234
      }

      expect(consumer.number_of_pages).to eq(13)
    end


    it "builds a set of URLs for querying all the pages" do
      builder.stub(:query) { "www.api.com?rooms=2"}

      consumer.stub(:number_of_pages) {
        3
      }
      expect(consumer.paginated_urls).to eq([
        "www.api.com?rooms=2&page_number=1",
        "www.api.com?rooms=2&page_number=2",
        "www.api.com?rooms=2&page_number=3",
      ])


      consumer.stub(:number_of_pages) {
        1
      }
      expect(consumer.paginated_urls).to eq([
        "www.api.com?rooms=2&page_number=1",
      ])


      consumer.stub(:number_of_pages) {
        0
      }
      expect(consumer.paginated_urls).to eq([])
    end
  end
end
