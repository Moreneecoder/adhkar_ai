# AdhkarAI

> A telegram AI bot that provides you with quran verses and adhkars based on how you are feeling and your current experience.

![](https://user-images.githubusercontent.com/38987207/224560004-8a53f024-4c97-4bf5-b36b-c7315d743e8f.png)

## About The Program
The Adhkar AI bot is sort of a companion bot for muslims (especially those not vast in Islamic knowledge). It's purpose it's to take their feelings or a current experience and provide them with two surahs and two adhkars to help ease their affairs. It leverages OpenAI's gtp3-turbo model as it's knowledge base.

**PLEASE NOTE**: This bot is a submodel that has been 'trained' to not got out of the scope described above, hence it will not answer any questions/input outside its scope. The reason for this is to prevent it from being used as a scholarly source for sensitive Islamic rulings.

## Built With

- Ruby programming language
- Ruby on Rails Framework
- [Telegram-Bot-Ruby](https://github.com/atipugin/telegram-bot-ruby) library
- OpenAI's [gpt-3-turbo](https://platform.openai.com/docs/guides/chat) model

## Getting Started

To set up a local version of this project, a collection of steps have been put together to help guide you from installations to usage. Simply follow the guide below and you'll be up and running in no time.

### Set up

- Install [git](https://git-scm.com/downloads)
- Install [the Ruby programming language](https://ruby-doc.org/downloads/), if you haven't already.
- Install [the Ruby on Rails MVC Framework](https://rubyonrails.org/), if you haven't already.
- Open Terminal
- Navigate to the preferred location/folder you want the app on your local machine. Use `cd <file-path>` for this.
- Run `git clone https://github.com/Moreneecoder/adhkar_ai.git` to download the bot source file.
- Now that you have a local copy of the project, navigate to the root of the project folder from your terminal.

- Run `bundle install` to install all dependencies in the Gemfile file.

- One last **important** detail. To control your bot uniquely, you will need a Telegram Bot Api *token* from the [Botfather](https://core.telegram.org/bots#6-botfather)
- When you get your api token from Botfather, open the `telegram_bot_client.rb` file and replace the `ENV["TELEGRAM_API_KEY"]` enviroment variable in the `Telegram::Bot::Client.run` method with your new token. Or alternatively, you could create a `.env` file and put the token in there.

### Usage

At this point, you now have everything you need to properly run the program (source code, ruby, api token). If not, refer again to the setup section of this documentation.

To get the bot running, follow the instructions below:

* run `bundle exec rails runner /bin/start_bot.rb` in the terminal. You should make sure your terminal is navigated to the current directory of the program. Now you should see a message that says **Bot is running...**

* Open your newly created bot in telegram and tap/click on ***/start*** as shown in the image below.
* You should get a response from the bot asking you what it can help you with. Ask away!

## Author

👤 **Bello Morenikeji Fuad**

- GitHub: [@Moreneecoder](https://github.com/Moreneecoder)
- Twitter - [@mo_bello19](https://twitter.com/mo_bello19)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Moreneecoder/adhkar_ai/issues).

## Show your support

Give a ⭐️ if you like this project!

This project is [MIT](./LICENSE) licensed.

https://github.com/Moreneecoder/adhkar_ai/blob/main/LICENSE
