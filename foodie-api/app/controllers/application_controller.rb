class ApplicationController < ActionController::API

  include ActionController::Serialization

  # before_action :allow_cross_origin_requests





  # protected

  # def allow_cross_origin_requests
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Request-Method'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS, PATCH, HEAD'
  #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, X-Authorization-Token, X-Authorization-Email'
  #   headers['Access-Control-Max-Age'] = '1728000'
  # end

end
