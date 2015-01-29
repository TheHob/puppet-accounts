require 'spec_helper'

describe 'accounts' do

  let(:params){{
    :manage_users  => true,
    :manage_groups => true,
  }}

  it { should compile.with_all_deps }
  it { should contain_class('accounts::users') }
  it { should contain_class('accounts::groups') }

  context 'allow passing users and groups directly to init class' do
    let(:params){{
      :users => { 'john' => { 'comment' => 'John Doe', 'gid' => 2001 }},
      :groups => { 'developers' => { 'gid' => 2001 }}
    }}

    it { should contain_user('john').with(
      'comment' => 'John Doe',
      'gid' => 2001
    )}

    it { should contain_group('developers').with(
      'gid'    => 2001,
      'ensure' => 'present'
    )}

  end
end