require 'query_builder.rb'

describe QueryBuilder do
  let(:builder) { described_class.new }

  it "builds the query utilising the params from the yaml file" do
    builder.stub(:key) { "a-key" }
    builder.stub(:root) { "www.api.com" }
    builder.stub(:search_parameters) {{
      maximum_price: 500,
      minimum_beds: 3,
      maximum_beds: 4,
    }}

    expect(builder.send(:root_query)).to eq(
      "www.api.com?" +
      "api_key=a-key&" +
      "maximum_beds=4&" +
      "maximum_price=500&" +
      "minimum_beds=3"
    ) # The gems sorts the params alphabetically
  end

  context "#paginated_urls" do
    it "creates paginated urls based on the number of pages given" do
      builder.stub(:key) { "a-key" }
      builder.stub(:root) { "www.api.com" }
      builder.stub(:search_parameters) {{
        maximum_price: 500,
      }}

      builder.stub(:number_of_results) {
        345
      }
      expect(builder.paginated_urls).to eq([
        "www.api.com?api_key=a-key&maximum_price=500&page_number=1",
        "www.api.com?api_key=a-key&maximum_price=500&page_number=2",
        "www.api.com?api_key=a-key&maximum_price=500&page_number=3",
        "www.api.com?api_key=a-key&maximum_price=500&page_number=4",
      ])

      builder.stub(:number_of_results) {
        10
      }
      expect(builder.paginated_urls).to eq([
        "www.api.com?api_key=a-key&maximum_price=500&page_number=1",
      ])

      builder.stub(:number_of_results) {
        0
      }
      expect(builder.paginated_urls).to eq([])
    end
  end
end
