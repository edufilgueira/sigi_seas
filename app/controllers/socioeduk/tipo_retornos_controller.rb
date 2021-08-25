# encoding: utf-8
class Socioeduk::TipoRetornosController < SocioedukApplicationController
  before_action :set_socioeduk_tipo_retorno, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_retorno").pluralize, :socioeduk_tipo_retornos_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_retorno_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_retorno_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_retorno_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_retornos = Socioeduk::TipoRetorno.all
  end

  def show
  end

  def new
    @socioeduk_tipo_retorno = Socioeduk::TipoRetorno.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_retorno = Socioeduk::TipoRetorno.new(socioeduk_tipo_retorno_params)

    respond_to do |format|
      if @socioeduk_tipo_retorno.save
        format.html { redirect_to socioeduk_tipo_retornos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_retorno }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_retorno.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_retorno.update(socioeduk_tipo_retorno_params)
      redirect_to socioeduk_tipo_retornos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_retorno.destroy
        format.html { redirect_to socioeduk_tipo_retornos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_retorno.errors.full_messages[0] if @socioeduk_tipo_retorno.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_retorno
      @socioeduk_tipo_retorno = Socioeduk::TipoRetorno.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_retorno_params
        params.require(:socioeduk_tipo_retorno).permit(:descricao)
    end
end
