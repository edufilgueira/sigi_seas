# frozen_string_literal: true

class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for Usuario
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_usuario!
  before_action :authorized_user?
  before_action :load_defaults
  skip_before_action :verify_authenticity_token
  add_breadcrumb 'Sistemas', :root_path

  def current_user
    current_usuario
  end

  protected

  def load_defaults
    @navigation_partial = 'navigation'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name provider uid])
  end

  def authorized_user?
    if has_permission?
      true
    else
      if request.xhr?
        flash[:error] = "#{t('system.message.not_permission')} #{params[:controller]}##{params[:action]}."
        # respond_to do |format|
        #   format.js { render :template => "layouts/_render_messages" }
        # end
      else
        flash[:error] = "#{t('system.message.not_permission')} #{params[:controller]}##{params[:action]}."
        return false if current_usuario.blank?
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def has_permission?
    path = "#{params[:controller].split('/').last}|#{params[:action]}"
    admin = Permissao.permissao_do_admin
    permissoes = current_usuario&.permissao&.recursos
    if permissoes.blank?
      false
    else
      permissoes.include?(path) || permissoes.include?(admin)
    end
  end

  def remover_acentos(str)
    str = str.gsub(/[ÀÁÂÃÄÅĀĂĄ]/, 'A')
    str = str.gsub(/[àáâãäåāăą]/, 'a')
    str = str.gsub(/[ÇĆĈĊČ]/, 'C')
    str = str.gsub(/[çćĉċč]/, 'c')
    str = str.gsub(/[ÐĎ]/, 'D')
    str = str.gsub(/[ďđ]/, 'd')
    str = str.gsub(/[ÈÉÊËĒĔĖĘĚ]/, 'E')
    str = str.gsub(/[èéêëēĕėęě]/, 'e')
    str = str.gsub(/[ĝğġģ]/, 'g')
    str = str.gsub(/[ĜĞĠĢ]/, 'G')
    str = str.gsub(/[ĥħ]/, 'h')
    str = str.gsub(/[ĤĦ]/, 'H')
    str = str.gsub(/[ìíîïĩīĭįı]/, 'i')
    str = str.gsub(/[ÌÍÎÏĨĪĬĮİ]/, 'I')
    str = str.gsub(/[Ĵ]/, 'J')
    str = str.gsub(/[ĵ]/, 'j')
    str = str.gsub(/[Ķķ]/, 'K')
    str = str.gsub(/[ĸ]/, 'k')
    str = str.gsub(/[ĺļ]/, 'l')
    str = str.gsub(/[ĹĻĽľĿŀŁł]/, 'L')
    str = str.gsub(/[ñńņňŉŋ]/, 'n')
    str = str.gsub(/[ÑŃŅŇŊ]/, 'N')
    str = str.gsub(/[ÒÓÔÕÖØŌŎŐ]/, 'O')
    str = str.gsub(/[òóôõöøōŏő]/, 'o')
    str = str.gsub(/[ŕŗř]/, 'r')
    str = str.gsub(/[ŔŖŘ]/, 'B')
    str = str.gsub(/[śŝşš]/, 's')
    str = str.gsub(/[ŚŜŞŠ]/, 'S')
    str = str.gsub(/[ſ]/, 'f')
    str = str.gsub(/[ţťŧ]/, 't')
    str = str.gsub(/[ŢŤŦ]/, 'T')
    str = str.gsub(/[ùúûüũūŭůűų]/, 'u')
    str = str.gsub(/[ÙÚÛÜŨŪŬŮŰŲ]/, 'U')
    str = str.gsub(/[Ŵ]/, 'W')
    str = str.gsub(/[ŵ]/, 'w')
    str = str.gsub(/[ýÿŷ]/, 'y')
    str = str.gsub(/[ÝŶŸ]/, 'Y')
    str = str.gsub(/[źž]/, 'z')
    str = str.gsub(/[ŹŻŽ]/, 'Z')
  end
  
  def remover_caracteres_especiais(str)
    str = str.gsub(/^a-zA-Z0-9_/, '')
    str = str.gsub(/[(){}<>?,;:~^´`]/, '')
    str = str.gsub(/['"!@#$%¨&*+=§°º]/, '')
    str = str.gsub(/[ -]/, '_')
    str = str.gsub("[", '')
    str = str.gsub("]", '')
    str = str.gsub("__", '_')
    str = str.gsub("___", '_')
    str = str.gsub("____", '_')
    str = str.gsub("_____", '_')
  end

  private

  # modifica redirecionamento apos o logout do DEVISE.
  def after_sign_out_path_for(_resource_or_scope)
    '/'
  end
end
