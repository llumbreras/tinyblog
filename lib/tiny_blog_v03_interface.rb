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
  
  def run
    puts "Welcome to TinyBlog Twitter client!"
    puts "Enter 't <message>' to tweet or 'q' to quit."
    command = ""
    while command != "q"
      puts ""
      printf "Please enter your command: "
      input = gets.chomp
      parts = input.split
      command = parts[0]
      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(parts[1..-1].join(" "))
        else
          puts "Sorry, I do not recognize that command."
      end
    end
  end

end


blogger = TinyBlog.new
blogger.tweet("TinyBlog Initialized")
blogger.run

