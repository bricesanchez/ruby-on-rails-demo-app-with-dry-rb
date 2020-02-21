# frozen_string_literal: true

require 'dry/monads'
require 'dry/monads/do'

class BaseTransaction
  def self.inherited(klass)
    super

    klass.class_eval do
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)
    end
  end
end
