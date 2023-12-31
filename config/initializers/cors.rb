Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'https://vindhyatimes.netlify.app'
      resource '/homes',
        :headers => :any,
        :methods => [:post]
      resource '/users',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end