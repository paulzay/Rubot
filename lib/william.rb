require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Shakespeare
  @poems = nil

  def initialize
    @poems = fetch_poems
  end

  def fetch_poems
    url = 'https://poetrydb.org/author,title/Shakespeare;Sonnet'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def random_poem
    @poems = @poems.sample
    @poems
  end
end
