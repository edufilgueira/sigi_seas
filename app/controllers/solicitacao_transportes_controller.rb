# frozen_string_literal: true

class SolicitacaoTransportesController < TransporteApplicationController
  before_action :set_solicitacao_transporte, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.solicitacao_transporte').pluralize, :solicitacao_transportes_path
  add_breadcrumb 'Detalhe', :solicitacao_transporte_path, only: [:show]
  add_breadcrumb 'Novo', :new_solicitacao_transporte_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_solicitacao_transporte_path, only: %i[edit update]

  respond_to :html
  def index
    @solicitacoes_aguardando = SolicitacaoTransporte.where(status: nil)
    @solicitacoes_autorizadas = SolicitacaoTransporte.where(status: 'autorizado')
    @solicitacoes_em_andamento = SolicitacaoTransporte.where(status: 'andamento')
    @solicitacoes_finalizadas = SolicitacaoTransporte.where(status: 'finalizado')
    @solicitacoes_canceladas = SolicitacaoTransporte.where(status: 'cancelado')
    @solicitacao_transportes = SolicitacaoTransporte.all

    # area_id = current_usuario.try(:pessoa).try(:funcoes).try(:map, &:area).try(:map, &:to_param)
    area_id = current_usuario&.pessoa&.recursoshumanos_vinculo&.unidade_socioeducativa_area&.area&.id

    pessoa_id = current_usuario&.pessoa&.id

    @solicitacoes = if current_usuario.try(:pessoa).try(:funcoes).try(:map, &:nome).try(:include?, 'Gestor de transporte')
                      @q = @solicitacao_transportes.ransack(params[:q])
                      @resultado_busca = @q.result unless params[:q].blank?
                    elsif !current_usuario.try(:pessoa).try(:id).nil? && area_id.blank?
                      @solicitacoes_aguardando = @solicitacoes_aguardando.where(destinado_para_id: pessoa_id)
                      @solicitacoes_autorizadas = @solicitacoes_autorizadas.where(destinado_para_id: pessoa_id)
                      @solicitacoes_em_andamento = @solicitacoes_em_andamento.where(destinado_para_id: pessoa_id)
                      @solicitacoes_finalizadas = @solicitacoes_finalizadas.where(destinado_para_id: pessoa_id)
                      @solicitacoes_canceladas = @solicitacoes_canceladas.where(destinado_para_id: pessoa_id)
                      @solicitacao_transportes = @solicitacao_transportes.where(destinado_para_id: pessoa_id)
                    else
                      @solicitacoes_aguardando = @solicitacoes_aguardando.where(area_id: area_id)
                      @solicitacoes_autorizadas = @solicitacoes_autorizadas.where(area_id: area_id)
                      @solicitacoes_em_andamento = @solicitacoes_em_andamento.where(area_id: area_id)
                      @solicitacoes_finalizadas = @solicitacoes_finalizadas.where(area_id: area_id)
                      @solicitacoes_canceladas = @solicitacoes_canceladas.where(area_id: area_id)
                      @solicitacao_transportes = @solicitacao_transportes.where(area_id: area_id)
    end

    if current_usuario.try(:pessoa).try(:funcoes).try(:map, &:nome).try(:include?, 'Gestor de transporte')
      @solicitacoes = if params['status'] == 'autorizado'
                        @solicitacoes_autorizadas
                      # @status = "AUTORIZADO"
                      # @class = "primary"
                      elsif params['status'] == 'cancelado'
                        @solicitacoes_canceladas.order!(data_transporte: :desc, hora_solicitada: :asc)
                      # @status = "CANCELADO"
                      # @class = "danger"
                      elsif params['status'] == 'andamento'
                        @solicitacoes_em_andamento
                      # @status = "EM ANDAMENTO"
                      # @class = "warning"
                      elsif params['status'] == 'finalizado'
                        @solicitacoes_finalizadas.order!(data_transporte: :desc, hora_solicitada: :asc)
                      # @status = "FINALIZADO"
                      # @class = "success"
                      else
                        @solicitacoes_aguardando
        # @status = "EM ANALISE"
        # @class = "info"
      end
    end

    @solicitacoes = if current_usuario.try(:pessoa).try(:funcoes).try(:map, &:nome).try(:include?, 'Gestor de transporte')
                      @solicitacoes.order!(data_transporte: :asc, hora_solicitada: :asc).page(params[:page]).per(50)
                    else
                      @solicitacoes.order!(data_transporte: :desc, hora_solicitada: :desc).page(params[:page]).per(50)
    end
  end

  def show; end

  def new
    @solicitacao_transporte = SolicitacaoTransporte.new
  end

  def edit; end

  def autorizar
    @solicitacao_autorizada = SolicitacaoTransporte.find(params[:id])
    @solicitacao_autorizada.update_attributes(status: 'autorizado')
    emails = []
    emails.push(@solicitacao_autorizada&.usuario_solicitante&.email)
    emails.push(@solicitacao_autorizada&.destinado_para&.usuario&.email)
    @email_solicitante = emails
    unless @email_solicitante.nil?
      EnviarEmailMailer.autorizar_transporte(solicitacao: @solicitacao_autorizada, email: @email_solicitante).deliver_now
  end

    flash[:notice] = 'Autorizado com sucesso!'
    redirect_to action: :index
  end

  def dar_andamento
    @solicitacao_autorizada = SolicitacaoTransporte.find(params[:id]).update_attributes(status: 'andamento')

    flash[:notice] = 'Em andamento!'
    redirect_to solicitacao_transportes_path(status: 'autorizado')
  end

  def finalizar
    @solicitacao_autorizada = SolicitacaoTransporte.find(params[:id]).update_attributes(status: 'finalizado')

    flash[:notice] = 'Finalizado com sucesso!'
    redirect_to solicitacao_transportes_path(status: 'andamento')
  end

  def justificar_cancelamento
    @solicitacao_transporte_id = params[:id]

    respond_to do |format|
      format.js
    end
  end

  def salvar_justificativa_cancelamento
    @solicitacao_cancelada = SolicitacaoTransporte.find(params[:frm][:id])
    @solicitacao_cancelada.update_attributes(justificativa_cancelamento: params[:frm][:justificativa_cancelamento], status: params[:frm][:status])
    @email_solicitante = @solicitacao_cancelada.destinado_para.usuario.email
    EnviarEmailMailer.cancelar_transporte(solicitacao: @solicitacao_cancelada, email: @email_solicitante).deliver_now
    flash[:notice] = 'Cancelado com sucesso!'
    redirect_to solicitacao_transportes_path(status: 'autorizado')
  end

  def create
    @solicitacao_transporte = SolicitacaoTransporte.new(solicitacao_transporte_params)

    respond_to do |format|
      if @solicitacao_transporte.save
        if @email = current_usuario.email && !@email.nil?
          EnviarEmailMailer.solicitar_transporte(solicitacao: @solicitacao_transporte, email: @email).deliver_now
        end
        format.html { redirect_to solicitacao_transportes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @solicitacao_transporte }
      else
        format.html { render :new }
        format.json { render json: @solicitacao_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @solicitacao_transporte.update(solicitacao_transporte_params)
      redirect_to solicitacao_transportes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @solicitacao_transporte.destroy
        format.html { redirect_to solicitacao_transportes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        if @solicitacao_transporte.errors.present?
          flash[:error] = @solicitacao_transporte.errors.full_messages[0]
        end
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solicitacao_transporte
    @solicitacao_transporte = SolicitacaoTransporte.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def solicitacao_transporte_params
    params.require(:solicitacao_transporte).permit(:tipo_solicitacao_transporte_id, :area_id, :destinado_para_id, :data_transporte, :data_retorno, :hora_solicitada, :hora_prevista_retorno, :origem, :destino, :justificativa, :urgente, :justificativa_urgencia, :solicitante)
  end
end
