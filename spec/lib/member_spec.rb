require 'spec_helper'

describe Fulcrum::Member do
  
  before(:all) do
    @uri = 'http://foo.bar/api/v2'
    @key = 'foobar'
  end
  
  describe 'successful requests' do
    context '#all' do
      it 'should retrieve all members' do
        stub_request(:get, "#{@uri}/members.json").to_return(:status => 200, :body => '{"current_page":1,"total_pages":1,"total_count":1,"per_page":50,"members":[]}')
        member = Fulcrum::Member.new(uri: @uri, key: @key)
        members = member.all
        member.response.status.should eq(200)
        members = JSON.parse(members)
        members.keys.should include('current_page')
        members.keys.should include('total_pages')
        members.keys.should include('total_count')
        members.keys.should include('per_page')
        members.keys.should include('members')
        members['members'].should be_a(Array)
      end
    end
  
    context '#retrieve' do
      it 'should retrieve the specified member' do
        member_id = 'abc'
        stub_request(:get, "#{@uri}/members/#{member_id}.json").to_return(:status => 200, :body => '{"member":{}}')
        member = Fulcrum::Member.new(uri: @uri, key: @key)
        m = member.retrieve('abc')
        member.response.status.should eq(200)
        m = JSON.parse(m)
        m.keys.should include('member')
        m['member'].should be_a(Hash)
      end
    end
  end
  
  describe 'unsuccessful requests' do
    context '#retrieve' do
      it 'should receive 404' do
        member_id = 'abc'
        stub_request(:get, "#{@uri}/members/#{member_id}.json").to_return(:status => 404)
        member = Fulcrum::Member.new(uri: @uri, key: @key)
        expect { member.retrieve(member_id) }.to raise_error(/404/)
      end
    end
  end
end
