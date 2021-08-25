# encoding: utf-8
class Socioeduk::ProcessoNaturezasController < ApplicationController
  before_action :set_socioeduk_processo_natureza, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_processo_natureza").pluralize, :socioeduk_processo_naturezas_path
  add_breadcrumb "Detalhe", :socioeduk_processo_natureza_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_processo_natureza_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_processo_natureza_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_processo_naturezas = Socioeduk::ProcessoNatureza.all
  end

  def show
  end

  def new
    @socioeduk_processo_natureza = Socioeduk::ProcessoNatureza.new
  end

  def edit
  end

  def create
    @socioeduk_processo_natureza = Socioeduk::ProcessoNatureza.new(socioeduk_processo_natureza_params)

    respond_to do |format|
      if @socioeduk_processo_natureza.save
        format.html { redirect_to socioeduk_processo_naturezas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_processo_natureza }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_processo_natureza.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_processo_natureza.update(socioeduk_processo_natureza_params)
      redirect_to socioeduk_processo_naturezas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_processo_natureza.destroy
        format.html { redirect_to socioeduk_processo_naturezas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_processo_natureza.errors.full_messages[0] if @socioeduk_processo_natureza.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_processo_natureza
      @socioeduk_processo_natureza = Socioeduk::ProcessoNatureza.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_processo_natureza_params
        params.require(:socioeduk_processo_natureza).permit(:socioeduk_processo, :tipo_natureza, :artigo)
    end
end
