# encoding: utf-8
class Socioeduk::TipoVacinasController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_vacina, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_vacina").pluralize, :socioeduk_tipo_vacinas_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_vacina_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_vacina_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_vacina_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_vacinas = Socioeduk::TipoVacina.all
  end

  def show
  end

  def new
    @socioeduk_tipo_vacina = Socioeduk::TipoVacina.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_vacina = Socioeduk::TipoVacina.new(socioeduk_tipo_vacina_params)

    respond_to do |format|
      if @socioeduk_tipo_vacina.save
        format.html { redirect_to socioeduk_tipo_vacinas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_vacina }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_vacina.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_vacina.update(socioeduk_tipo_vacina_params)
      redirect_to socioeduk_tipo_vacinas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_vacina.destroy
        format.html { redirect_to socioeduk_tipo_vacinas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_vacina.errors.full_messages[0] if @socioeduk_tipo_vacina.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_vacina
      @socioeduk_tipo_vacina = Socioeduk::TipoVacina.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_vacina_params
        params.require(:socioeduk_tipo_vacina).permit(:descricao)
    end
end
