require 'json'

class Socioeduk::ConfiguracoesController < SocioedukApplicationController
  #require 'util'

  #def show; end

  def buscar_por_id_configuracao_email
    @configuracao_email = Socioeduk::ConfiguracaoEmail.find(params[:configuracao_email_id])
    @configuracao_email = JSON.generate({ body: @configuracao_email.body })
  end

  def configuracao_emails
    @configuracao_emails = Socioeduk::ConfiguracaoEmail.all.order(:socioeduk_tipo_acao_configuracao_email_id, :socioeduk_tipo_filtro_configuracao_email_id, :descricao)

    #Editar o body "Corpo do Email"
    if !params[:id].nil?
      configuracao_email = Socioeduk::ConfiguracaoEmail.find(params[:id])
      @id = configuracao_email.id
      @acao = configuracao_email.socioeduk_tipo_acao_configuracao_email_id
      @filtro = configuracao_email.socioeduk_tipo_filtro_configuracao_email_id
      @descricao = configuracao_email.descricao
      @valor_descricao = configuracao_email.valor_descricao
      @valor = configuracao_email.valor
      @body = configuracao_email.body
      @tipo_filtro_configuracao_email = Socioeduk::TipoFiltroConfiguracaoEmail.find(@filtro)
    end
    
    if params[:commit] == 'salvar'
      # VALIDAR CAMPOS CASO O VALIDADOR DO HTML FALHE
      if params[:frm][:acao].blank? or params[:frm][:filtro].blank? or params[:frm][:descricao].blank? or params[:frm][:valor].blank?
        @acao = params[:frm][:acao]
        @filtro = params[:frm][:filtro]
        @descricao = params[:frm][:descricao]
        @valor = params[:frm][:valor]
        @valor_descricao = params[:frm][:valor_descricao]
        @body = params[:frm][:body]
        redirect_to socioeduk_configuracoes_configuracao_emails_url(msg: 'Todos os campos devem ser preenchidos'), notice: 'Todos os campos devem ser preenchidos'
      end

      # VERIFICA SE É NOVO REGISTRO
      if params[:frm][:id].blank?
        configuracao_email = Socioeduk::ConfiguracaoEmail.new
      elsif
        configuracao_email = Socioeduk::ConfiguracaoEmail.find(params[:frm][:id])
      end

      #REALIZA O SALVAMENTO
      configuracao_email.socioeduk_tipo_acao_configuracao_email_id = params[:frm][:acao]
      configuracao_email.socioeduk_tipo_filtro_configuracao_email_id = params[:frm][:filtro]
      configuracao_email.descricao = params[:frm][:descricao]
      if !params[:frm][:valor].nil?
        configuracao_email.valor = params[:frm][:valor]
      end
      if !params[:frm][:valor_descricao].nil?
        configuracao_email.valor_descricao = params[:frm][:valor_descricao]
      end
      if !params[:frm][:body].nil?
        configuracao_email.body = params[:frm][:body]
      end

      configuracao_email.save
      #redirect_to socioeduk_configuracoes_configuracao_emails_url(notice: 'Configuração salva com sucesso'), notice: 'Configuração salva com sucesso'
      
    end
  end

  def configuracao_email_salvar_body
    raise params.inspect
  end

  def configuracao_email_pessoas
    @id = params[:id]
    @configurar_email_nested = Socioeduk::ConfiguracaoEmail.new
    #@configurar_email_nested.configuracao_email_pessoas.build
    #@configurar_email_nested.configuracao_email_funcoes.build
  end

  def configuracao_email_salvar
    params_salvar_email_pessoas = params.require(:socioeduk_configuracao_email).permit(:id, 
    configuracao_email_pessoas_attributes: %i[identificacao email id _destroy],
    configuracao_email_funcoes_attributes: %i[socioeduk_configuracao_email_id funcao_id id _destroy],
    configuracao_email_areas_attributes: %i[socioeduk_configuracao_email_id area_id id _destroy] )
    @configurar_email_nested = Socioeduk::ConfiguracaoEmail.find(params[:socioeduk_configuracao_email][:id])
    
    if @configurar_email_nested.update(params_salvar_email_pessoas)
      #@configurar_email.usuario_update_id = current_usuario.id
      #@socioeduk_jovem.save
      #incluir_nova_vaga_unidade_recepcao(socioeduk_jovem_params[:jovem_recepcoes_attributes])
      redirect_to socioeduk_configuracoes_configuracao_emails_url(notice: 'Configuração realizada com sucesso'), notice: 'Configuração realizada com sucesso'
    else
      redirect_to socioeduk_configuracoes_configuracao_emails_url
    end
  end

  def configuracao_email_destroy
    @configuracao_emails_nested = Socioeduk::ConfiguracaoEmail.find(params[:id])
    @configuracao_emails_nested.destroy
    redirect_to socioeduk_configuracoes_configuracao_emails_url(msg: 'Configuração deletada'), notice: 'Configuração deletada com sucesso'
  end

  def configuracao_email_area_destroy
    configuracao_email_area = Socioeduk::ConfiguracaoEmailArea.find(params[:id])
    area = configuracao_email_area.area.nome
    configuracao_email_area.destroy
    redirect_to socioeduk_configuracoes_configuracao_emails_url(msg: 'A Área '+area+' foi removida da lista de emails'), notice: 'Área removida com sucesso'
  end

  def configuracao_email_funcao_destroy
    configuracao_email_funcao = Socioeduk::ConfiguracaoEmailFuncao.find(params[:id])
    funcao = configuracao_email_funcao.funcao.nome
    configuracao_email_funcao.destroy
    redirect_to socioeduk_configuracoes_configuracao_emails_url(msg: 'A função '+funcao+' foi removida da lista de emails'), notice: 'Função removida com sucesso'
  end

  def configuracao_email_pessoa_destroy
    configuracao_email_pessoa = Socioeduk::ConfiguracaoEmailPessoa.find(params[:id])
    email = configuracao_email_pessoa.email
    configuracao_email_pessoa.destroy
    redirect_to socioeduk_configuracoes_configuracao_emails_url(msg: 'O e-mail '+email+' foi removida da lista'), notice: 'Email removido com sucesso'
  end

  def configuracao_email_filtro_por_acao
    @filtro = Socioeduk::TipoFiltroConfiguracaoEmail.where(socioeduk_tipo_acao_configuracao_email_id: params[:frm][:acao])
  end

  private

  def socioeduk_gestao_vaga_params
    params.require(:socioeduk_gestao_vaga).permit(:id, :recepcao_id, :socioeduk_jovem_recepcao_id, :de_unidade_socioeducativa_id, :para_unidade_socioeducativa_id, :status, :data_movimentacao, :motivo_transferencia)
  end

end
