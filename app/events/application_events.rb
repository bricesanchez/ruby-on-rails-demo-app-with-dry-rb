# frozen_string_literal: true

require 'dry/events/publisher'

class ApplicationEvents
  include Dry::Events::Publisher[:main_app]

  register_event('users.created')
end
