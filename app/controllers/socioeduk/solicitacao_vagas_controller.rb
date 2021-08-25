# frozen_string_literal: true

class Socioeduk::SolicitacaoVagasController < SocioedukApplicationController
  before_action :set_socioeduk_solicitacao_vaga, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_solicitacao_vaga').pluralize, :socioeduk_solicitacao_vagas_path
  add_breadcrumb 'Detalhe', :socioeduk_solicitacao_vaga_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_solicitacao_vaga_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_solicitacao_vaga_path, only: %i[edit update]

  respond_to :html
  def index
    # VERIFICA SE TEM PESSOA juiz_id CADASTRADO. SE EXITIR CAPTURA O ID DO USUARAIO DA PESSOA juiz_id
    pessoa = PessoaJuiz.where(usuario_id: current_usuario.id).first
    if(!pessoa.juiz_id.nil?)
      pessoa_juiz = PessoaJuiz.find(pessoa.juiz_id);
      usuario_juiz = Usuario.find(pessoa_juiz.usuario_id)
      @socioeduk_solicitacao_vagas = Socioeduk::SolicitacaoVaga.order(created_at: :desc).where(usuario_id: [current_usuario.id,usuario_juiz.id])
    else
      listar_apoio = PessoaJuiz.select(:juiz_id, :usuario_id).where(juiz_id: pessoa.id)
      ids = []
      listar_apoio.each do | pessoa_juiz |
        ids.push(pessoa_juiz.usuario_id)
      end
      ids.push(current_usuario.id)
      @socioeduk_solicitacao_vagas = Socioeduk::SolicitacaoVaga.order(created_at: :desc).where(usuario_id: ids)
    end
  end

  def show; end

  def new
    @socioeduk_solicitacao_vaga = Socioeduk::SolicitacaoVaga.new
    # @socioeduk_solicitacao_vaga.socioeduk_solicitacao_vaga_infracoes.build
  end

  def edit; end

  def create
    @socioeduk_solicitacao_vaga = Socioeduk::SolicitacaoVaga.new(socioeduk_solicitacao_vaga_params)
    doc_unico_array = params[:socioeduk_solicitacao_vaga][:doc_unico_array]
    doc_unico_array.delete('')
    @socioeduk_solicitacao_vaga.doc_unico_array = doc_unico_array

    respond_to do |format|
      @socioeduk_solicitacao_vaga.usuario_id = current_usuario.id
      if @socioeduk_solicitacao_vaga.save
        format.html { redirect_to edit_socioeduk_solicitacao_vaga_url(@socioeduk_solicitacao_vaga.id, notice: 'create'), notice: I18n.t("messages.cadastro_sucesso") }
        #format.html { redirect_to socioeduk_solicitacao_vagas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_solicitacao_vaga }
        puts @socioeduk_solicitacao_vaga
      else
        format.html { render :new }
        format.json { render json: @socioeduk_solicitacao_vaga.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_solicitacao_vaga.update(socioeduk_solicitacao_vaga_params)
      doc_unico_array = params[:socioeduk_solicitacao_vaga][:doc_unico_array]
      doc_unico_array.delete('')
      @socioeduk_solicitacao_vaga.doc_unico_array = doc_unico_array

      #redirect_to socioeduk_solicitacao_vagas_url, notice: t('messages.atualizado_sucesso')
      redirect_to edit_socioeduk_solicitacao_vaga_url(@socioeduk_solicitacao_vaga.id, notice: 'update'), notice: I18n.t("messages.atualizado_sucesso")
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_solicitacao_vaga.destroy
        format.html { redirect_to socioeduk_solicitacao_vagas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        if @socioeduk_solicitacao_vaga.errors.present?
          flash[:error] = @socioeduk_solicitacao_vaga.errors.full_messages[0]
        end
        format.html { redirect_to :back }
      end
    end
  end

  def autorizar_solicitacao_vaga
    # Remove os acentos e caracteres especiais do nome do arquivo em anexo
    if !params[:frm][:resposta_arquivo_processo].nil?
      valor = remover_acentos(params[:frm][:resposta_arquivo_processo].original_filename)
      valor = remover_caracteres_especiais(valor)
      params[:frm][:resposta_arquivo_processo].original_filename = valor
    end
    if !params[:frm][:resposta_arquivo_processo2].nil?
      valor = remover_acentos(params[:frm][:resposta_arquivo_processo2].original_filename)
      valor = remover_caracteres_especiais(valor)
      params[:frm][:resposta_arquivo_processo2].original_filename = valor
    end
    if !params[:frm][:resposta_arquivo_processo3].nil?
      valor = remover_acentos(params[:frm][:resposta_arquivo_processo3].original_filename)
      valor = remover_caracteres_especiais(valor)
      params[:frm][:resposta_arquivo_processo3].original_filename = valor
    end
    if !params[:frm][:resposta_arquivo_processo4].nil?
      valor = remover_acentos(params[:frm][:resposta_arquivo_processo4].original_filename)
      valor = remover_caracteres_especiais(valor)
      params[:frm][:resposta_arquivo_processo4].original_filename = valor
    end
    
    @solicitacao_vaga = Socioeduk::SolicitacaoVaga.find(params[:frm][:id])
    
    if @solicitacao_vaga.update_attributes(status: 'autorizada', respondido_por: current_usuario.id, data_resposta: Time.now, resposta_arquivo_processo: params[:frm][:resposta_arquivo_processo], resposta_arquivo_processo2: params[:frm][:resposta_arquivo_processo2], resposta_arquivo_processo3: params[:frm][:resposta_arquivo_processo3], resposta_arquivo_processo4: params[:frm][:resposta_arquivo_processo4], documento_alterado: false)
      anexos = []
      #Verifica se existe anexo pelo campo "resposta_arquivo_processo_file_name" do banco
      if(@solicitacao_vaga.resposta_arquivo_processo_file_name)
        anexos.push("public"+@solicitacao_vaga.resposta_arquivo_processo.url(:original, true))
      end
      if(@solicitacao_vaga.resposta_arquivo_processo2_file_name)
        anexos.push("public"+@solicitacao_vaga.resposta_arquivo_processo2.url(:original, true))
      end
      if(@solicitacao_vaga.resposta_arquivo_processo3_file_name)
        anexos.push("public"+@solicitacao_vaga.resposta_arquivo_processo3.url(:original, true))
      end
      if(@solicitacao_vaga.resposta_arquivo_processo4_file_name)
        anexos.push("public"+@solicitacao_vaga.resposta_arquivo_processo4.url(:original, true))
      end

      if(anexos.length == 0)
        Socioeduk::ConfiguracaoEmail.enviar_email_ao_autorizar_vaga(@solicitacao_vaga, params[:configuracao_email_id], params[:email_text], params[:frm][:nome_juiz])
      else
        Socioeduk::ConfiguracaoEmail.enviar_email_ao_autorizar_vaga(@solicitacao_vaga, params[:configuracao_email_id], params[:email_text], params[:frm][:nome_juiz], anexos)
      end
    end

    redirect_to controller: :gestao_vagas, action: :acompanhar_solicitacao_vagas
  end

  def aguardar_solicitacao_vaga
    @solicitacao_vaga = Socioeduk::SolicitacaoVaga.find(params[:frm][:id])
    #@solicitacao_vaga_id = params[:id]
    unless params[:frm].nil?
      Socioeduk::SolicitacaoVaga.find(params[:frm][:id]).update_attributes(status: 'aguardando', respondido_por: current_usuario.id, data_resposta: Time.now, motivo_negacao: params[:frm][:motivo_negacao], documento_alterado: false)
      Socioeduk::ConfiguracaoEmail.enviar_email_ao_negar_vaga(@solicitacao_vaga, params[:configuracao_email_id], params[:email_text], params[:frm][:nome_juiz])
    end
    redirect_to controller: :gestao_vagas, action: :acompanhar_solicitacao_vagas
  end

  def autorizar_vaga
    @solicitacao_vaga = Socioeduk::SolicitacaoVaga.find(params[:id])
    @configuracao_emails = Socioeduk::ConfiguracaoEmail.where(socioeduk_tipo_filtro_configuracao_email_id: 3)
    @pessoa = Pessoa.where(usuario_id: @solicitacao_vaga.usuario_id)[0]

    if(!@pessoa.juiz_id.nil?)
      pessoa_juiz = PessoaJuiz.find(@pessoa.juiz_id);
      usuario_juiz = Usuario.find(pessoa_juiz.usuario_id)
      @socioeduk_solicitacao_vagas = Socioeduk::SolicitacaoVaga.order(created_at: :desc).where(usuario_id: [current_usuario.id,usuario_juiz.id])
    else
      listar_apoio = PessoaJuiz.select(:juiz_id, :usuario_id).where(juiz_id: pessoa.id)
      ids = []
      listar_apoio.each do | pessoa_juiz |
        ids.push(pessoa_juiz.usuario_id)
      end
      ids.push(current_usuario.id)
      @socioeduk_solicitacao_vagas = Socioeduk::SolicitacaoVaga.order(created_at: :desc).where(usuario_id: ids)
    end

    @usuario = Usuario.find(@solicitacao_vaga.usuario_id)
  end

  def negar_vaga
    @solicitacao_vaga = Socioeduk::SolicitacaoVaga.find(params[:id])
    @configuracao_emails = Socioeduk::ConfiguracaoEmail.where(socioeduk_tipo_filtro_configuracao_email_id: 4)
    @pessoa = Pessoa.where(usuario_id: @solicitacao_vaga.usuario_id)[0]
    @usuario = Usuario.find(@solicitacao_vaga.usuario_id)
  end

  def informar_dados_ausente
    @solicitacao_vaga_id = params[:id]
    unless params[:frm].nil?
      Socioeduk::SolicitacaoVaga.find(params[:frm][:id]).update_attributes(status: 'pendente', respondido_por: current_usuario.id, data_resposta: Time.now, observacao: params[:frm][:observacao])

      redirect_to controller: :gestao_vagas, action: :acompanhar_solicitacao_vagas
    end
  end

  # Este método apresenta a visão do juiz
  def administracao_solicitante
    @capacidade_base_regiao = 0
    @capacidade_base_regiao_masculino = 0
    @capacidade_base_regiao_feminino = 0
    @capacidade_base_regiao_internacao_provisoria = 0
    @capacidade_base_regiao_internacao = 0
    @capacidade_base_regiao_semiliberdade = 0
    @capacidade_base_regiao_internacao_provisoria_masculino = 0
    @capacidade_base_regiao_internacao_masculino = 0
    @capacidade_base_regiao_semiliberdade_masculino = 0
    @capacidade_base_regiao_internacao_provisoria_feminino = 0
    @capacidade_base_regiao_internacao_feminino = 0
    @capacidade_base_regiao_semiliberdade_feminino = 0
    @capacidade_base_regiao_19_percentual = 0
    @total_jovens_admitidos = 0
    @total_jovens_admitidos_masculino = 0
    @total_jovens_admitidos_feminino = 0
    @total_jovens_admitidos_internacao_provisoria = 0
    @total_jovens_admitidos_internacao = 0
    @total_jovens_admitidos_semiliberdade = 0
    @total_jovens_admitidos_internacao_provisoria_masculino = 0
    @total_jovens_admitidos_internacao_masculino = 0
    @total_jovens_admitidos_semiliberdade_masculino = 0
    @total_jovens_admitidos_internacao_provisoria_feminino = 0
    @total_jovens_admitidos_internacao_feminino = 0
    @total_jovens_admitidos_semiliberdade_feminino = 0
    @jovens_cumprindo_medida = []
    lista = []

    resumo_capacidades_unidades = UnidadeSocioeducativa.resumo_capacidades_unidades

    # Carregar a cidade do juíz
    regiao_juiz = current_usuario.pessoa.cidade_id
    # Verifica se a recursividade esta vazia.
    cidade = Cidade.find(regiao_juiz)
    cidade_id = if cidade.regiao_pai.nil?
                  cidade.id
                else
                  cidade.regiao_pai
                end

    unidades_regiao_juiz = UnidadeSocioeducativa.where(cidade_id: cidade_id)

    unidades_regiao_juiz.each do |unidade|
      @capacidade_base_regiao += unidade.capacidade_vagas_base
      @capacidade_base_regiao_19_percentual += unidade.capacidade_vagas_base_19_percentual
      @total_jovens_admitidos += unidade.quantidade_jovens_unidade
      @jovens_cumprindo_medida.push(Socioeduk::Processo.relatorio_vagas("and us.id = #{unidade.id}"))
    end

    @jovens_aguardando_vaga = Socioeduk::SolicitacaoVaga.where(usuario_id: current_usuario.id)

    # capacidade base por sexo
    resumo_capacidades_unidades.where('unidade_socioeducativa_id in (?) and usb.deleted_at is null and ubd.deleted_at is null', unidades_regiao_juiz.pluck(:id)).group_by(&:sexo).each do |sexo, unidade|
      if sexo == 'Masculino'
        @capacidade_base_regiao_masculino = unidade.sum(&:capacidade_base)
        unidade.group_by(&:tipo_medida).each do |tipo_medida, unidade|
          if tipo_medida == 'INTERNAÇÃO PROVISÓRIA'
            @capacidade_base_regiao_internacao_provisoria_masculino = unidade.sum(&:capacidade_base)
          elsif tipo_medida == 'INTERNAÇÃO'
            @capacidade_base_regiao_internacao_masculino = unidade.sum(&:capacidade_base)
          elsif tipo_medida == 'SEMILIBERDADE'
            @capacidade_base_regiao_semiliberdade_masculino = unidade.sum(&:capacidade_base)
          end
        end
      else
        @capacidade_base_regiao_feminino = unidade.sum(&:capacidade_base)
        unidade.group_by(&:tipo_medida).each do |tipo_medida, unidade|
          if tipo_medida == 'INTERNAÇÃO PROVISÓRIA'
            @capacidade_base_regiao_internacao_provisoria_feminino = unidade.sum(&:capacidade_base)
          elsif tipo_medida == 'INTERNAÇÃO'
            @capacidade_base_regiao_internacao_feminino = unidade.sum(&:capacidade_base)
          elsif tipo_medida == 'SEMILIBERDADE'
            @capacidade_base_regiao_semiliberdade_feminino = unidade.sum(&:capacidade_base)
          end
        end
      end
    end

    # capacidade base por medida
    resumo_capacidades_unidades.where('unidade_socioeducativa_id in (?) and usb.deleted_at is null and ubd.deleted_at is null', unidades_regiao_juiz.pluck(:id)).group_by(&:tipo_medida).each do |tipo_medida, unidade|
      if tipo_medida == 'INTERNAÇÃO PROVISÓRIA'
        @capacidade_base_regiao_internacao_provisoria = unidade.sum(&:capacidade_base)
      elsif tipo_medida == 'INTERNAÇÃO'
        @capacidade_base_regiao_internacao = unidade.sum(&:capacidade_base)
      elsif tipo_medida == 'SEMILIBERDADE'
        @capacidade_base_regiao_semiliberdade = unidade.sum(&:capacidade_base)
      end
    end

    # ocupação por sexo
    @jovens_cumprindo_medida.flatten.group_by(&:sexo).each do |sexo, processo|
      if sexo == 'M'
        @total_jovens_admitidos_masculino = processo.length
        processo.group_by(&:ultima_medida_socioeducativa).each do |tipo_medida, processo|
          if tipo_medida == 'INTERNAÇÃO PROVISÓRIA' || tipo_medida == 'SANÇÃO'
            @total_jovens_admitidos_internacao_provisoria_masculino += processo.length
          elsif tipo_medida == 'INTERNAÇÃO'
            @total_jovens_admitidos_internacao_masculino = processo.length
          elsif tipo_medida == 'SEMILIBERDADE'
            @total_jovens_admitidos_semiliberdade_masculino = processo.length
          end
        end
      else
        @total_jovens_admitidos_feminino = processo.length
        processo.group_by(&:ultima_medida_socioeducativa).each do |tipo_medida, processo|
          if tipo_medida == 'INTERNAÇÃO PROVISÓRIA' || tipo_medida == 'SANÇÃO'
            @total_jovens_admitidos_internacao_provisoria_feminino += processo.length
          elsif tipo_medida == 'INTERNAÇÃO'
            @total_jovens_admitidos_internacao_feminino = processo.length
          elsif tipo_medida == 'SEMILIBERDADE'
            @total_jovens_admitidos_semiliberdade_feminino = processo.length
          end
        end
      end
    end

    # ocupação por medida
    @jovens_cumprindo_medida.flatten.group_by(&:ultima_medida_socioeducativa).each do |tipo_medida, processo|
      if tipo_medida == 'INTERNAÇÃO PROVISÓRIA' || tipo_medida == 'SANÇÃO'
        @total_jovens_admitidos_internacao_provisoria += processo.length
      elsif tipo_medida == 'INTERNAÇÃO'
        @total_jovens_admitidos_internacao = processo.length
      elsif tipo_medida == 'SEMILIBERDADE'
        @total_jovens_admitidos_semiliberdade = processo.length
      end
    end

    @jovens_cumprindo_medida.flatten.each do |jovem|
      hash = {}
      hash[:processo_id] = jovem.processo_id
      hash[:nome] = jovem&.nome_jovem
      hash[:sexo] = jovem&.sexo
      hash[:data_hora_apreensao] = jovem&.data_hora_apreensao
      hash[:medida_socioeducativa] = jovem&.ultima_medida_socioeducativa
      hash[:pontuacao] = Socioeduk::Processo.find(jovem.processo_id).pontuacao
      lista.push(hash)
    end
    @jovens_cumprindo_medida = lista.sort_by { |e| -e[:pontuacao] }
  end

  def cidades_por_estado
    @cidades = Cidade.where(estado_id: params[:socioeduk_solicitacao_vaga][:estado_id]).order('nome asc')
  end

  def bairros_por_cidade
    @bairros = Bairro.where(cidade_id: params[:cidade_id]).order(nome: :asc)
    @elemento_id = 'socioeduk_solicitacao_vaga_socioeduk_solicitacao_vaga_infracoes_attributes_' + params[:number_element_id] + '_bairro_id'
    # raise @elemento_id.inspect
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_solicitacao_vaga
    @socioeduk_solicitacao_vaga = Socioeduk::SolicitacaoVaga.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_solicitacao_vaga_params
    params.require(:socioeduk_solicitacao_vaga).permit(:nome, :sexo, :data_infracao, :periodo, :socioeduk_tipo_medida_socioeducativa_id, :pontuacao_certidao_positiva, :pontuacao_quantidade_certidao_positiva, :pontuacao_apreendido, :pontuacao_descumprimento_medida, :pontuacao_organizacao_criminosa, :status, :respondido_por, :data_resposta, :motivo_negacao, :doc_guia_cnj, :doc_pessoais, :doc_pedido_internacao_provisoria, :doc_certidao_antecedentes, :doc_decisao_interlocutoria, :doc_estudos_tecnicos, :doc_oficio_crv, :doc_historico_escolar, :doc_historico_saude, :doc_comprovante_envio_malote_digital, :data_apreensao, :logradouro, :numero_logradouro, :complemento, :bairro, :cep, :cidade_id, :cidade_comarca, :cidade_cumprimento_medida, { doc_unico_array: [] }, :doc_unico, :resposta_arquivo_processo, :resposta_arquivo_processo2, :resposta_arquivo_processo3, :resposta_arquivo_processo4, :nome_mae, :nome_pai, :socioeduk_tipo_endereco_id, :data_nascimento, :estado_id, :socioeduk_opcao_sexual_id, :uf_naturalidade_id, :cidade_naturalidade_id, :maior_idade, :documento_alterado,
                                                       socioeduk_solicitacao_vaga_infracoes_attributes: %i[solicitacao_vaga_id data_apreensao data_ato_infracional outra_infracao flagrante cidade_id bairro_id tipo_natureza artigo_infracao_id pontuacao_continuado estupro_vulneravel pontuacao_reinteracao pontuacao_quantidade_reinteracao id _destroy])
  end
end
