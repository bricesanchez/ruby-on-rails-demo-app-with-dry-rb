# frozen_string_literal: true

module Users
  class CreateUser < ::BaseTransaction
    def call(params)
      values = yield validate(params)
      user = yield persist(values)

      Success(user)
    end

    def validate(params)
      CreateUserContract.new(record: User.new).call(params).to_monad
    end

    def persist(result)
      Success(User.create!(result.values))
    rescue ::Exception => e
      Failure(e.message)
    end
  end
end
