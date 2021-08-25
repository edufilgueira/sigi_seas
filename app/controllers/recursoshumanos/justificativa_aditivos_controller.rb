# encoding: utf-8
class Recursoshumanos::JustificativaAditivosController < AdminApplicationController
  before_action :set_recursoshumanos_justificativa_aditivo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.recursoshumanos_justificativa_aditivo").pluralize, :recursoshumanos_justificativa_aditivos_path
  add_breadcrumb "Detalhe", :recursoshumanos_justificativa_aditivo_path, only: [:show]
  add_breadcrumb "Novo", :new_recursoshumanos_justificativa_aditivo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_recursoshumanos_justificativa_aditivo_path, only: [:edit, :update]


  respond_to :html
  def index
    @recursoshumanos_justificativa_aditivos = Recursoshumanos::JustificativaAditivo.all
  end

  def show
  end

  def new
    @recursoshumanos_justificativa_aditivo = Recursoshumanos::JustificativaAditivo.new
  end

  def edit
  end

  def create
    @recursoshumanos_justificativa_aditivo = Recursoshumanos::JustificativaAditivo.new(recursoshumanos_justificativa_aditivo_params)

    respond_to do |format|
      if @recursoshumanos_justificativa_aditivo.save
        format.html { redirect_to recursoshumanos_justificativa_aditivos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @recursoshumanos_justificativa_aditivo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_justificativa_aditivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_justificativa_aditivo.update(recursoshumanos_justificativa_aditivo_params)
      redirect_to recursoshumanos_justificativa_aditivos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_justificativa_aditivo.destroy
        format.html { redirect_to recursoshumanos_justificativa_aditivos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @recursoshumanos_justificativa_aditivo.errors.full_messages[0] if @recursoshumanos_justificativa_aditivo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recursoshumanos_justificativa_aditivo
      @recursoshumanos_justificativa_aditivo = Recursoshumanos::JustificativaAditivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recursoshumanos_justificativa_aditivo_params
        params.require(:recursoshumanos_justificativa_aditivo).permit(:descricao)
    end
end
