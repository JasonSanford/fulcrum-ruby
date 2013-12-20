require 'spec_helper'

describe Fulcrum::User do

  before(:all) do
    Fulcrum::Api.configure do |config|
      config.uri = 'http://foo.bar/api/v2'
      config.key = 'foobar'
    end
  end

  describe 'successful requests' do
    context '#all' do
      it 'should retrieve all users' do
        stub_request(:get, "#{Fulcrum::Api.configuration.uri}/users.json").to_return(:status => 200, :body => '{"user":{"first_name":"Fred","last_name":"Flinstone","api_token":null,"email":"shoeless.fred@gmail.com","id":"4000000bc","contexts":[],"access":{"allowed":true}}}')
        resp = Fulcrum::User.all
        Fulcrum::User.response.status.should eq(200)
        resp_hash = JSON.parse(resp)
        user = resp_hash['user']
        user.keys.should include('first_name')
        user.keys.should include('last_name')
        user.keys.should include('api_token')
        user.keys.should include('email')
        user.keys.should include('id')
        user.keys.should include('access')
        user.keys.should include('contexts')
        user['contexts'].should be_a(Array)
      end
    end
  end
end
