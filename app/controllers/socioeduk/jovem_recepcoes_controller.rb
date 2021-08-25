# frozen_string_literal: true

class Socioeduk::JovemRecepcoesController < SocioedukApplicationController
  before_action :set_socioeduk_jovem_recepcao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_jovem_recepcao').pluralize, :socioeduk_jovem_recepcoes_path
  add_breadcrumb 'Detalhe', :socioeduk_jovem_recepcao_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_jovem_recepcao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_jovem_recepcao_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_jovem_recepcoes = Socioeduk::GestaoVaga.ativos_recepcao
    # @socioeduk_jovem_recepcoes = Socioeduk::JovemRecepcao
    # .joins(:socioeduk_jovem, :socioeduk_gestao_vagas)
    # .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
    # .select('socioeduk_jovens.id id_jovem', 'socioeduk_jovens.nome nome_jovem', 'socioeduk_jovens.nome_mae nome_mae', 'socioeduk_jovem_recepcoes.datahora_apresentacao', 'socioeduk_jovem_recepcoes.status','tms.descricao')
    # .where('socioeduk_gestao_vagas.ativo = ? and socioeduk_gestao_vagas.status = ?', true, 'Recepcionado')
    # .group('id_jovem', 'nome_jovem, socioeduk_jovem_recepcoes.status, socioeduk_jovem_recepcoes.datahora_apresentacao, tms.descricao').order('nome_jovem')

    render :index
  end

  def buscar_jovem_recepcionado
    if !params[:frm].blank?
      @nome = params[:frm][:nome]
      @status = params[:frm][:status]

      where_nome = ''
      if (!@nome.blank?)
        where_nome = " AND socioeduk_jovens.nome ilike '%" + @nome + "%'"
      end

      where_status = ''
      if (!@status.blank?)
        where_status = " AND socioeduk_jovem_recepcoes.status = "+@status
      end

      @socioeduk_jovem_recepcoes = Socioeduk::JovemRecepcao
      .select('socioeduk_jovens.id id_jovem', 'socioeduk_jovens.nome nome_jovem', 'socioeduk_jovens.nome_mae nome_mae', 'socioeduk_jovem_recepcoes.datahora_apresentacao', 'socioeduk_jovem_recepcoes.status','tms.descricao')
      .joins(:socioeduk_jovem)
      .joins('left join socioeduk_tipo_medida_socioeducativas tms ON tms.id = socioeduk_jovem_recepcoes.socioeduk_tipo_medida_socioeducativa_id')
      .where("socioeduk_jovem_recepcoes.id not in
              (
              select socioeduk_jovem_recepcao_id from socioeduk_processos where socioeduk_jovem_recepcao_id = socioeduk_jovem_recepcoes.id
              ) 
              and socioeduk_jovens.deleted_at is null " + where_nome + where_status)
      .order('nome_jovem')
    end

    render :index
  end

  def recepcao_direta
    @socioeduk_jovem_recepcao = Socioeduk::JovemRecepcao.new
  end

  def show; end

  def new
    @socioeduk_jovem_recepcao = Socioeduk::JovemRecepcao.new
  end

  def edit; end

  def create
    if !params[:para_unidade_socioeducativa_id].blank?
      @socioeduk_jovem_recepcao = Socioeduk::JovemRecepcao.new(socioeduk_jovem_recepcao_params)
      
      Socioeduk::GestaoVaga.transaction do
        respond_to do |format|
          if @socioeduk_jovem_recepcao.save
            Socioeduk::GestaoVaga.incluir_gestao_vaga_recepcao_direta(current_usuario.id, @socioeduk_jovem_recepcao.id, params[:para_unidade_socioeducativa_id], params[:socioeduk_jovem_recepcao][:datahora_apresentacao])
            #Socioeduk::ConfiguracaoEmail.enviar_email_ao_admintir(params[:para_unidade_socioeducativa_id])
            format.html { redirect_to socioeduk_jovem_recepcoes_url, notice: I18n.t('messages.cadastro_sucesso') }
            format.json { render :show, status: :created, location: @socioeduk_jovem_recepcao }
          else
            format.html { render :recepcao_direta }
            format.json { render json: @socioeduk_jovem_recepcao.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      redirect_to controller: 'jovem_recepcoes', action: 'recepcao_direta'
    end
  end

  def update
    if @socioeduk_jovem_recepcao.update(socioeduk_jovem_recepcao_params)
      redirect_to socioeduk_jovem_recepcoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_recepcao.destroy
        format.html { redirect_to socioeduk_jovem_recepcoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        if @socioeduk_jovem_recepcao.errors.present?
          flash[:error] = @socioeduk_jovem_recepcao.errors.full_messages[0]
        end
        format.html { redirect_to :back }
      end
    end
  end

  def listar_recepcoes
    @recepcoes = Socioeduk::JovemRecepcao.where(socioeduk_jovem_id: params[:jovem_recepcao_id]).order(created_at: :desc)
  end

  def editar_recepcoes
    @recepcoes = Socioeduk::JovemRecepcao.where(socioeduk_jovem_id: params[:jovem_recepcao_id]).order(created_at: :desc)
  end

  def medida_meio_aberto
    @jovem_recepcao = Socioeduk::JovemRecepcao.find(params[:jovem_recepcao_id])
  end

  def editar_meio_aberto
    @jovem_recepcao = Socioeduk::JovemRecepcao.find(params[:jovem_recepcao_id])
  end

  def aplicar_medida_meio_aberto
    @jovem_recepcao = Socioeduk::JovemRecepcao.find(params[:frm][:socioeduk_jovem_recepcao_id]).update_attributes(socioeduk_tipo_medida_socioeducativa_id: params[:frm][:socioeduk_tipo_medida_socioeducativa_id], status: false, data_saida:params[:frm][:data_movimentacao])
    @gestao_vagas = Socioeduk::GestaoVaga.where(socioeduk_jovem_recepcao_id: params[:frm][:socioeduk_jovem_recepcao_id]).order(:created_at).last
    @gestao_vagas.update(ativo: false)
    Socioeduk::GestaoVaga.lancar_gestao_vaga_liberado('Liberado', current_usuario.id, @gestao_vagas.socioeduk_jovem_recepcao_id, @gestao_vagas.para_unidade_socioeducativa_id, params[:frm][:data_movimentacao])
    
    redirect_to socioeduk_jovem_recepcoes_url
  end
  
  def editar_medida_meio_aberto
    reativar_recepcao = params[:frm][:reativar_recepcao]
    #Se a opção reverter for selecionada
    if reativar_recepcao.to_i == 1
      # Altera o status para false e limpa o tipo de medida em aberto
      @jovem_recepcao = Socioeduk::JovemRecepcao.find(params[:frm][:socioeduk_jovem_recepcao_id]).update_attributes(socioeduk_tipo_medida_socioeducativa_id: nil, status: true, motivo_reversao: params[:frm][:motivo_reversao], usuario_id_reversao: current_usuario.id, data_saida:params[:frm][:data_movimentacao])
      # Reativar as recepções Recepcionado
      gestao_vagas_a = Socioeduk::GestaoVaga.where("status = 'Recepcionado' AND socioeduk_jovem_recepcao_id = ?",params[:frm][:socioeduk_jovem_recepcao_id])
      gestao_vagas_a.each do |gestao_vaga|
        gestao_vaga.ativo = true
        gestao_vaga.save
      end
      # Reativar as recepções com Admissão Direta
      gestao_vagas_a = Socioeduk::GestaoVaga.where("status = 'Admissão Direta' AND socioeduk_jovem_recepcao_id = ?",params[:frm][:socioeduk_jovem_recepcao_id])
      gestao_vagas_a.each do |gestao_vaga|
        gestao_vaga.ativo = true
        gestao_vaga.save
      end
      # Remover a movimentação gestão vagas de "Liberado"
      gestao_vagas = Socioeduk::GestaoVaga.where("status != 'Recepcionado' AND status != 'Admissão Direta' AND socioeduk_jovem_recepcao_id = ?",params[:frm][:socioeduk_jovem_recepcao_id])
      # Altera o status para voltar a primeira recepção que normalmente e "recepcionado" ou "Admissão Direta"
      gestao_vagas.each do |gestao_vaga|
        gestao_vaga.reversao = true
        gestao_vaga.usuario_id_reversao = current_usuario.id
        gestao_vaga.save
        gestao_vaga.destroy
      end
      redirect_to socioeduk_jovem_recepcoes_url
    else
      # Apenas edita o tipo de medida selecionado
      @jovem_recepcao = Socioeduk::JovemRecepcao.find(params[:frm][:socioeduk_jovem_recepcao_id]).update_attributes(socioeduk_tipo_medida_socioeducativa_id: params[:frm][:socioeduk_tipo_medida_socioeducativa_id], status: false)
      redirect_to socioeduk_jovem_recepcoes_url
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_socioeduk_jovem_recepcao
    @socioeduk_jovem_recepcao = Socioeduk::JovemRecepcao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_jovem_recepcao_params
    params.require(:socioeduk_jovem_recepcao).permit(:socioeduk_jovem_id, :antecedentes, :bo, :responsavel, :nome_responsavel, :telefone, :presenca_familiar_junto, :condutor_nome, :condutor_documento, :condutor_cargo, :oficio, :documentos_pessoais, :decisao, :corpo_delito, :certidao_antecedente_criminal, :kit_vestuario, :agredido, :recepcao_origem, :guia_cnj, :para_unidade_socioeducativa_id, :datahora_apresentacao, :representacao_ministerial, :socioeduk_doc_recepcoes_id)
  end
end
