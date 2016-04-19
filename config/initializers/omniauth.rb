Rails.application.config.middleware.use OmniAuth::Builder do
  # allow the mock developer strategy to be used in the Rails dev environment
  if Rails.env.development?
    provider :developer, { :fields => [:id, :name, :email], :uid_field => :id }
  end

  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
    {
      name: "google",
    }
end
