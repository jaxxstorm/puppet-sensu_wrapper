require 'spec_helper'

describe 'sensu_wrapper', :type => :class do

  RSpec.configure do |c|
    c.default_facts = {
      :architecture           => 'x86_64',
      :operatingsystem        => 'CentOS',
      :osfamily               => 'RedHat',
      :operatingsystemrelease => '6.6',
      :kernel                 => 'Linux',
    }
  end

  # defaults
  context 'defaults' do
    it { should compile }
  end

  context "When installing via URL by default" do
    let (:params) {{
      :version => 'v1.0.0'
    }}
    it { should contain_archive('/tmp/sensu-wrapper.tar.gz').with(:source => 'https://github.com/jaxxstorm/sensu-wrapper/releases/download/v1.0.0/sensu-wrapper_linux_amd64.tar.gz') }
    it { should contain_file('/usr/local/bin/sensu-wrapper').with(:ensure => 'link', :target => '/opt/sensu-wrapper-v1.0.0/sensu-wrapper_linux_amd64') }
  end

  context "When using a custom install URL" do
    let (:params) {{
      :download_url => 'https://localhost/sensu-wrapper-0.1.0.tar.gz',
      :version      => 'v1.0.0'
    }}

    it { should contain_archive('/tmp/sensu-wrapper.tar.gz').with(:source => 'https://localhost/sensu-wrapper-0.1.0.tar.gz') }
    it { should contain_file('/usr/local/bin/sensu-wrapper').with(:ensure => 'link', :target => '/opt/sensu-wrapper-v1.0.0/sensu-wrapper_linux_amd64') }
  end
  
end

