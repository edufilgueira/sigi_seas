# encoding: utf-8
class Socioeduk::MunicipiosController < SocioedukApplicationController
  before_action :set_socioeduk_municipio, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_municipio").pluralize, :socioeduk_municipios_path
  add_breadcrumb "Detalhe", :socioeduk_municipio_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_municipio_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_municipio_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_municipios = Socioeduk::Municipio.all
  end

  def show
  end

  def new
    @socioeduk_municipio = Socioeduk::Municipio.new
  end

  def edit
  end

  def create
    @socioeduk_municipio = Socioeduk::Municipio.new(socioeduk_municipio_params)

    respond_to do |format|
      if @socioeduk_municipio.save
        format.html { redirect_to socioeduk_municipios_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_municipio }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_municipio.update(socioeduk_municipio_params)
      redirect_to socioeduk_municipios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_municipio.destroy
        format.html { redirect_to socioeduk_municipios_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_municipio.errors.full_messages[0] if @socioeduk_municipio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_municipio
      @socioeduk_municipio = Socioeduk::Municipio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_municipio_params
        params.require(:socioeduk_municipio).permit(:descricao)
    end
end
