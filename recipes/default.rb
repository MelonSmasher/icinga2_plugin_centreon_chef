#
# Cookbook:: icinga2_plugin_centreon
# Recipe:: default
#

if %w{rhel debian}.include?(node['platform_family'])

  ### Install any packages / tools that we need ###

  # install tools for rhel
  if node['platform_family'] == 'rhel'
    package %w(git perl net-snmp-perl perl-XML-LibXML perl-JSON perl-libwww-perl perl-XML-XPath perl-Net-Telnet perl-Net-DNS perl-DBI perl-DBD-MySQL perl-DBD-Pg)
  end

  # install tools for deb
  if node['platform_family'] == 'debian'
    package %w(git perl libsnmp-perl libxml-libxml-perl libjson-perl libwww-perl libxml-xpath-perl libnet-telnet-perl libnet-ntp-perl libnet-dns-perl libdbi-perl libdbd-mysql-perl libdbd-pg-perl)
  end

  ### Read attributes and set vars ###
  git_repo_path = node['icinga2_plugin_centreon']['git']['repo_path']
  git_repo_src_url = node['icinga2_plugin_centreon']['git']['repo_src_url']
  git_tag = node['icinga2_plugin_centreon']['git']['tag']

  nagios_plugin_source = File.join(git_repo_path)
  nagios_plugin_destination = File.join(node['icinga2_plugin_centreon']['nagios']['nagios_plugin_dir'], 'centreon-plugins')

  ### link the plugins to nagios/icinga2 ###
  link 'link_plugins' do
    group 'root'
    link_type :symbolic
    mode 0755
    owner 'root'
    target_file nagios_plugin_destination
    to nagios_plugin_source
    action :nothing
  end

  ### Clone the repository ###
  # This kicks everything off
  git 'icinga2_plugin_centreon_chef' do
    destination git_repo_path
    repository git_repo_src_url
    revision git_tag
    notifies :create, 'link[link_plugins]', :immediately
    action :sync
  end

end
