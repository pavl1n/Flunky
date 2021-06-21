require 'spec_helper'

include OmniAuthTestHelper

describe "GET '/auth/google_oauth2/callback'" do

  before(:each) do
    valid_google_login_setup
    get 'http://localhost:3000/users/auth/google_oauth2/callback'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    session[:user] = User.last
  end

  it 'should set user_id' do
    expect(session[:user].id).to eq(User.last.id)
  end

  it 'should redirect to next info' do
    expect(response).to redirect_to "http://localhost:3000/user/#{session[:user].id}/edit_phone_number?locale=be"
  end
end

describe "GET '/auth/twitter/callback'" do

  before(:each) do
    valid_google_login_setup
    get 'http://localhost:3000/users/auth/twitter/callback'
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    session[:user] = User.last
  end

  it 'should set user_id' do
    expect(session[:user].id).to eq(User.last.id)
  end

  it 'should redirect to next info' do
    expect(response).to redirect_to "http://localhost:3000/user/#{session[:user].id}/edit_phone_number?locale=be"
  end
end
