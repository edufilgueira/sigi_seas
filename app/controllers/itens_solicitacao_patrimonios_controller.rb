# encoding: utf-8
class ItensSolicitacaoPatrimoniosController < ApplicationController
  before_action :set_itens_solicitacao_patrimonio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.itens_solicitacao_patrimonio").pluralize, :itens_solicitacao_patrimonios_path
  add_breadcrumb "Detalhe", :itens_solicitacao_patrimonio_path, only: [:show]
  add_breadcrumb "Novo", :new_itens_solicitacao_patrimonio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_itens_solicitacao_patrimonio_path, only: [:edit, :update]


  respond_to :html
  def index
    @itens_solicitacao_patrimonios = ItensSolicitacaoPatrimonio.all
  end

  def show
  end

  def new
    @itens_solicitacao_patrimonio = ItensSolicitacaoPatrimonio.new
  end

  def edit
  end

  def create
    @itens_solicitacao_patrimonio = ItensSolicitacaoPatrimonio.new(itens_solicitacao_patrimonio_params)

    respond_to do |format|
      if @itens_solicitacao_patrimonio.save
        format.html { redirect_to itens_solicitacao_patrimonios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @itens_solicitacao_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @itens_solicitacao_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @itens_solicitacao_patrimonio.update(itens_solicitacao_patrimonio_params)
      redirect_to itens_solicitacao_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @itens_solicitacao_patrimonio.destroy
        format.html { redirect_to itens_solicitacao_patrimonios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @itens_solicitacao_patrimonio.errors.full_messages[0] if @itens_solicitacao_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itens_solicitacao_patrimonio
      @itens_solicitacao_patrimonio = ItensSolicitacaoPatrimonio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def itens_solicitacao_patrimonio_params
        params.require(:itens_solicitacao_patrimonio).permit(:solicitacao_patrimonio_id, :item_patrimonio_id, :quantidade_solicitada, :quantidade_entregue)
    end
end
