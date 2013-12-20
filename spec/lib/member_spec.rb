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
        stub_request(:get, "#{Fulcrum::Api.configuration.uri}/users.json").to_return(:status => 200, :body => '{"current_page":1,"total_pages":1,"total_count":1,"per_page":50,"users":[]}')
        users = Fulcrum::User.all
        Fulcrum::User.response.status.should eq(200)
        users = JSON.parse(users)
        users.keys.should include('current_page')
        users.keys.should include('total_pages')
        users.keys.should include('total_count')
        users.keys.should include('per_page')
        users.keys.should include('users')
        users['users'].should be_a(Array)
      end
    end

    context '#retrieve' do
      it 'should retrieve the specified user' do
        user_id = 'abc'
        stub_request(:get, "#{Fulcrum::Api.configuration.uri}/users/#{user_id}.json").to_return(:status => 200, :body => '{"user":{}}')
        m = Fulcrum::User.find('abc')
        Fulcrum::User.response.status.should eq(200)
        m = JSON.parse(m)
        m.keys.should include('user')
        m['user'].should be_a(Hash)
      end
    end
  end

  describe 'unsuccessful requests' do
    context '#retrieve' do
      it 'should receive 404' do
        user_id = 'abc'
        stub_request(:get, "#{Fulcrum::Api.configuration.uri}/users/#{user_id}.json").to_return(:status => 404)
        m = Fulcrum::User.find(user_id)
        m.keys.should include(:error)
        m[:error][:status].should eq(404)
      end
    end
  end
end
