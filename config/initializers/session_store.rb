if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_neighbour-aid', domain: 'tbd'
else
    Rails.application.config.session_store :cookie_store, key: '_neighbour-aid'
end