Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1945328642359094', '57978f604cd205a711a2630d617e4f59'
end