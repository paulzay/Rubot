require_relative '../lib/william.rb'

RSpec.describe Shakespeare do
  describe '#fetch_poems' do
    let(:request) { Shakespeare.new }
    let(:response) { request.fetch_poems }

    it 'should return an array of hashes' do
      expect(response.class).to eql(Array)
    end
  end

  describe '#random_poem' do
    let(:random) { Shakespeare.new }
    let(:random_response) { random.random_poem }

    it 'should return a hash' do
      expect(random_response.class).to eql(Hash)
    end

    it 'should have four key and value pairs' do
      expect(random_response.count).to eql(4)
    end
  end
end
