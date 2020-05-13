Rails.application.config.middleware.use OmniAuth::Builder do
    provider :linkedin, "78t4z7gdda4jg7","v7DcZoncnfbMD33B"
    provider :facebook, "173876397275493", "47ed56d7dff4948bfb2fb7a7d5280fa8"
    provider :google_oauth2, '614261573214-si44jms4qfirr9gp87mo32p6bdd38qfh.apps.googleusercontent.com', 'fdy7nH32FdTV20iI_mSxbVuS'
  end