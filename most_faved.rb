# -*- coding: utf-8 -*-

Plugin.create :most_faved do
  tab :most_faved, "Most" do
    timeline :most_faved do
      order do |message|
        message.favorited_by.size end
    end
  end

  on_favorite do |service, user, message|
    if message.from_me?
      timeline(:most_faved) << message end
  end

  on_most_faved_add do |messages|
    timeline(:most_faved) << messages
  end
end
