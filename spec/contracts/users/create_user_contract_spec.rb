# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CreateUserContract do
  subject { ::Users::CreateUserContract }

  let(:result) { subject.new(record: User.new).call(input) }

  context 'given valid parameters' do
    let(:input) do
      {
        first_name: 'John',
        last_name: 'Doe',
        email: 'name@domain.tld'
      }
    end

    it 'is valid' do
      expect(result).to be_success
    end
  end

  context 'given no email' do
    let(:input) do
      {
        last_name: 'Doe'
      }
    end

    it 'is invalid' do
      expect(result).to be_failure
      expect(result.errors[:email]).to include('is missing')
    end
  end

  context 'given malformed email' do
    let(:input) do
      {
        email: 'namedomain.tld'
      }
    end

    it 'is invalid' do
      expect(result).to be_failure
      expect(result.errors[:email]).to include('not a valid email format')
    end
  end

  context 'given already existed email' do
    before do
      User.create!(email: 'name@domain.tld')
    end

    let(:input) do
      {
        email: 'name@domain.tld'
      }
    end

    it 'is invalid' do
      expect(result).to be_failure
      expect(result.errors[:email]).to include('must be unique')
    end
  end
end
