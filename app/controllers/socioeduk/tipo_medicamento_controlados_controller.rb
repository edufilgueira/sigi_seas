# encoding: utf-8
class Socioeduk::TipoMedicamentoControladosController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_medicamento_controlado, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_medicamento_controlado").pluralize, :socioeduk_tipo_medicamento_controlados_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_medicamento_controlado_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_medicamento_controlado_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_medicamento_controlado_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_medicamento_controlados = Socioeduk::TipoMedicamentoControlado.all
  end

  def show
  end

  def new
    @socioeduk_tipo_medicamento_controlado = Socioeduk::TipoMedicamentoControlado.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_medicamento_controlado = Socioeduk::TipoMedicamentoControlado.new(socioeduk_tipo_medicamento_controlado_params)

    respond_to do |format|
      if @socioeduk_tipo_medicamento_controlado.save
        format.html { redirect_to socioeduk_tipo_medicamento_controlados_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_medicamento_controlado }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_medicamento_controlado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_medicamento_controlado.update(socioeduk_tipo_medicamento_controlado_params)
      redirect_to socioeduk_tipo_medicamento_controlados_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_medicamento_controlado.destroy
        format.html { redirect_to socioeduk_tipo_medicamento_controlados_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_medicamento_controlado.errors.full_messages[0] if @socioeduk_tipo_medicamento_controlado.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_medicamento_controlado
      @socioeduk_tipo_medicamento_controlado = Socioeduk::TipoMedicamentoControlado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_medicamento_controlado_params
        params.require(:socioeduk_tipo_medicamento_controlado).permit(:descricao)
    end
end
