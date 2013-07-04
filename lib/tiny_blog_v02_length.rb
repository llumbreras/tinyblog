require 'jumpstart_auth'

class TinyBlog
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(messge)
    else
      puts "Message to long to tweet!"
    end
  end

end

blogger = TinyBlog.new
blogger.tweet("TinyBlog Initialized")


