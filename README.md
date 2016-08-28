# Kasa - WIP

An application for creating Trello cards out of Zoopla (or Rightmove) search queries.

## Zoopla docs:
- http://developer.zoopla.com/docs/read/Property_listings

## Trello docs:
- https://developers.trello.com/get-started/start-building#authenticate

## TODO:

- [*] Create paginated query urls
- []  Allow more than one search location.
- []  Favour or highlight houses from "agent_name"=>"OpenRent".
- []  Do not post to Trello if the target column is 'full'.
- []  Do not store duplicate houses in the db.
- []  Sort API results by date.
- []  Do not query API for more results if the date limit has been reached.
- []  Do not store to db anything older than 2 weeks.
