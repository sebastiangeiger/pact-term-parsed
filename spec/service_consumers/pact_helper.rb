require 'pact/provider/rspec'
require_relative 'provider_states_for_zoo_app'

Pact.service_provider "Animal Service" do

  honours_pact_with 'Zoo App' do

    # This example points to a local file, however, on a real project with a continuous
    # integration box, you would use a [Pact Broker](https://github.com/pact-foundation/pact_broker) or publish your pacts as artifacts,
    # and point the pact_uri to the pact published by the last successful build.

    pact_uri 'spec/pacts/zoo_app-animal_service.json'
  end
end
