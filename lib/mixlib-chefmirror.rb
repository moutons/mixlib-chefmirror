#!/usr/bin/env ruby

require 'mixlib/install'

localrepo = '/Users/moutons/chefmirror'
options = { channel: :stable, product_name: 'chef' }

remoteversions = Mixlib::Install.new(options).available_versions

Dir.chdir(localrepo)
localversions = Dir.glob('chef-*.x86_64.rpm')
neededversions = remoteversions - localversions

# this can be any of the following published platforms for Chef Client (see https://downloads.chef.io/chef/)
# el, freebsd, aix, debian, mac_os_x, sles, solaris, ubuntu, windows
needplatform = 'el'
# this number must correspond to the version of your intended platform.
# see the list of URLs shown on https://downloads.chef.io/chef for examples
needplatformversion = '7'

# the following grabs the last 4 Chef Client version numbers which are not currently in the local mirror, constructs the download URL, and downloads them to the defined directory
# this will probably fail at some point given that Mixlib will happily return the Chef 10 version numbers even though packages.chef.io doesn't have them anymore
for needversion in neededversions.last(4) do # rubocop:disable Style/For
  Mixlib::Install.new(product_name: 'chef', channel: :stable, platform: needplatform, platform_version: needplatformversion, architecture: 'x86_64', product_version: needversion).download_artifact
end
