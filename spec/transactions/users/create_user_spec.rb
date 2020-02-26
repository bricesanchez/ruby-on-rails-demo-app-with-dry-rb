require 'rails_helper'

RSpec.describe Users::CreateUser do
  subject { ::Users::CreateUser }

  let(:result) { subject.new.call(input) }

  context 'with valid input' do
    let(:input) do
      {
        first_name: 'John',
        last_name: 'Doe',
        email: 'name@domain.tld'
      }
    end

    it 'creates a user' do
      expect(result).to be_success
      expect(result.success).to eq(User.find(result.value!.id))
    end
  end

  context 'with invalid input' do
    let(:input) do
      {
        first_name: 'John',
        last_name: 'Doe'
      }
    end

    it 'does not create a user' do
      expect(result).to be_failure
      expect(result.failure.errors[:email]).to include('is missing')
    end
  end
end
