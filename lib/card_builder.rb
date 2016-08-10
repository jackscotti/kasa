class CardBuilder

  def build(name:, description:)
    Trello::Card.create(name: title, list_id: ENV["TRELLO_LIST_ID"], desc: description)
  end

end
