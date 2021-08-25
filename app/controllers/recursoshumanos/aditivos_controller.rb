# encoding: utf-8
class Recursoshumanos::AditivosController < AdminApplicationController
  before_action :set_recursoshumanos_aditivo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.recursoshumanos_aditivo").pluralize, :recursoshumanos_aditivos_path
  add_breadcrumb "Detalhe", :recursoshumanos_aditivo_path, only: [:show]
  add_breadcrumb "Novo", :new_recursoshumanos_aditivo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_recursoshumanos_aditivo_path, only: [:edit, :update]


  respond_to :html
  def index
    @recursoshumanos_aditivos = Recursoshumanos::Aditivo.all
  end

  def show
  end

  def new
    @recursoshumanos_aditivo = Recursoshumanos::Aditivo.new
  end

  def edit
  end

  def create
    @recursoshumanos_aditivo = Recursoshumanos::Aditivo.new(recursoshumanos_aditivo_params)
    respond_to do |format|
      if @recursoshumanos_aditivo.save
        format.html { redirect_to recursoshumanos_aditivos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @recursoshumanos_aditivo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_aditivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_aditivo.update(recursoshumanos_aditivo_params)
      redirect_to recursoshumanos_aditivos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_aditivo.destroy
        format.html { redirect_to recursoshumanos_aditivos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @recursoshumanos_aditivo.errors.full_messages[0] if @recursoshumanos_aditivo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recursoshumanos_aditivo
      @recursoshumanos_aditivo = Recursoshumanos::Aditivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recursoshumanos_aditivo_params
        params.require(:recursoshumanos_aditivo).permit(:recursoshumanos_contrato_id, :recursoshumanos_justificativa_aditivo_id, :numero_processo, :descricao, :data, :anexo)
    end
end
