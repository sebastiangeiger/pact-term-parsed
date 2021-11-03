require 'rails_helper'

describe AnimalServiceClient, :pact => true do

  before do
    # Configure your client to point to the stub service on localhost using the port you have specified
    AnimalServiceClient.base_uri 'localhost:1234'
  end

  subject { AnimalServiceClient.new }

  describe "get_alligator" do

    before do
      animal_service.given("an alligator exists").
        upon_receiving("a request for an alligator").
        with(method: :get, path: '/alligator', query: '').
        will_respond_with(
          status: 200,
          headers: {'Content-Type' => 'application/json'},
          body: {name: 'Betty'} )
    end

    it "returns an alligator" do
      expect(subject.get_alligator).to eq(Alligator.new('Betty'))
    end

  end

  describe "get_alligators" do

    before do
      animal_service.given("an alligator exists").
        upon_receiving("a request for an alligators").
        with(
          method: :get,
          path: '/alligators',
          query: Pact.term(
            generate: 'names%5B%5D=Bett&names%5B%5D=And',
            matcher: /names%5B%5D=Bett&names%5B%5D=And/
          )
        ).
        will_respond_with(
          status: 200,
          headers: {'Content-Type' => 'application/json'},
          body: [{name: 'Betty'}, {name: 'Andy'}] )
    end

    it "returns an alligator" do
      expect(subject.get_alligators).to contain_exactly(
        Alligator.new('Betty'),
        Alligator.new('Andy'),
      )
    end

  end

end
