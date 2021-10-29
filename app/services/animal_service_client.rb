require 'httparty'

class AnimalServiceClient
  include HTTParty
  base_uri 'http://animal-service.com'

  def get_alligator
    name = JSON.parse(self.class.get("/alligator").body)['name']
    Alligator.new(name)
  end

  def get_alligators
    query = { names: ["Bett", "And"] }
    names = JSON.parse(self.class.get("/alligators", query: query).body).map {|json| json['name']}
    names.map {|name| Alligator.new(name)}
  end
end
