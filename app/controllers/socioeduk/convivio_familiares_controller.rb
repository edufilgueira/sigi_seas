# encoding: utf-8
class Socioeduk::ConvivioFamiliaresController < SocioedukApplicationController
  before_action :set_socioeduk_convivio_familiar, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_convivio_familiar").pluralize, :socioeduk_convivio_familiares_path
  add_breadcrumb "Detalhe", :socioeduk_convivio_familiar_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_convivio_familiar_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_convivio_familiar_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_convivio_familiares = Socioeduk::ConvivioFamiliar.all
  end

  def show
  end

  def new
    @socioeduk_convivio_familiar = Socioeduk::ConvivioFamiliar.new
  end

  def edit
  end

  def create
    @socioeduk_convivio_familiar = Socioeduk::ConvivioFamiliar.new(socioeduk_convivio_familiar_params)

    respond_to do |format|
      if @socioeduk_convivio_familiar.save
        format.html { redirect_to socioeduk_convivio_familiares_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_convivio_familiar }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_convivio_familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_convivio_familiar.update(socioeduk_convivio_familiar_params)
      redirect_to socioeduk_convivio_familiares_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_convivio_familiar.destroy
        format.html { redirect_to socioeduk_convivio_familiares_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_convivio_familiar.errors.full_messages[0] if @socioeduk_convivio_familiar.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_convivio_familiar
      @socioeduk_convivio_familiar = Socioeduk::ConvivioFamiliar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_convivio_familiar_params
        params.require(:socioeduk_convivio_familiar).permit(:descricao)
    end
end
