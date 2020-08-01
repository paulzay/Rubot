require_relative '../lib/william.rb'
require_relative '../lib/bot.rb'

describe Shakespeare do
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

describe Bot do
  describe '#initialize' do
    let(:rubot) { Bot.new }
    it "returns same class as the bot" do
      expect(rubot.class).to eql Bot
    end
  end
end
