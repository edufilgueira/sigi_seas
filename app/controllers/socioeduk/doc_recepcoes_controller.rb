# encoding: utf-8
class Socioeduk::DocRecepcoesController < ApplicationController
  before_action :set_socioeduk_doc_recepcao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_doc_recepcao").pluralize, :socioeduk_doc_recepcoes_path
  add_breadcrumb "Detalhe", :socioeduk_doc_recepcao_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_doc_recepcao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_doc_recepcao_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_doc_recepcoes = Socioeduk::DocRecepcao.all
  end

  def show
  end

  def new
    @socioeduk_doc_recepcao = Socioeduk::DocRecepcao.new
  end

  def edit
  end

  def create
    @socioeduk_doc_recepcao = Socioeduk::DocRecepcao.new(socioeduk_doc_recepcao_params)

    respond_to do |format|
      if @socioeduk_doc_recepcao.save
        format.html { redirect_to socioeduk_doc_recepcoes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_doc_recepcao }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_doc_recepcao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_doc_recepcao.update(socioeduk_doc_recepcao_params)
      redirect_to socioeduk_doc_recepcoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_doc_recepcao.destroy
        format.html { redirect_to socioeduk_doc_recepcoes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_doc_recepcao.errors.full_messages[0] if @socioeduk_doc_recepcao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_doc_recepcao
      @socioeduk_doc_recepcao = Socioeduk::DocRecepcao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_doc_recepcao_params
        params.require(:socioeduk_doc_recepcao).permit(:doc_recepcao)
    end
end
