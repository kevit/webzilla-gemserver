name             'webzilla-gemserver'
maintainer       'White Horse LLC'
maintainer_email 'simarg@gmail.com'
license          'All rights reserved'
description      'Installs/Configures gemserver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'runit'
depends 'rbenv', '>= 1.5.0'
depends 'nginx', '>= 1.7.0'
