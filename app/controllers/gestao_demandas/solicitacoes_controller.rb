# encoding: utf-8
class GestaoDemandas::SolicitacoesController < ApplicationController
  before_action :set_gestao_demandas_solicitacao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.gestao_demandas_solicitacao").pluralize, :gestao_demandas_solicitacoes_path
  add_breadcrumb "Detalhe", :gestao_demandas_solicitacao_path, only: [:show]
  add_breadcrumb "Novo", :new_gestao_demandas_solicitacao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_gestao_demandas_solicitacao_path, only: [:edit, :update]


  respond_to :html
  def index
    @gestao_demandas_solicitacoes = GestaoDemandas::Solicitacao.all.where(usuario_id: current_usuario.id)
  end

  def show
  end

  def new
    @url_path = params[:url_path]
    @gestao_demandas_solicitacao = GestaoDemandas::Solicitacao.new
  end

  def edit
  end

  def create
    @gestao_demandas_solicitacao = GestaoDemandas::Solicitacao.new(gestao_demandas_solicitacao_params)

    if @gestao_demandas_solicitacao.save
      EnviarEmailMailer.cadastrar_demanda_trello(solicitacao: @gestao_demandas_solicitacao).deliver_now
      flash[:notice] = "Solciitação enviada com sucesso."
      redirect_to params[:url_path]
    else
      flash[:notice] = "Ocorreu um erro ao enviar sua solicitação. Favor solicitar novamente."
      redirect_to params[:url_path]
    end
  end

  def update
    if @gestao_demandas_solicitacao.update(gestao_demandas_solicitacao_params)
      redirect_to gestao_demandas_solicitacoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @gestao_demandas_solicitacao.destroy
        format.html { redirect_to gestao_demandas_solicitacoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @gestao_demandas_solicitacao.errors.full_messages[0] if @gestao_demandas_solicitacao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestao_demandas_solicitacao
      @gestao_demandas_solicitacao = GestaoDemandas::Solicitacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gestao_demandas_solicitacao_params
        params.require(:gestao_demandas_solicitacao).permit(:titulo, :descricao, :usuario_id)
    end
end
