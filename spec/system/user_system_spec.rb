# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User management', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'creates a user' do
    visit new_user_path

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'name@domain.tld'
    click_button 'Create User'

    expect(page).to have_text('User was successfully created.')
  end
end
