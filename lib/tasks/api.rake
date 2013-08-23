require 'open-uri'

namespace :api do
  desc "Fetch Twitter API updates for all users"
  task twitter: :environment do
    # TODO write this logic
  end

  desc "Fetch Facebook API updates for all users"
  task facebook: :environment do
    User.find_each do |user|
      user.poll_facebook
    end
  end
end
