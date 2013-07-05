require 'jumpstart_auth'

class TinyBlog
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Message to long to tweet!"
    end
  end

end

blogger = TinyBlog.new
blogger.tweet("TinyBlog Initialized. This is a test tweet to validate length of the message. It should not exceed the 140 characters maximum. This message will not be posted..")


