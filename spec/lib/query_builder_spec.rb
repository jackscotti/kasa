require 'query_builder.rb'

describe QueryBuilder do

  let(:builder) { described_class.new }

  it "initiates" do
    expect(builder.class).to eq(QueryBuilder)
  end

  it "reads the search parameters" do
    expect(builder.search_parameters.class).to eq(Hash)
  end

end
