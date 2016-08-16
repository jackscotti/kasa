require 'query_builder.rb'

describe QueryBuilder do

  let(:builder) { described_class.new }

  it "initiates" do
    expect(builder.class).to eq(QueryBuilder)
  end

  it "reads the search parameters" do
    expect(builder.search_parameters.class).to eq(Hash)
  end

  it "builds the query utilising the params from the yaml file" do
    builder.stub(:root) {
      "https://www.api.com"
    }
    builder.stub(:search_parameters) {{
      maximum_price: 500,
      minimum_beds: 3,
      maximum_beds: 4,
    }}
    builder.stub(:key) {
      "a-key"
    }

    expect(builder.query).to eq(
      "https://www.api.com?" +
      "api_key=a-key&" +
      "maximum_beds=4&" +
      "maximum_price=500&" +
      "minimum_beds=3"
    ) # The gems sorts the params alphabetically
  end
end
