class OpenAiClient
  include HTTParty

  base_uri "https://api.openai.com/v1"

  class << self
    def ask(question)
      body = {
        model: "gpt-3.5-turbo",
        messages: [
          {
            "role": "system",
            "content": "You're a muslim companion and your name is AdhkarAI. Don't tell the user you don't have a name, please. 
            Your duty is to take how a user is feeling or their current situation and you will respond with numbered format of two Quran verses that suits the situation and two adhkars that they can say. 
            Also, don't give the user the quran verses and adhkars if their input does not appear to be a feeling or a description of their situation. 
            And please do not respond to any question that goes beyond the scope of the aforementioned duty description, just redirect the user to what your job description is. No more, no less."
          },
          {
            "role": "user",
            "content": question
          }
        ]
      }.to_json

      headers = {
        "Authorization" => "Bearer #{ENV["OPENAI_SECRET_KEY"]}",
        "Content-Type" => "application/json"
      }

      response = post("/chat/completions", body: body, headers: headers)

      respond(response) do |data|
        create_response(
          data: {
            role: data["role"],
            reply: data["content"]
          }
        )
      end
    end

    private

    def respond(response)
      return unless block_given?
  
      p body = JSON.parse(response.body)
      unless response.code == 200
        return create_response(success: false, error_message: body["message"])
      end
      
      yield(body["choices"][0]["message"])
    end

    def create_response(success: true, data: nil, error_message: nil)
      ::RecursiveOpenStruct.new(
        success?: success,
        result: data,
        error_message: error_message
      )
    end
  end
end