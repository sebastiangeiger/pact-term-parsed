require 'rails_helper'

RSpec.describe Alligator do
  it 'can be initialized' do
    expect(Alligator.new("My Alligator")).to have_attributes(
      name: "My Alligator",
    )
  end
end
