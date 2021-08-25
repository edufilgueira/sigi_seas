# encoding: utf-8
class Socioeduk::AudienciasController < ApplicationController
  before_action :set_socioeduk_audiencia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_audiencia").pluralize, :socioeduk_audiencias_path
  add_breadcrumb "Detalhe", :socioeduk_audiencia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_audiencia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_audiencia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_audiencias = Socioeduk::Audiencia.all
  end

  def show
  end

  def new
    @socioeduk_audiencia = Socioeduk::Audiencia.new
  end

  def edit
  end

  def create
    @socioeduk_audiencia = Socioeduk::Audiencia.new(socioeduk_audiencia_params)

    respond_to do |format|
      if @socioeduk_audiencia.save
        format.html { redirect_to socioeduk_audiencias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_audiencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_audiencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_audiencia.update(socioeduk_audiencia_params)
      redirect_to socioeduk_audiencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_audiencia.destroy
        format.html { redirect_to socioeduk_audiencias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_audiencia.errors.full_messages[0] if @socioeduk_audiencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_audiencia
      @socioeduk_audiencia = Socioeduk::Audiencia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_audiencia_params
        params.require(:socioeduk_audiencia).permit(:socioeduk_processo_id, :socioeduk_comarca_id, :numero_processo, :datahora, :observacao)
    end
end
