# frozen_string_literal: true

require 'dry-validation'

class BaseContract < Dry::Validation::Contract
  Dry::Validation.load_extensions(:monads)

  register_macro(:email_format) do
    unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      key.failure('not a valid email format')
    end
  end

  register_macro(:unique) do |macro:|
    attr_name = macro.args[0]

    unless record.class.where.not(id: record.id).where(attr_name => value).empty?
      key.failure("must be unique")
    end
  end
end
