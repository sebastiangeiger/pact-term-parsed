require 'rails_helper'

Pact.provider_states_for "Zoo App" do

  provider_state "an alligator exists" do
    set_up do
    end
  end

end

