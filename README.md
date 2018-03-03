# mixlib-chefmirror

Hacky way to create a local mirror of chef client from packages.chef.io to save yourself the trouble of asking to be removed from the blocklist.

## As is status

This functions, barely, for grabbing the EL 7 packages. Caveat emptor and modify it to suit your needs.

## To Do

* take an array of platforms needed and extrapolate the platform version numbers supported by packages.chef.io into a hash of available versions for each platform
* fix the failure that occurs when `neededversions.last(4)` returns a Chef Client version which is not hosted on packages.chef.io anymore
* idk, make this into a gem?
* tests
* learn ruby

## Not Officially Supported

This is something I hacked out in less than an hour and is not officially supported by Chef Software Inc., or even by me. I'm incredibly surprised by the fact that it works on my machine.