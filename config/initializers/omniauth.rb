Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1945328642359094', '57978f604cd205a711a2630d617e4f59'
  provider :twitter, 'vfGJDpnWxgdqHtEXx8AGLd0Zj', 'PNa5o1eFywwPUS6PYPTjVhJ9kW0cvGdaGJ5J5408IHGjvEu2rJ'
end