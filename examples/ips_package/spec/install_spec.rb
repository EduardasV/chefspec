require 'chefspec'

describe 'ips_package::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'solaris2', version: '5.11')
                          .converge(described_recipe)
  end

  it 'installs a ips_package with the default action' do
    expect(chef_run).to install_ips_package('default_action')
    expect(chef_run).to_not install_ips_package('not_default_action')
  end

  it 'installs a ips_package with an explicit action' do
    expect(chef_run).to install_ips_package('explicit_action')
  end

  it 'installs a ips_package with attributes' do
    expect(chef_run).to install_ips_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not install_ips_package('with_attributes').with(version: '1.2.3')
  end

  it 'installs a ips_package when specifying the identity attribute' do
    expect(chef_run).to install_ips_package('identity_attribute')
  end
end
