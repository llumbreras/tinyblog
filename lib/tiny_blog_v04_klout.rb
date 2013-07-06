require 'klout'

Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'

identity = Klout::Identity.find_by_screen_name('thinkercode')
user = Klout::User.new(identity.id)
user.score.score
