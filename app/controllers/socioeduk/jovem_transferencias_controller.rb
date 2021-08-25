# encoding: utf-8
class Socioeduk::JovemTransferenciasController < ApplicationController
  before_action :set_socioeduk_jovem_transferencia, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_jovem_transferencia").pluralize, :socioeduk_jovem_transferencias_path
  add_breadcrumb "Detalhe", :socioeduk_jovem_transferencia_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_jovem_transferencia_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_jovem_transferencia_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_jovem_transferencias = Socioeduk::JovemTransferencia.all
  end

  def show
  end

  def new
    @socioeduk_jovem_transferencia = Socioeduk::JovemTransferencia.new
  end

  def edit
  end

  def create
    @socioeduk_jovem_transferencia = Socioeduk::JovemTransferencia.new(socioeduk_jovem_transferencia_params)

    respond_to do |format|
      if @socioeduk_jovem_transferencia.save
        format.html { redirect_to socioeduk_jovem_transferencias_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_jovem_transferencia }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem_transferencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem_transferencia.update(socioeduk_jovem_transferencia_params)
      redirect_to socioeduk_jovem_transferencias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem_transferencia.destroy
        format.html { redirect_to socioeduk_jovem_transferencias_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_jovem_transferencia.errors.full_messages[0] if @socioeduk_jovem_transferencia.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_jovem_transferencia
      @socioeduk_jovem_transferencia = Socioeduk::JovemTransferencia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_jovem_transferencia_params
        params.require(:socioeduk_jovem_transferencia).permit(:socioeduk_jovem_id, :unidade_socioeducativa_id)
    end
end
