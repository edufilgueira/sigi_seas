module Api
  class LoginController < Api::ApiSessionsController
    def logar

      usuario = Usuario.where(email: params[:email]).first

      if(usuario&.valid_password?(params[:password]))
        render json: usuario.as_json(only: [:email, :authentication_token]), status: :created
      else
        head(:unauthorized)
      end
    end
  end
end