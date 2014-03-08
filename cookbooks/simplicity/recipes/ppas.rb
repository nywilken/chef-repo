apt_repository 'cinnamon' do
  uri 'http://ppa.launchpad.net/gwendal-lebihan-dev/cinnamon-stable/ubuntu'
  distribution node[:lsb][:codename]
  components ['main']
end

apt_repository 'system76' do
  uri 'http://ppa.launchpad.net/system76-dev/stable/ubuntu'
  distribution node[:lsb][:codename]
  components ['main']
end

apt_repository 'sun-java' do
  uri 'http://ppa.launchpad.net/webupd8team/java/ubuntu'
  distribution node[:lsb][:codename]
  components ['main']
end

apt_repository 'virtualbox' do
  uri 'http://download.virtualbox.org/virtualbox/debian'
  distribution node[:lsb][:codename]
  components ['contrib']
  key 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc'
end


