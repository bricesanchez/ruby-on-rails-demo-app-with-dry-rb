# frozen_string_literal: true

module Users
  class CreateUserListener
    def on_users_created(event)
      puts "EVENT #{event.id}"
      puts "USER #{event[:user].inspect}"
    end
  end
end
