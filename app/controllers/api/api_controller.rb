class Api::ApiController < ActionController::Base
  acts_as_token_authentication_handler_for Usuario
  before_action :require_authentication!
  
  private
  def require_authentication!
    throw(:warden, scope: :user) unless current_usuario.presence
  end
end
  # include ActionController::ImplicitRender
  # respond_to :json
  # protect_from_forgery with: :null_session
  # before_action :destroy_session

  # private
  # def destroy_session
  #   request.session_options[:skip] = true
  # end
# end

# module Api
#   class ApiController < ApplicationController
#     acts_as_token_authentication_handler_for Usuario
#     before_action :require_authentication!
    
#     private
#     def require_authentication!
#       throw(:warden, scope: :user) unless current_usuario.presence
#     end
#   end
# end