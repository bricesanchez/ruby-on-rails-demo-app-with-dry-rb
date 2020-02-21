# frozen_string_literal: true

module Users
  class CreateUserContract < ::BaseContract
    option :record

    params do
      optional(:first_name).maybe(:string)
      optional(:last_name).maybe(:string)
      required(:email).filled(:string)
    end

    rule(:email).validate(:email_format)
    rule(:email).validate(unique: :email)
  end
end
