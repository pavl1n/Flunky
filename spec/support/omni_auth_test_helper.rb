module OmniAuthTestHelper
  def valid_google_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: "google_oauth2",
        uid: "12345678910",
        info: {
            email: "fakeemail@gmail-fake.com",
            first_name: "David",
            last_name: "McDonald"
        },
        credentials: {
            token: "abcdefgh12345",
            refresh_token: "12345abcdefgh",
            expires_at: DateTime.now
        }
      })
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(Faker::Omniauth.twitter)
    end
  end
end
