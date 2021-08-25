# frozen_string_literal: true

class HomeController < SocioedukApplicationController
  add_breadcrumb "Sistemas", :sistemas_path, only: :sistemas

  def sistemas
    pessoa = Pessoa.where(usuario_id: current_usuario.id).first
    if pessoa.tipo_pessoa_id == 2
      redirect_to socioeduk_url, notice: t("messages.atualizado_sucesso")
    else
      render layout: "clean"
    end
  end

  def sistemas_socioeduk
    render layout: "clean"
  end

  def tela_inicial_socioeduk; end
end
