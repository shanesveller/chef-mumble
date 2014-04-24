require_relative '../spec_helper'

describe 'mumble::server' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  # Write quick specs using `it` blocks with implied subjects
  it "installs mumble-server" do
    expect(subject).to upgrade_package('mumble-server')
  end

  it "configures mumble-server" do
    expect(subject).to create_template('/etc/mumble-server.ini')
  end

  it "enables mumble-server service" do
    expect(subject).to enable_service('mumble-server')
  end

  it "starts mumble-server service" do
    expect(subject).to start_service('mumble-server')
  end
end
