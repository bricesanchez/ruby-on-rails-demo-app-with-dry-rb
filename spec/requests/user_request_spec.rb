# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User management', type: :request do

  it "creates a User and redirects to the User's index page" do
    get new_user_path
    expect(response).to render_template(:new)

    post users_path, params: {
      user: {
        first_name: 'John',
        last_name: 'Doe',
        email: 'name@domain.tld'
      }
    }

    expect(response).to redirect_to(assigns(:user))
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('User was successfully created.')
  end
end
