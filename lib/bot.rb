require 'telegram/bot'
require_relative 'william.rb'

class Bot
  def initialize
    token = '1372499641:AAGWgBpmGNfQDh43yHtQNXAe1Lv6W_PL5O4'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hi I am Jarvis. Tony Stark made me just for you to keep your spirit high. If you're reading this it means he's gone. \n Enter /start to initialize me. To get poems by William Shakespeare, enter \n /william . \n To shut me down, enter /stop .")

        when 'Good Morning', 'Good Evening', 'HELLO', 'HI', 'hello', 'hi', 'Hello', 'Hi'
          bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name}, how are you?")

        when 'I am alright', 'I am good', 'I am doing okay'
          bot.api.send_message(chat_id: message.chat.id, text: 'If I had emotions I would be good too.')

        when 'I could be better'
          bot.api.send_message(chat_id: message.chat.id, text: "Cheer up #{message.from.first_name}, it gets better")

        when 'What poem do you have for me today?'
          bot.api.send_message(chat_id: message.chat.id, text: "Run /william for one of Shakepeare's sonnets.")

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Initializing shut down sequence. See ya later #{message.from.first_name}", date: message.date)

        when '/william'
          poems = Shakespeare.new
          poem = poems.random_poem
          bot.api.send_message(chat_id: message.chat.id, text: (poem['lines']).to_s, date: message.date)
        end
      end
    end
  end
end
