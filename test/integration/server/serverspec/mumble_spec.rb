require 'serverspec'

include SpecInfra::Helper::Exec
include SpecInfra::Helper::DetectOS

describe service('mumble-server') do
  it { should be_enabled }
  it { should be_running }
end

describe port(64_739) do
  it { should be_listening }
end
