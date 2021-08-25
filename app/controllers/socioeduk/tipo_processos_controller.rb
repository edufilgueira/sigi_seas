# encoding: utf-8
class Socioeduk::TipoProcessosController < ApplicationController
  before_action :set_socioeduk_tipo_processo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_processo").pluralize, :socioeduk_tipo_processos_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_processo_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_processo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_processo_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_processos = Socioeduk::TipoProcesso.all
  end

  def show
  end

  def new
    @socioeduk_tipo_processo = Socioeduk::TipoProcesso.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_processo = Socioeduk::TipoProcesso.new(socioeduk_tipo_processo_params)

    respond_to do |format|
      if @socioeduk_tipo_processo.save
        format.html { redirect_to socioeduk_tipo_processos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_processo }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_processo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_processo.update(socioeduk_tipo_processo_params)
      redirect_to socioeduk_tipo_processos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_processo.destroy
        format.html { redirect_to socioeduk_tipo_processos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_processo.errors.full_messages[0] if @socioeduk_tipo_processo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_processo
      @socioeduk_tipo_processo = Socioeduk::TipoProcesso.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_processo_params
        params.require(:socioeduk_tipo_processo).permit(:descricao)
    end
end
