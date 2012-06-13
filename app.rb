require 'sinatra'
require 'rubygems'
require 'httparty'
require 'twiliolib'

class Translate
    include HTTParty
    base_uri "https://www.googleapis.com/language/translate"
     def post(incoming)
        self.class.get("/v2?key=PUT KEY HERE&source=en&target=es&q=#{incoming}")
      end
end




get '/' do
  
  @output = Twilio::Response.new  
  incoming = params[:Body].nil? ?  " Nothing" : params[:Body].to_s
  
  #get the response
   @translation = Translate.new
   @translated = @translation.post('')
  
    @sms = Twilio::Sms.new(@translated.)
  else
    @sms= Twilio::Sms.new("You said:#{incoming}")
  end
  
  # Add the new SMS message to the response
  @output.append(@sms)
  
  # Output the SMS message
  content_type "text/xml"
  @output.respond

end