require 'jumpstart_auth'
require 'klout'


class TinyBlog
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
    Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
  end
  
  def tweet(message)
    if message.length <= 140
      @client.update(message)
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
  
  def klout_score
    friends = @client.friends.collect { |f| f.screen_name }
    friends.each do |friend|
      identity = Klout::Identity.find_by_screen_name(friend)
      user = Klout::User.new(identity.id)
      score = user.score.score
      puts "#{friend} has #{score}"
      puts ""
    end
  end

end


blogger = TinyBlog.new
blogger.run
blogger.klout_score

