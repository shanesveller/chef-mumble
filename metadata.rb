name             'mumble'
maintainer       'Shane Sveller'
maintainer_email 'shane@shanesveller.com'
license          'MIT'
description      'Installs/Configures mumble'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'

supports 'ubuntu', '= 12.04'
supports 'ubuntu', '= 14.04'

recipe 'mumble::server', 'Installs Mumble VoIP server'

attribute 'mumble/port',
          display_name: 'Server Port',
          description: 'Port VoIP server listens on',
          required: 'optional',
          recipes: ['mumble::server'],
          default: 64_739
