# encoding: utf-8
class Recursoshumanos::CargoAditivosController < AdminApplicationController
  before_action :set_recursoshumanos_cargo_aditivo, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.recursoshumanos_cargo_aditivo").pluralize, :recursoshumanos_cargo_aditivos_path
  add_breadcrumb "Detalhe", :recursoshumanos_cargo_aditivo_path, only: [:show]
  add_breadcrumb "Novo", :new_recursoshumanos_cargo_aditivo_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_recursoshumanos_cargo_aditivo_path, only: [:edit, :update]


  respond_to :html
  def index
    @recursoshumanos_cargo_aditivos = Recursoshumanos::CargoAditivo.all
  end

  def show
  end

  def new
    @recursoshumanos_cargo_aditivo = Recursoshumanos::CargoAditivo.new
    @cargo_id = params[:cargo]
    @contrato_id = params[:contrato]
    @quantidade = params[:quantidade]
    @aditivos = Recursoshumanos::Aditivo.where(recursoshumanos_contrato_id: @contrato_id)
  end

  def edit
  end

  def create
    @recursoshumanos_cargo_aditivo = Recursoshumanos::CargoAditivo.new(recursoshumanos_cargo_aditivo_params)

    # Verifica se existe cargo aditivo para este cargo. Caso exista ele considera a quantidade da ultima alteração no CargoAditivo e não a quantidade do Cargo.
    cargoAditivos = Recursoshumanos::CargoAditivo.where(recursoshumanos_cargo_id: recursoshumanos_cargo_aditivo_params[:recursoshumanos_cargo_id]).last
    qtd_anterior = recursoshumanos_cargo_aditivo_params[:qtd_anterior]
    qtd_adicionado = recursoshumanos_cargo_aditivo_params[:qtd_adicionado]
    operacao = recursoshumanos_cargo_aditivo_params[:operacao]

    # Verifica se tem CargoAditivo. Caso tenha ele considera a quantidade de qtd_atual do CargoAditivo e não do Cargo
    if (!cargoAditivos.nil?)
      qtd_anterior = cargoAditivos.qtd_atual
      @recursoshumanos_cargo_aditivo.qtd_anterior = cargoAditivos.qtd_atual
    end

    # O campo qtd_adicionado deve ser testado para evitar um erro de parse do codigo [Integer(qtd_anterior)]
    if (!qtd_adicionado.blank?)
      if (operacao == '+')
        qtd_atual = Integer(qtd_anterior) + Integer(qtd_adicionado)
      elsif (operacao == '-')
        qtd_atual = Integer(qtd_anterior) - Integer(qtd_adicionado)
      end
    end

    @recursoshumanos_cargo_aditivo.qtd_atual = qtd_atual
    respond_to do |format|
      if @recursoshumanos_cargo_aditivo.save
        # Atualiza a quantidade de cargo
        @recursoshumanos_cargo = Recursoshumanos::Cargo.find(recursoshumanos_cargo_aditivo_params[:recursoshumanos_cargo_id])
        @recursoshumanos_cargo.quantidade = qtd_atual
        @recursoshumanos_cargo.save
        format.html { redirect_to edit_recursoshumanos_contrato_path(params[:recursoshumanos_cargo_aditivo][:recursoshumanos_contrato_id]), notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @recursoshumanos_cargo_aditivo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_cargo_aditivo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_cargo_aditivo.update(recursoshumanos_cargo_aditivo_params)
      redirect_to recursoshumanos_cargo_aditivos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_cargo_aditivo.destroy
        format.html { redirect_to recursoshumanos_cargo_aditivos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @recursoshumanos_cargo_aditivo.errors.full_messages[0] if @recursoshumanos_cargo_aditivo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recursoshumanos_cargo_aditivo
      @recursoshumanos_cargo_aditivo = Recursoshumanos::CargoAditivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recursoshumanos_cargo_aditivo_params
        params.require(:recursoshumanos_cargo_aditivo).permit(:recursoshumanos_cargo_id, :recursoshumanos_aditivo_id, :qtd_anterior, :operacao, :qtd_adicionado)
    end
end
