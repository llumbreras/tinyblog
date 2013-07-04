require 'jumpstart_auth'

class TinyBlog
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    @client.update(messge)
  end

end

blogger = TinyBlog.new
blogger.tweet("TinyBlog Initialized")


