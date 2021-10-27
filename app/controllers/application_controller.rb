class ApplicationController < ActionController::Base
   before_action :set_headers

  def set_headers
    response.headers['Content-Type'] = 'application/json'
  end

end
