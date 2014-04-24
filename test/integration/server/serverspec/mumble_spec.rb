require 'serverspec'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

describe service('mumble-server') do
  it { should be_enabled }
end

describe process('murmurd') do
  its(:args) { should match %r{\-ini /etc/mumble\-server\.ini}}
  it { should be_running }
end

describe port(64_738) do
  it { should be_listening }
end
