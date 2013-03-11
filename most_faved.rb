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

  on_message_modified do |message|
    timeline(:most_faved) << message if message.from_me? and not message.favorited_by.empty?
  end
end
