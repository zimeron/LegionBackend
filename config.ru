# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

use Rack::Cors do
    allow do
      origins 'elderscrollslegion.herokuapp.com/*'
  
      resource '*',
          methods: [:get, :post, :delete, :put, :patch, :options, :head],
          headers: any,
          expose: ['Access-Control-Allow-Origin'],
          max_age: 600
          # headers to expose
    end
  
  end

run Rails.application
