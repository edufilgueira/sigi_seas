# encoding: utf-8
class Socioeduk::ProcessosController < SocioedukApplicationController
  before_action :set_socioeduk_processo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_processo").pluralize, :socioeduk_processos_path
  add_breadcrumb "Detalhe", :socioeduk_processo_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_processo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_processo_path, only: [:edit, :update]

  respond_to :html
  def index
    consulta = Socioeduk::Processo.joins(
      "left join socioeduk_jovem_recepcoes jr on jr.id = socioeduk_processos.socioeduk_jovem_recepcao_id
      left join socioeduk_jovens j on j.id = jr.socioeduk_jovem_id
      left join socioeduk_numero_processos np on np.socioeduk_processo_id = socioeduk_processos.id
      left join cidades c on c.id = socioeduk_processos.cidade_comarca
      left join socioeduk_status_processos sp on sp.id = socioeduk_processos.socioeduk_status_processo_id
      left join socioeduk_medida_socioeducativas ms ON ms.socioeduk_numero_processo_id = np.id
      left join socioeduk_situacao_cumprimentos sc ON sc.id = ms.socioeduk_situacao_cumprimento_id
      left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = ms.socioeduk_tipo_medida_socioeducativa_id"
    )
    .where("j.deleted_at IS NULL")
    .select("socioeduk_processos.id id, j.nome jovem, np.numero numero_processo, c.id cidade_id, c.nome municipio_comarca, sp.id status_processo_id, tms.descricao medida, sp.descricao status_processo, sc.descricao situacao_cumprimento")
    .order("j.nome").page(params[:page]).per(50)

    if params[:commit] == 'Buscar'
      case
      when !params[:numero_processo].blank?
        @socioeduk_processos = consulta.where("np.numero = ?", params[:numero_processo])
      when !params[:jovem].blank?
        @socioeduk_processos = consulta.where("j.nome ilike ?", "%#{params[:jovem]}%")
      when !params[:municipio_comarca_id].blank?
        @socioeduk_processos = consulta.where("c.id = ?", params[:municipio_comarca_id])
      when !params[:status_processo].blank?
        @socioeduk_processos = consulta.where("sp.id = ?", params[:status_processo])
      end
    else
      @socioeduk_processos = consulta
    end
  end

  def show
  end

  def new
    @socioeduk_processo = Socioeduk::Processo.new
    # @socioeduk_processo.socioeduk_processo_naturezas.build
    # @socioeduk_processo.socioeduk_processo_advogados.build
    # @socioeduk_processo.socioeduk_processo_envolvidos.build
  end

  def edit
    @id = params[:id]
    id_processo_recepcao = Socioeduk::Processo.find(@id).socioeduk_jovem_recepcao_id
    @lista_seletiva_jovem = Socioeduk::Jovem.jovens_recepcao_admitidos_no_processo(id_processo_recepcao)
  end
  
  def create
    @socioeduk_processo = Socioeduk::Processo.new(socioeduk_processo_params)
    # O processo nasce com 'status em andamento'
    @socioeduk_processo.socioeduk_status_processo_id = 1
    respond_to do |format|
      if @socioeduk_processo.save
        @socioeduk_processo.pontuacao_bkp = Socioeduk::Processo.find(@socioeduk_processo.id).pontuacao
        @socioeduk_processo.save
        format.html { redirect_to edit_socioeduk_processo_path(@socioeduk_processo.id, notice: 'create'), notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_processo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_processo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    if @socioeduk_processo.update(socioeduk_processo_params)
      @socioeduk_processo.pontuacao_bkp = Socioeduk::Processo.find(@socioeduk_processo.id).pontuacao
      @socioeduk_processo.save
      redirect_to  edit_socioeduk_processo_path(@socioeduk_processo.id, notice: 'update'), notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_processo.destroy
        format.html { redirect_to socioeduk_processos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_processo.errors.full_messages[0] if @socioeduk_processo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def adicionar_medida
    @nil_item = 'true'
    @id_processo = params[:id_processo]
    @socioeduk_medida_socioeducativa = Socioeduk::MedidaSocioeducativa.new
  end
  
  def editar_medida
    @socioeduk_medida_socioeducativa = Socioeduk::MedidaSocioeducativa.find(params[:id])
    @id_processo = @socioeduk_medida_socioeducativa.socioeduk_processo_id
  end
  
  def deletar_medida
    @socioeduk_medida_socioeducativa = Socioeduk::MedidaSocioeducativa.find(params[:id])
    @id_processo = @socioeduk_medida_socioeducativa.socioeduk_processo_id

    if @socioeduk_medida_socioeducativa.destroy
      redirect_to edit_socioeduk_processo_path(@id_processo), notice: I18n.t("messages.delecao_sucesso")
    end
  end

  def listar_paragrafos
    @artigo_paragrafos = Socioeduk::ArtigoParagrafo.where(socioeduk_artigo_infracao_id: params[:infracao_id])
    @index = params[:index]
  end

  def listar_incisos
    @artigo_incisos = Socioeduk::ArtigoInciso.where(socioeduk_artigo_paragrafo_id: params[:paragrafo_id])
  end

  def listar_alineas
    @artigo_alineas = Socioeduk::ArtigoAlinea.where(socioeduk_artigo_inciso_id: params[:inciso_id])
  end

  def buscar_data_infracao
    id = params[:socioeduk_processo][:socioeduk_jovem_recepcao_id]
    @data_infracao = Socioeduk::JovemRecepcoes.find(id)
  end

  def finalizar_processo
    # Desativar processo
    processo = Socioeduk::Processo.find(params[:id])
    if processo.save
      processo.socioeduk_status_processo_id = 3
      if processo.save
        # Desativar Recepção
        recepcao_id = processo.socioeduk_jovem_recepcao_id
        jovem_recepcao = Socioeduk::JovemRecepcao.find(recepcao_id)
        jovem_recepcao.status = false
        jovem_recepcao.save
        #Desativar Gestao Vagas
        gestao_vaga = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: recepcao_id, ativo: true).order('id desc').limit(1)[0]
        gestao_vaga.nil?
        gestao_vaga.ativo = false
        gestao_vaga.finalizado = true
        gestao_vaga.save
        # Envia os emails caso seja necessário
        Socioeduk::ConfiguracaoEmail.enviar_email_ao_finalizar_processo(processo)
        # Redirecionar para listagem do processo
        redirect_to socioeduk_processos_path, notice: t('messages.atualizado_sucesso')
      end
    else
      redirect_to edit_socioeduk_processo_path(params[:id], notice: 'comarca'), notice: "Dados imcompletos"
    end
  end

  def evadir_processo
    # Desativar processo
    processo = Socioeduk::Processo.find(params[:id])
    if processo.save
      processo.socioeduk_status_processo_id = 2
      if processo.save
        # Desativar Recepção
        recepcao_id = processo.socioeduk_jovem_recepcao_id
        jovem_recepcao = Socioeduk::JovemRecepcao.find(recepcao_id)
        jovem_recepcao.status = false
        jovem_recepcao.save
        #Desativar Gestao Vagas
        gestao_vaga = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: recepcao_id, ativo: true).order('id desc').limit(1)[0]
        gestao_vaga.ativo = false
        gestao_vaga.finalizado = true
        gestao_vaga.save
        # Redirecionar para listagem do processo
        redirect_to socioeduk_processos_path, notice: t('messages.atualizado_sucesso')
      end
    else
      redirect_to edit_socioeduk_processo_path(params[:id], notice: 'comarca'), notice: "Dados imcompletos"
    end
  end

  def fuga_processo
    # Desativar processo
    processo = Socioeduk::Processo.find(params[:id])
    if processo.save
      processo.socioeduk_status_processo_id = 4
      if processo.save
        # Desativar Recepção
        recepcao_id = processo.socioeduk_jovem_recepcao_id
        jovem_recepcao = Socioeduk::JovemRecepcao.find(recepcao_id)
        jovem_recepcao.status = false
        jovem_recepcao.save
        #Desativar Gestao Vagas
        gestao_vaga = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: recepcao_id, ativo: true).order('id desc').limit(1)[0]
        gestao_vaga.ativo = false
        gestao_vaga.finalizado = true
        gestao_vaga.save
        # Redirecionar para listagem do processo
        redirect_to socioeduk_processos_path, notice: t('messages.atualizado_sucesso')
      end
    else
      redirect_to edit_socioeduk_processo_path(params[:id], notice: 'comarca'), notice: "Dados imcompletos"
    end
  end

  def reverter_processo_finalizado
    # Desativar processo
    processo = Socioeduk::Processo.find(params[:id])
    if processo.save
      processo.socioeduk_status_processo_id = 1
      if processo.save
        # Desativar Recepção
        recepcao_id = processo.socioeduk_jovem_recepcao_id
        jovem_recepcao = Socioeduk::JovemRecepcao.find(recepcao_id)
        jovem_recepcao.status = true
        jovem_recepcao.save
        #Desativar Gestao Vagas
        gestao_vaga = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: recepcao_id, ativo: false, finalizado: true).order('id desc').limit(1)[0]
        gestao_vaga.ativo = true
        gestao_vaga.finalizado = false
        gestao_vaga.save
        # Redirecionar para listagem do processo
        redirect_to  edit_socioeduk_processo_path(processo.id), notice: t('messages.atualizado_sucesso')
      end
    else
      redirect_to edit_socioeduk_processo_path(params[:id], notice: 'comarca'), notice: "Dados imcompletos"
    end
  end

  def listar_conclusao
    #@conclusao_medida Socioeduk::Ocorrencia.all
    @conclusao_medida = Socioeduk::MedidaSocioeducativaMotivoConclusao.select('socioeduk_medida_socioeducativa_motivo_conclusoes.id, tcms.descricao')
    .joins('INNER JOIN socioeduk_tipo_conclusao_medida_socioeducativas tcms ON tcms.id = socioeduk_medida_socioeducativa_motivo_conclusoes.socioeduk_tipo_conclusao_medida_socioeducativa_id')
    .where(socioeduk_tipo_medida_socioeducativa_id: params[:socioeduk_medida_socioeducativa][:socioeduk_tipo_medida_socioeducativa_id])
    .order('tcms.descricao')
    #raise @conclusao_medida.inspect
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_processo
      @socioeduk_processo = Socioeduk::Processo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_processo_params
        params.require(:socioeduk_processo).permit(:id, :socioeduk_jovem_recepcao_id, :numero_processo, :socioeduk_tipo_processo_id, :data_representacao, :pontuacao_quantidade_certidao_positiva,
          :data_decisao, :numero_oficio, :data_oficio, :socioeduk_situacao_processo_id, :data_hora_infracao, :data_hora_apreensao, :pontuacao_certidao_positiva, :pontuacao_apreendido, :pontuacao_descumprimento_medida, :pontuacao_organizacao_criminosa, :cidade_cumprimento_medida, :cidade_comarca, :aguardando_vaga,
          socioeduk_processo_naturezas_attributes: %i[processo_id socioeduk_artigo_infracao_id socioeduk_artigo_paragrafo_id socioeduk_artigo_inciso_id socioeduk_artigo_alinea_id tipo_natureza pontuacao_reinteracao pontuacao_quantidade_reinteracao pontuacao_continuado estupro_vulneravel artigo incisos alineas  socioeduk_numero_processo_id id _destroy],
          socioeduk_medida_socioeducativas_attributes: %i[socioeduk_processo_id socioeduk_medida_socioeducativa_motivo_conclusao_id socioeduk_tipo_medida_socioeducativa_id socioeduk_situacao_cumprimento_id inicio fim_previsto periodo_dias socioeduk_circunstancia_id id _destroy],
          socioeduk_audiencias_attributes: %i[socioeduk_processo_id socioeduk_comarca_id numero_processo datahora observacao id _destroy],
          socioeduk_numero_processos_attributes: %i[socioeduk_processo_id principal status numero socioeduk_comarca_id cidade_id pontuacao_descumprimento_medida pontuacao_organizacao_criminosa id _destroy],
          socioeduk_processo_observacoes_attributes: %i[socioeduk_processo_id observacao id _destroy] )
    end
end
