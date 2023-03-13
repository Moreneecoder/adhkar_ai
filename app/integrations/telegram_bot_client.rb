require 'telegram/bot'

class TelegramBotClient    
  class << self

    SPECIAL_ENTITIES = ['_', '*', '[', ']', '(', ')', '~', '`', '>', '#', '+', '-', '=', '|', '{', '}', '.', '!']

    def start
        Telegram::Bot::Client.run(ENV["TELEGRAM_API_KEY"]) do |bot|
          p ENV["TELEGRAM_API_KEY"]
          puts 'Bot is running...'
    
          listen(bot)
        end
    end

    def listen(bot)
      bot.listen do |message|
          begin
            p message.text if message.respond_to?(:text) && !message.text.nil?
            process_message(bot, message) if message.respond_to?(:text) && !message.text.nil?
          rescue HTTParty::Error, SocketError => e
            puts "I'm so sorry. I'm having an issue with processing your request at the moment. Please try again in a short while."
          end                                
      end
    end

    private

    def process_message(bot, message)
        p gpt3_response = OpenAiClient.ask(message.text)

        bot.api.send_message(
            chat_id: message.chat.id, parse_mode: 'MarkdownV2',
            text: format_reply(gpt3_response.result.reply)
          )
    end

    def format_reply(data)      
      SPECIAL_ENTITIES.each {|entity| data = data.gsub(entity, "\\#{entity}")}
      p data
    end
  end
end