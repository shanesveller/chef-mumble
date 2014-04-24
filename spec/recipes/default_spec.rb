require_relative '../spec_helper'

describe 'mumble::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it "does nothing yet"
end
