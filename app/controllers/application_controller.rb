class ApplicationController < ActionController::Base
  before_action :load_application_events

  private

  def load_application_events
    @application_events = ApplicationEvents.new
  end

  attr_reader :application_events
end
