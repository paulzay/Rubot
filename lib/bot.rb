require 'telegram/bot'

class Bot
  def initialize
    token = '1372499641:AAGWgBpmGNfQDh43yHtQNXAe1Lv6W_PL5O4'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text.downcase
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hi I am Jarvis. Tony Stark made me just for you. If you're reading this it means he's gone. \n Enter /start to initialize me, \n To shut me down, enter /stop .")

        when 'Good Morning', 'Good Evening', 'HELLO', 'HI'
          bot.api.send_message(chat_id: message.chat.id, text: "Hi, #{message.from.first_name}, it's a pleasure.")

        when '/stop'

          bot.api.send_message(chat_id: message.chat.id, text: "Initializing shut down sequence. See ya later #{message.from.first_name}", date: message.date)
        end
      end
    end
  end
end
