require_relative '../spec_helper'

describe 'mumble::server' do
  subject do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
      node.set['mumble']['logfile'] = '/var/log/mumble-server/mumble-server-new.log'
      node.set['mumble']['pidfile'] = '/var/log/mumble-server/mumble-server-new.pid'
      node.set['mumble']['port'] = 64_739
      node.set['mumble']['password'] = '$ERVERP4SSWORD'
      node.set['mumble']['supassword'] = 'G1MM3R00T'
      node.set['mumble']['bandwidth'] = 36_000
      node.set['mumble']['users'] = 50
    end.converge(described_recipe)
  end

  # Write quick specs using `it` blocks with implied subjects
  it 'installs mumble-server' do
    expect(subject).to upgrade_package('mumble-server')
  end

  it 'configures mumble-server' do
    expect(subject).to create_template('/etc/mumble-server.ini')
  end

  it 'enables mumble-server service' do
    expect(subject).to enable_service('mumble-server')
  end

  it 'starts mumble-server service' do
    expect(subject).to start_service('mumble-server')
  end

  %w(logfile pidfile port serverpassword bandwidth users).each do |config|
    it "sets custom config attribute #{config}" do
      expect(subject).to render_file('/etc/mumble-server.ini')
        .with_content("#{config}=#{subject.node.mumble[config]}")
    end
  end
end
